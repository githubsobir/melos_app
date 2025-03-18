import 'package:common/widgets/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/home_cubit.dart';
import 'package:intent_launcher/intent_launcher.dart';

class FilterBottomSheet extends StatefulWidget {
  final HomeCubit cubit;

  const FilterBottomSheet({super.key, required this.cubit});

  static Future<void> show({
    required BuildContext context,
    required HomeCubit cubit,
  }) async {
    var result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FilterBottomSheet(
          cubit: cubit,
        );
      },
    );
    if (result != null) {}
  }

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (context, scrollController) => Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          ), // Adjust radius as needed
        ),
        margin: const EdgeInsets.all(0),
        child: Container(
          margin: const EdgeInsets.only(top: 24),
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<HomeCubit, HomeState>(
            bloc: widget.cubit,
            builder: (context, state) {
              return ListView(
                controller: scrollController,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Тип кузова",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary),
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
                              itemCount: state.filter.categoryCounts.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      value: state.filter.categoryCounts[index]
                                          .isSelected,
                                      checkColor: Colors.white,
                                      onChanged: (value) {
                                        setState(() {
                                          state.filter.categoryCounts[index]
                                              .isSelected = value!;
                                        });
                                      },
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Text(
                                            state.filter.categoryCounts[index]
                                                .title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          Visibility(
                                            visible: state
                                                    .filter
                                                    .categoryCounts[index]
                                                    .count !=
                                                0,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4),
                                              child: Text(
                                                "(${state.filter.categoryCounts[index].count})",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondary),
                                              ),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Количество мест",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary),
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
                              itemCount:
                                  state.filter.passengerCapacityCounts.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      value: state
                                          .filter
                                          .passengerCapacityCounts[index]
                                          .isSelected,
                                      checkColor: Colors.white,
                                      onChanged: (value) {
                                        setState(() {
                                          state
                                              .filter
                                              .passengerCapacityCounts[index]
                                              .isSelected = value!;
                                        });
                                      },
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Text(
                                            state
                                                .filter
                                                .passengerCapacityCounts[index]
                                                .title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          Visibility(
                                            visible: state
                                                    .filter
                                                    .passengerCapacityCounts[
                                                        index]
                                                    .count !=
                                                0,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4),
                                              child: Text(
                                                "(${state.filter.passengerCapacityCounts[index].count})",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondary),
                                              ),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Город",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary),
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
                              itemCount: state.filter.cityCounts.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      value: state
                                          .filter.cityCounts[index].isSelected,
                                      checkColor: Colors.white,
                                      onChanged: (value) {
                                        setState(() {
                                          state.filter.cityCounts[index]
                                              .isSelected = value!;
                                        });
                                      },
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Text(
                                            state
                                                .filter.cityCounts[index].title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          Visibility(
                                            visible: state.filter
                                                    .cityCounts[index].count !=
                                                0,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4),
                                              child: Text(
                                                "(${state.filter.cityCounts[index].count})",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondary),
                                              ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseButton(
                        onPressed: () {
                          context.closeActiveScreen();
                          widget.cubit.recommendedCars(isRefreshed: true);
                        },
                        title: "Сохранить",
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
