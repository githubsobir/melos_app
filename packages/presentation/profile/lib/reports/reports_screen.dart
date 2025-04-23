import 'package:common/extension.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:profile/reports/item_report.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final List<String> months = [
    'Yanvar',
    'Fevral',
    'Mart',
    'Aprel',
    'May',
    'Iyun'
  ];

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: months.length,
      child: Scaffold(
        backgroundColor:
            Theme.of(context).colorScheme.brightness == Brightness.light
                ? const Color(0xFFF6F7F9)
                : const Color(0xFF061136),
        appBar: AppBar(
          title: const Text("Reports"),
          backgroundColor:
              Theme.of(context).colorScheme.brightness == Brightness.light
                  ? const Color(0xFFF6F7F9)
                  : const Color(0xFF061136),
          bottom: TabBar(
            isScrollable: true,
            dividerHeight: 0,
            indicatorWeight: 0,
            padding: EdgeInsets.only(bottom: 16),
            labelPadding: const EdgeInsets.only(right: 16),
            indicatorPadding: EdgeInsets.zero,
            dividerColor: Colors.transparent,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            indicator: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(24),
            ),
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            tabs: months
                .mapIndexed(
                  (month, index) => Tab(
                    height: 54,
                    child: Card(
                      elevation: 1,
                      margin: const EdgeInsets.all(1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          24.0,
                        ), // Adjust radius as needed
                      ),
                      child: SizedBox(
                        height: 54,
                        width: 100,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            index % 2 == 0
                                ? Text(
                                    month,
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  )
                                : Container(),
                            Text(
                              month,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: ListView.builder(
            itemCount: 17,
            itemBuilder: (context, index) {
              return ItemReport();
            },
          ),
        ),
      ),
    );
  }
}
