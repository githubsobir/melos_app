import 'package:common/l10n/build_context_extension.dart';
import 'package:flutter/material.dart';

class ItemReport extends StatefulWidget {
  const ItemReport({super.key});

  @override
  State<ItemReport> createState() => _ItemReportState();
}

class _ItemReportState extends State<ItemReport> {
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Card(
          elevation: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Chevrolet Malibu 2 | 01 A 123 AA",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Summa: 1 200 000 sum",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff128B3E)),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isOpened = !isOpened;
                        });
                      },
                      child: isOpened
                          ? const Icon(Icons.keyboard_arrow_up_sharp)
                          : const Icon(Icons.keyboard_arrow_down_sharp),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: isOpened,
                child: Column(
                  children: [
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16, top: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  context.translations.date_of_receipt,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "12 нояб. 2025 г.",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  context.translations.return_date,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "18 нояб. 2025 г.",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
