
import 'package:common/l10n/build_context_extension.dart';
import 'package:dependency/dependencies/injector.dart';
import 'package:domain/model/booking/booking_current_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:main/booking/booking_cubit.dart';
import 'package:main/booking/item_booking.dart';
import 'package:main/booking/item_current_booking.dart';
import 'package:main/booking/review_bottom_sheet.dart';
import 'package:navigation/main_navigation_intents.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late BookingCubit cubit;
  final _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    cubit = BookingCubit(inject());
    cubit.bookingList();
    cubit.bookingCurrent();
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => cubit,
  child: Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.light
              ? const Color(0xFFF6F7F9)
              : const Color(0xFF061136),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(context.translations.booking),
        toolbarHeight: 72,

        bottom: TabBar(
          controller: tabController,
          padding: const EdgeInsets.all(16),
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 12,
              ),
          unselectedLabelStyle:
              Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
          tabs: [
            Tab(
              text: context.translations.current,
            ),
            Tab(
              text: context.translations.all,
            ),
          ],
        ),
      ),
      body: BlocConsumer<BookingCubit, BookingState>(
        builder: (context, state) {
          return

            state.loading? const Center(child: CupertinoActivityIndicator()):
            TabBarView(
            controller: tabController,
            children: [
              AnimatedList.separated(
                key: _listKey,
                initialItemCount: state.bookingCurrent.length,
                removedSeparatorBuilder: (BuildContext context, int index,
                    Animation<double> animation) {
                  return  const Divider(
                    color: Colors.teal,
                  );
                },
                itemBuilder: (context, index, animation) => SlideTransition(
                    position: animation.drive(
                      Tween<Offset>(
                        begin: const Offset(0.1, 0),
                        end: const Offset(0, 0),
                      ),
                    ),
                    child:
                        _buildItem(state.bookingCurrent[index], index, state)),
                separatorBuilder: (context, index, animation) => const Divider(
                  color: Color(0xFF658DF1),
                ),
              ),

              ListView.separated(
                itemBuilder: (context, index) =>
                    ItemBooking(
                  images: state.bookingList[index].photos ?? [],
                  carName:
                      "${state.bookingList[index].make} ${state.bookingList[index].model}",
                  registrationNumber:
                      state.bookingList[index].registrationNumber ?? "",
                  dailyRate: state.bookingList[index].dailyRate ?? "",
                  securityDeposit:
                      state.bookingList[index].securityDeposit ?? "",
                  totalAmount: state.bookingList[index].totalAmount ?? "",
                  status: state.bookingList[index].status ?? "",
                  startDate: state.bookingList[index].startDate ?? "",
                  endDate: state.bookingList[index].endDate ?? "",
                  ownerPhoneNumber:
                      state.bookingList[index].ownerPhoneNumber ?? "",
                  profilePage: state.bookingList[index].profilePage ?? "",
                  carOwner: state.bookingList[index].carOwner ?? "",
                  powerOfAttorney:
                      state.bookingList[index].powerOfAttorney ?? "",
                  contract: "15",//state.bookingList[index].contract.first ?? "",
                  insurance: state.bookingList[index].insurance ?? "",
                  isPending: state.bookingList[index].status == "pending",
                  finishBooking: () {
                    cubit.finishBooking(state.bookingList[index].id ?? 0);
                  },
                ),
                separatorBuilder: (context, index) => const Divider(
                  color: Color(0xFF658DF1),
                ),
                itemCount: state.bookingList.length,
              ),
            ],
          );
        },
        listener: (BuildContext context, BookingState state) {
          if (state.bookingIsFinished) {
            _showReviewBottomSheet(
              context: context,
              onReview: (rating, comment) {
                print("rating $rating comment $comment");
                cubit.createReview(
                  rating: rating,
                  comment: comment,
                );
              },
            );
          }
        },
      ),
    ),
);
  }

  void _removeItem(int index, BuildContext context, BookingState state) {
    final removedItem = state.bookingCurrent[index];
    state.bookingCurrent.removeAt(index);
    _listKey.currentState!.removeItem(
      index,
      (context, animation) => SlideTransition(
        position: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(-1.5, 0), // Chap tomonga chiqib ketadi
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        )),
        child: _buildItem(removedItem, index, state, removing: true),
      ),
      duration: const Duration(milliseconds: 400),
    );
  }

  Widget _buildItem(BookingCurrentModel item, int index, BookingState state,
      {bool removing = false}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ItemCurrentBooking(
        images: item.photos ?? [],
        dailyRate: item.dailyRate ?? "",
        securityDeposit: item.securityDeposit ?? "",
        totalAmount: item.totalAmount ?? "",
        status: item.status ?? "",
        startDate: item.startDate ?? "",
        endDate: item.endDate ?? "",
        isPending: item.status == "pending",
        cancel: () {
          showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                title: Text(
                  context.translations.cancel_order,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  context.translations.cancel_order2,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(false); // "Yo'q" javob qaytaradi
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: Text(
                            context.translations.no,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(true); // "Ha" javob qaytaradi
                            _removeItem(index, context, state);
                            cubit.cancelBooking(
                                state.bookingCurrent[index].id ?? 0);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            context.translations.yes,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
        booking: () {
          context
              .openScreen(ReceivingTheCarGoScreenIntent(
                  bookingId: state.bookingCurrent[index].id ?? 0))
              .then(
            (value) {
              if (value is bool && value == true) {
                cubit.bookingCurrent();
              }
            },
          );
        },
      ),
    );
  }

  void _showReviewBottomSheet({
    required BuildContext context,
    required Function(int rating, String comment) onReview,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (BuildContext bc) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ReviewBottomSheetContent(
            onReview: onReview,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    cubit.close(); // Cubit ni ham dispose qilish kerak
    super.dispose();
  }
}
