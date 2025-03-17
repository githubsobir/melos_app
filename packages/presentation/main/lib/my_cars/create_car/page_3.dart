import 'package:common/widgets/textfield3.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: double.infinity,
      // color: Colors.red,
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
                        backgroundColor: Color(0xFFD9D9D9),
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
                        "Оплата и цены",
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
                  "Цена",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
              const SizedBox(width: 170, child: TextField3(hint: "80 000"))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Описание",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          Expanded(
            child: TextField(
              // controller: controller,
              maxLines: 6,
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
                hintText: "Описание",
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
            ),
          )
        ],
      ),
    );
  }
}
