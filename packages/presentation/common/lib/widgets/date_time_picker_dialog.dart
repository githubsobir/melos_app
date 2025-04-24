import 'package:common/widgets/base_button.dart';
import 'package:flutter/material.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:time_range/time_range.dart';

class DateTimePickerBottomSheet extends StatefulWidget {
  const DateTimePickerBottomSheet({super.key, required this.bookedDates});

  final List<DateTime>? bookedDates;

  static Future<void> show({
    required BuildContext context,
    required Function(PickerDateRange, TimeRangeResult) onRangeSelected,
    required List<DateTime>? bookedDates,
  }) async {
    var result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DateTimePickerBottomSheet(bookedDates: bookedDates);
      },
    );
    if (result != null) {
      onRangeSelected(result["dateRange"], result["timeRange"]);
    }
  }

  @override
  State<DateTimePickerBottomSheet> createState() =>
      _DateTimePickerBottomSheetState();
}

class _DateTimePickerBottomSheetState extends State<DateTimePickerBottomSheet> {
  PickerDateRange? dateRange;
  TimeRangeResult? timeRange;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 24,
        ),
        Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
            ), // Adjust radius as needed
          ),
          margin: EdgeInsets.all(0),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              SfDateRangePicker(
                selectionMode: DateRangePickerSelectionMode.range,
                backgroundColor: Colors.transparent,
                enablePastDates: false,
                selectableDayPredicate: (date) => widget.bookedDates != null
                    ? !widget.bookedDates!.any(
                        (element) =>
                            element.year == date.year &&
                            element.month == date.month &&
                            element.day == date.day,
                      )
                    : true,
                endRangeSelectionColor: Theme.of(context).colorScheme.primary,
                selectionTextStyle: const TextStyle(color: Colors.white),
                monthCellStyle: DateRangePickerMonthCellStyle(
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontWeight: FontWeight.w600)),
                headerStyle: DateRangePickerHeaderStyle(
                  backgroundColor: Colors.transparent,
                  textAlign: TextAlign.center,
                  textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF658DF1),
                      ),
                ),
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  setState(() {
                    dateRange = args.value as PickerDateRange;
                  });
                },
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            6,
                          ),
                          side: BorderSide(
                            color: Theme.of(context).hintColor.withOpacity(0.3),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 8,
                          bottom: 8,
                        ),
                        child: Text(
                          DateFormat('dd.MM.yyyy').format(
                            dateRange?.startDate ?? DateTime.now(),
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontSize: 14,
                                color:
                                    Theme.of(context).colorScheme.brightness ==
                                            Brightness.light
                                        ? Colors.black
                                        : Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    child: Text("до"),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            6,
                          ),
                          side: BorderSide(
                            color: Theme.of(context).hintColor.withOpacity(0.3),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 8,
                          bottom: 8,
                        ),
                        child: Text(
                          maxLines: 1,
                          DateFormat('dd.MM.yyyy').format(
                            dateRange?.endDate ?? DateTime.now(),
                          ),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontSize: 14,
                                color:
                                    Theme.of(context).colorScheme.brightness ==
                                            Brightness.light
                                        ? Colors.black
                                        : Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              TimeRange(
                fromTitle: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'PICKUP',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                toTitle: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'RETURN',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                titlePadding: 16,
                textStyle: Theme.of(context).textTheme.bodySmall,
                activeTextStyle: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                borderColor: Theme.of(context).hintColor.withOpacity(0.3),
                activeBorderColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Colors.transparent,
                activeBackgroundColor: Theme.of(context).colorScheme.primary,
                firstTime: const TimeOfDay(hour: 6, minute: 00),
                lastTime: const TimeOfDay(hour: 23, minute: 00),
                timeStep: 30,
                timeBlock: 30,
                onRangeCompleted: (range) {
                  setState(() {
                    timeRange = range;
                  });
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.closeActiveScreen();
                      },
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            6,
                          ), // Adjust radius as needed
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 8,
                            bottom: 8,
                          ),
                          child: Text(
                            "Отмена",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 18,
                                  color: Theme.of(context)
                                              .colorScheme
                                              .brightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: BaseButton(
                        onPressed: () {
                          if (dateRange?.startDate != null &&
                              dateRange?.endDate != null &&
                              timeRange != null) {
                            context.closeActiveScreen({
                              "dateRange": dateRange,
                              "timeRange": timeRange
                            });
                          }
                        },
                        title: "Установить"),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
