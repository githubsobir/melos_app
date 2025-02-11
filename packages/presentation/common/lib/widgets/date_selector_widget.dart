import 'package:common/path_images.dart';
import 'package:common/widgets/date_time_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:time_range/time_range.dart';

class DateSelectorWidget extends StatefulWidget {
  const DateSelectorWidget({
    super.key,
    required this.onRangeSelected,
  });

  final Function(
    PickerDateRange dateRange,
    TimeRangeResult timeRange,
  ) onRangeSelected;

  @override
  State<DateSelectorWidget> createState() => _DateSelectorWidgetState();
}

class _DateSelectorWidgetState extends State<DateSelectorWidget> {
  PickerDateRange dateRange = PickerDateRange(DateTime.now(), DateTime.now());
  TimeRangeResult timeRange = TimeRangeResult(
      const TimeOfDay(hour: 6, minute: 0), const TimeOfDay(hour: 6, minute: 0));

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
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
              "Даты поездки",
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
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "${DateFormat('dd.MM.yyyy').format(
                          dateRange.startDate ?? DateTime.now(),
                        )}, ${timeRange.start.format(context)}",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 12),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "${DateFormat('dd.MM.yyyy').format(
                          dateRange.endDate ?? DateTime.now(),
                        )}, ${timeRange.end.format(context)}",
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
                    );
                  },
                  child: Text(
                    "Изменять",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
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
