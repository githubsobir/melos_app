import 'package:common/navigation/auth_navigation_intents.dart';
import 'package:common/widgets/base_button.dart';
import 'package:flutter/material.dart';
import 'package:intent_launcher/intent_launcher.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  static Future<void> show({
    required BuildContext context,
  }) async {
    var result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const FilterBottomSheet();
      },
    );
    if (result != null) {}
  }

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  List<BaseA> list = [
    BaseA(
      "Тип кузова",
      [
        A(id: 1, count: 1, title: "Седан"),
        A(id: 2, count: 2, title: "Хетчбэк"),
        A(id: 3, count: 3, title: "Универсал"),
        A(id: 4, count: 4, title: "Купе"),
        A(id: 5, count: 5, title: "Пикап"),
        A(id: 6, count: 6, title: "Минивэн"),
        A(id: 7, count: 7, title: "Фургон"),
      ],
    ),
    BaseA(
      "Количество мест",
      [
        A(id: 1, count: 1, title: "1 человека"),
        A(id: 2, count: 2, title: "2 человека"),
        A(id: 3, count: 3, title: "3 человека"),
        A(id: 4, count: 4, title: "4 человека"),
        A(id: 5, count: 5, title: "5 человека"),
        A(id: 6, count: 6, title: "6 человека"),
      ],
    ),
    BaseA("Город", [
      A(id: 1, count: 0, title: "Москва"),
      A(id: 2, count: 0, title: "Санкт-Петербург"),
      A(id: 3, count: 0, title: "Казань"),
      A(id: 4, count: 0, title: "Екатеринбург"),
      A(id: 5, count: 0, title: "Новосибирск"),
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (context, scrollController) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 36,
          ),
          Expanded(
            child: Card(
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ), // Adjust radius as needed
              ),
              margin: const EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Expanded(
                      child: Column(
                        children: list
                            .map(
                              (e) => Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    e.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: e.list.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Checkbox(
                                                  value:
                                                      e.list[index].isSelected,
                                                  checkColor: Colors.white,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      e.list[index].isSelected =
                                                          value!;
                                                    });
                                                  },
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        e.list[index].title,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleSmall,
                                                      ),
                                                      Visibility(
                                                        visible: e.list[index]
                                                                .count !=
                                                            0,
                                                        child: Text(
                                                          "(${e.list[index].count})",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodySmall
                                                              ?.copyWith(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .secondary),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      Expanded(flex: 1, child: Container()),
                                    ],
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BaseButton(onPressed: () {
                          context.closeActiveScreen();
                        }, title: "Сохранить"),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BaseA {
  String name;
  List<A> list;

  BaseA(this.name, this.list);
}

class A {
  num id;
  num count;
  String title;
  bool isSelected = false;

  A({
    required this.id,
    required this.count,
    required this.title,
  });
}
