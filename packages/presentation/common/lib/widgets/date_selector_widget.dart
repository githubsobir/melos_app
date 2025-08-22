import 'package:common/bloc/date_time_cubit.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/date_time_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:time_range/time_range.dart';

class DateSelectorWidget extends StatefulWidget {
  DateSelectorWidget({
    super.key,
    required this.onRangeSelected,
    this.bookedDates,
    required this.startDateTime,
    required this.endDateTime,
  });

  final List<DateTime>? bookedDates;
  final Function(
    PickerDateRange dateRange,
    TimeRangeResult timeRange,
  ) onRangeSelected;

  String startDateTime;
  String endDateTime;

  @override
  State<DateSelectorWidget> createState() => _DateSelectorWidgetState();
}

class _DateSelectorWidgetState extends State<DateSelectorWidget> {
  // PickerDateRange dateRange = PickerDateRange(
  //
  //     context.read<DateTimeCubit>().state!.startTime??
  //     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 0),
  //     context.read<DateTimeCubit>().state!.endTime??
  //     DateTime(DateTime.now().year, DateTime.now().month,
  //         DateTime.now().day + 1, 6, 0));
  //
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //
  // }

  @override
  Widget build(BuildContext context) {
    PickerDateRange dateRange = PickerDateRange(
        context.read<DateTimeCubit>().state!.startTime ??
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, 6, 0),
        context.read<DateTimeCubit>().state!.endTime ??
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day + 1, 6, 0));
    TimeRangeResult timeRange = TimeRangeResult(
        const TimeOfDay(hour: 06, minute: 00),
        const TimeOfDay(hour: 06, minute: 00));
    context
        .read<DateTimeCubit>()
        .setDateTime(dateRange.startDate!, dateRange.endDate!);

    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0), // Adjust radius as needed
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 16,
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(context.translations.travel_dates,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary)),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                      color: const Color(0xFFC3D4E9).withOpacity(0.4),
                    ),
                  ),
                  child: SvgPicture.asset(
                    PathImages.calendar,
                    height: 26,
                    width: 26,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.startDateTime.isEmpty
                            ? "${DateFormat('dd.MM.yyyy').format(
                                dateRange.startDate ?? DateTime.now(),
                              )}, ${timeRange.start.format(context)}"
                            : DateFormat('dd.MM.yyyy HH:mm')
                                .format(DateTime.parse(widget.startDateTime))
                                .toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 12),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        widget.endDateTime.isEmpty
                            ? "${DateFormat('dd.MM.yyyy').format(
                                dateRange.endDate ?? DateTime.now(),
                              )}, ${timeRange.end.format(context)}"
                            : DateFormat('dd.MM.yyyy  HH:mm')
                                .format(DateTime.parse(widget.endDateTime))
                                .toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    DateTimePickerBottomSheet.show(


                      context: context,

                      onRangeSelected: (dateRange, timeRange) {

                        widget.onRangeSelected(dateRange, timeRange);
                        setState(() {
                          dateRange = dateRange;
                          timeRange = timeRange;
                        });
                      },
                      bookedDates: widget.bookedDates??[],
                    );

                  },
                  child: Text(
                    context.translations.change,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DateSelectorWidget2 extends StatefulWidget {
  DateSelectorWidget2({
    super.key,
    required this.onRangeSelected,
    this.bookedDates,
    required this.startDateTime,
    required this.endDateTime,
  });

  final List<DateTime>? bookedDates;
  final Function(
    PickerDateRange dateRange,
    TimeRangeResult timeRange,
  ) onRangeSelected;

  String startDateTime;
  String endDateTime;

  @override
  State<DateSelectorWidget> createState() => _DateSelectorWidgetState();
}

class _DateSelector2WidgetState extends State<DateSelectorWidget> {
  PickerDateRange dateRange = PickerDateRange(
      DateTime.now(),
      DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day + 1));
  TimeRangeResult timeRange = TimeRangeResult(
      const TimeOfDay(hour: 06, minute: 00),
      const TimeOfDay(hour: 06, minute: 00));

  @override
  void initState() {
    super.initState();

    context
        .read<DateTimeCubit>()
        .setDateTime(dateRange.startDate!, dateRange.endDate!);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0), // Adjust radius as needed
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 16,
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              context.translations.travel_dates,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                      color: const Color(0xFFC3D4E9).withOpacity(0.4),
                    ),
                  ),
                  child: SvgPicture.asset(
                    PathImages.calendar,
                    height: 26,
                    width: 26,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.startDateTime.isEmpty
                            ? "${DateFormat('dd.MM.yyyy').format(
                                dateRange.startDate ?? DateTime.now(),
                              )}, ${timeRange.start.format(context)}"
                            : DateFormat('dd.MM.yyyy HH:mm')
                                .format(DateTime.parse(widget.startDateTime))
                                .toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 12),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        widget.endDateTime.isEmpty
                            ? "${DateFormat('dd.MM.yyyy').format(
                                dateRange.endDate ?? DateTime.now(),
                              )}, ${timeRange.end.format(context)}"
                            : DateFormat('dd.MM.yyyy  HH:mm')
                                .format(DateTime.parse(widget.endDateTime))
                                .toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    DateTimePickerBottomSheet.show(
                      context: context,
                      onRangeSelected: (dateRange, timeRange) {
                        widget.onRangeSelected(dateRange, timeRange);
                        setState(() {
                          this.dateRange = dateRange;
                          this.timeRange = timeRange;
                        });
                      },
                      bookedDates: widget.bookedDates,
                    );
                  },
                  child: Text(
                    context.translations.change,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
