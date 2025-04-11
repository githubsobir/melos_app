import 'package:common/l10n/build_context_extension.dart';
import 'package:dependency/dependencies/injector.dart';
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

  final cubit = BookingCubit(inject())
    ..bookingList()
    ..bookingCurrent();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          tabs: const [
            Tab(
              text: "ТЕКУЩИЕ",
            ),
            Tab(
              text: "ВСЕ",
            ),
          ],
        ),
      ),
      body: BlocConsumer<BookingCubit, BookingState>(
        bloc: cubit,
        builder: (context, state) {
          return TabBarView(
            controller: tabController,
            children: [
              ListView.separated(
                itemBuilder: (context, index) => ItemCurrentBooking(
                  images: state.bookingCurrent[index].photos ?? [],
                  dailyRate: state.bookingCurrent[index].dailyRate ?? "",
                  securityDeposit:
                      state.bookingCurrent[index].securityDeposit ?? "",
                  totalAmount: state.bookingCurrent[index].totalAmount ?? "",
                  status: state.bookingCurrent[index].status ?? "",
                  startDate: state.bookingCurrent[index].startDate ?? "",
                  endDate: state.bookingCurrent[index].endDate ?? "",
                  isPending: state.bookingCurrent[index].status == "pending",
                  cancel: () {
                    cubit.cancelBooking(state.bookingCurrent[index].id ?? 0);
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
                separatorBuilder: (context, index) => const Divider(
                  color: Color(0xFF658DF1),
                ),
                itemCount: state.bookingCurrent.length,
              ),
              ListView.separated(
                itemBuilder: (context, index) => ItemBooking(
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
                  isPending: state.bookingList[index].status == "pending",
                  finishBooking: () {
                    cubit.finishBooking(state.bookingList[index].id ?? 0);
                  },
                ),
                separatorBuilder: (context, index) => const Divider(
                  color: Color(0xFF658DF1),
                ),
                itemCount: state.bookingList.length,
              )
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
}
