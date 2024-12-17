import 'package:flutter/material.dart';

class CreateCarInfoScreen extends StatelessWidget {
  const CreateCarInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Мои машины"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
            ),
            padding:
                const EdgeInsets.only(left: 62, right: 62, top: 24, bottom: 24),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 55,
                      width: 55,
                      child: CircularProgressIndicator(
                        value: 0.25,
                        backgroundColor: Color(0xFFD9D9D9),
                        color: Theme.of(context).colorScheme.primary,
                        strokeWidth: 8.0,
                      ),
                    ),
                    Text(
                      '1/4',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: const Color(0xFF658DF1)),
                    ),
                  ],
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Детали автомобиля',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: const Color(0xFF658DF1)),
                    ),
                    Text(
                      'Заполните данные ниже',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: const Color(0xFF90A3BF)),
                    ),
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
