import 'package:common/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:main/booking/item_top_bottom.dart';
import 'package:main/car_info/car_image_selector_widget.dart';

class Page5 extends StatefulWidget {
  const Page5({
    super.key,
  });

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      color: Theme.of(context).colorScheme.brightness == Brightness.light
          ? const Color(0xFFF6F7F9)
          : const Color(0xFF061136),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Card(
              // elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CarImageSelectorWidget(
                  images: [
                    "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mikebirdy-170811.jpg&fm=jpg",
                    "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mikebirdy-170811.jpg&fm=jpg",
                    "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mikebirdy-170811.jpg&fm=jpg",
                    "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mikebirdy-170811.jpg&fm=jpg",
                    "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mikebirdy-170811.jpg&fm=jpg",
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppLocalizations.of(context).car_detail,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ItemTopBottom(
                            leftText: "Модель",
                            rightText: "Malibu 2 Turbo",
                          ),
                        ),
                        Expanded(
                          child: ItemTopBottom(
                            leftText: "Модель",
                            rightText: "Malibu 2 Turbo",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ItemTopBottom(
                            leftText: "Модель",
                            rightText: "Malibu 2 Turbo",
                          ),
                        ),
                        Expanded(
                          child: ItemTopBottom(
                            leftText: "Модель",
                            rightText: "Malibu 2 Turbo",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
