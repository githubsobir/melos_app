import 'package:flutter/material.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

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
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.light
              ? const Color(0xFFF6F7F9)
              : const Color(0xFF061136),
      appBar: AppBar(
        title: const Text("Reports"),
        bottom: TabBar(
          controller: tabController,
          dividerHeight: 0,
          dividerColor: Colors.transparent,

          tabs: ["one", "two"]
              .map(
                (e) => Tab(
                  text: e,
                  icon: Text("data"),
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
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 16,
          ),
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Card(
                  child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text("data"),
                  ],
                ),
              )),
            );
          },
        ),
      ),
    );
  }
}
