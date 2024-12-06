import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DateSelectorWidget extends StatelessWidget {
  const DateSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 282,
      child: Stack(
        children: [
          Column(
            children: [
              itemSelector(context),
              const SizedBox(
                height: 24,
              ),
              itemSelector(context),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Theme.of(context).colorScheme.primary),
              child: SvgPicture.asset(PathImages.swap),
            ),
          )
        ],
      ),
    );
  }

  Widget itemSelector(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(PathImages.mark),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Высадка - Выкл.",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Места",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            "Ташкент",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 12,
                          )
                        ],
                      )
                    ],
                  ),
                  VerticalDivider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Дата",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            "20 Ноя 2024",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 12,
                          )
                        ],
                      )
                    ],
                  ),
                  VerticalDivider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Время",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            "01.00",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 12,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
