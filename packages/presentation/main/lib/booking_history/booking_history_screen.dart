import 'dart:developer';

import 'package:common/l10n/build_context_extension.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main/booking_history/booking_history_cubit.dart';
import 'package:main/booking_history/item_booking_history.dart';

class BookingHistoryScreen extends StatelessWidget {
  BookingHistoryScreen({super.key});

  final cubit = BookingHistoryCubit(inject())..bookingHistory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translations.booking_history,
        ),
      ),

      body: RefreshIndicator(
        onRefresh: () {
          cubit.bookingHistory();
          return Future<void>.delayed(const Duration(seconds: 1));
        },
        child: BlocBuilder<BookingHistoryCubit, BookingHistoryState>(
          bloc: cubit,
          builder: (context, state) {
            return (state is HistoryState)
                ? ListView.builder(
                    itemCount: state.histories.length,

                    itemBuilder: (context, index) {
                      log("#######");
                      log(state.histories.length.toString());
                      log(state.histories[index].photo.toString());
                      log(state.histories[index].make.toString());
                      log(state.histories[index].model.toString());
                      log(state.histories[index].startDate.toString());
                      log(state.histories[index].endDate.toString());
                      log("#######");
                      return ItemBookingHistory(
                        carImage: state.histories[index].photo ?? "",
                        carName:
                            "${state.histories[index].make} ${state.histories[index].model}",
                        fromDate: state.histories[index].startDate ?? "",
                        toDate: state.histories[index].endDate ?? "",
                      );
                    },
                  )
                : (state is LoadingState)
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width,
                        child: const SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                        ),
                      );
          },
        ),
      ),
    );
  }
}
