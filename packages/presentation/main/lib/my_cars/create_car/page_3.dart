import 'package:common/l10n/build_context_extension.dart';
import 'package:common/widgets/textfield3.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  final ValueChanged<String> onChangedDailyRate;
  final ValueChanged<String> onChangedDescription;

  const Page3({
    super.key,
    required this.onChangedDailyRate,
    required this.onChangedDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 16,
              ),
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
                bottom: 24,
              ),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 55,
                        width: 55,
                        child: CircularProgressIndicator(
                          value: 0.75,
                          backgroundColor: const Color(0xFFD9D9D9),
                          color: Theme.of(context).colorScheme.primary,
                          strokeWidth: 8.0,
                        ),
                      ),
                      Text(
                        '3/4',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: const Color(0xFF658DF1)),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          context.translations.payment_and_prices,
                          textAlign: TextAlign.end,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: const Color(0xFF658DF1)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    context.translations.price,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
                SizedBox(
                    width: 170,
                    child: TextField3(
                      hint: "80 000",
                      onChanged: onChangedDailyRate,
                      keyboardType: TextInputType.number,
                    ))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              context.translations.description,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            TextField(
              // controller: controller,
              maxLines: 6,
              onChanged: onChangedDescription,
              style: Theme.of(context).textTheme.labelMedium,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 8,
                  bottom: 8,
                ),
                filled: true,
                hintText: context.translations.description,
                hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Color(0xFF658DF1)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Color(0xFF658DF1)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
