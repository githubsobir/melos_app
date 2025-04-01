import 'package:common/widgets/base_button.dart';
import 'package:flutter/material.dart';

class ConnectionBottomSheet extends StatelessWidget {
  const ConnectionBottomSheet({super.key});

  static Future<void> show({
    required BuildContext context,
  }) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const Wrap(children: [ConnectionBottomSheet()],);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
            ), // Adjust radius as needed
          ),
          margin: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                width: 64,
                height: 64,
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              ),
              const Text(
                "Платеж обрабатывается",
                textAlign: TextAlign.center,
              ),
              BaseButton(onPressed: () {}, title: "Повторить попытку")
            ],
          ),
        ),
      ),
    );
  }
}
