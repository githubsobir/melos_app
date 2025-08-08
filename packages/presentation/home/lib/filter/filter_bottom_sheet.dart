import 'package:common/l10n/build_context_extension.dart';
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
      // backgroundColor: Colors.transparent,
      enableDrag: true,
      isScrollControlled: true,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.transparent),
      ),

      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.9,
          padding: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: FilterBottomSheet(
            cubit: cubit,
          ),
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
  void initState() {
    super.initState();
    // Serverdan filter ma'lumotlarini olish
    widget.cubit.filter();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55,
        elevation: 0,
        actions: [
          InkWell(
              onTap: () {
                setState(() {
                  widget.cubit.clearFilters();
                });
              },
              child:  Column(
                children: [
                  const Icon(
                    Icons.clear,
                    size: 32,
                  ),

                  Text(context.translations.clear),
                ],
              )),
          const SizedBox(width: 20),
        ],
        leading: InkWell(
            onTap: () {
              context.closeActiveScreen();
            },
            child: const Icon(
              Icons.keyboard_arrow_down_sharp,
              size: 34,
            )),
      ),
      body: SafeArea(
        child: Container(
          // margin: const EdgeInsets.only(top: 24),
          padding:
              const EdgeInsets.only(top: 0, bottom: 16, left: 16, right: 16),
          child: BlocBuilder<HomeCubit, HomeState>(
            bloc: widget.cubit,
            builder: (context, state) {
              return ListView(

                // controller: scrollController,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.translations.body_type,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      const SizedBox(height: 15),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 50,
                                crossAxisSpacing: 10),
                        shrinkWrap: true,
                        itemCount: state.filter.categoryCounts.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: state
                                      .filter.categoryCounts[index].isSelected,
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
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*0.3,

                                        child: Text(
                                          state
                                              .filter.categoryCounts[index].title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                          maxLines: 1,

                                          overflow: TextOverflow.fade,
                                          softWrap: true,
                                        ),
                                      ),
                                      // Visibility(
                                      //   visible: (state
                                      //               .filter
                                      //               .categoryCounts[index]
                                      //               .count ??
                                      //           0) !=
                                      //       0,
                                      //   child: Padding(
                                      //     padding:
                                      //         const EdgeInsets.only(left: 4),
                                      //     child: Text(
                                      //       "(${state.filter.categoryCounts[index].count})",
                                      //       style: Theme.of(context)
                                      //           .textTheme
                                      //           .bodySmall
                                      //           ?.copyWith(
                                      //               color: Theme.of(context)
                                      //                   .colorScheme
                                      //                   .secondary),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        context.translations.number_of_seats,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      const SizedBox(height: 15),
                      GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 50,
                            crossAxisSpacing: 10),
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
                                      visible: (state
                                                  .filter
                                                  .passengerCapacityCounts[
                                                      index]
                                                  .count ??
                                              0) !=
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
                    ],
                  ),
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        context.translations.city,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      const SizedBox(height: 15),
                      GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 50,
                            crossAxisSpacing: 10),
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
                                      visible: (state
                                                  .filter
                                                  .cityCounts[index]
                                                  .count ??
                                              0) !=
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
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    context.translations.price,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: Theme.of(context).hintColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      context.translations
                          .max_price_sum("${state.filter.maxPrice ?? 5000000}"),
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Theme.of(context).hintColor),
                    ),
                  ),
                  Slider(
                    inactiveColor: Theme.of(context).colorScheme.secondary,
                    value: (state.filter.maxPrice ?? 5000000).toDouble(),
                    min: 100000,
                    max: 5000000,
                    divisions: 98,
                    onChanged: (value) {
                      setState(() {
                        // Qiymatni 50,000 ga yaxlitlash
                        state.filter.maxPrice = (value / 50000).round() * 50000;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseButton(
                        onPressed: () {
                          context.closeActiveScreen();
                          widget.cubit.recommendedCars(isRefreshed: true);
                        },
                        title: context.translations.save,
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
