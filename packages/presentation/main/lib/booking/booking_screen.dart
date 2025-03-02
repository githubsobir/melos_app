import 'package:common/l10n/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:main/booking/item_booking.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.light
              ? const Color(0xFFF6F7F9)
              : const Color(0xFF061136),
      appBar: AppBar(
        title: Text(context.translations.booking),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => const ItemBooking(),
        separatorBuilder: (context, index) => const Divider(
          color: Color(0xFF658DF1),
        ),
        itemCount: 3,
      ),
    );
  }
}
