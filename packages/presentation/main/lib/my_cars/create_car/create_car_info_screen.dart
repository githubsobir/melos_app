import 'package:common/widgets/base_button.dart';
import 'package:common/widgets/base_loader_builder.dart';
import 'package:common/widgets/custom_functions.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:main/my_cars/create_car/create_car_cubit.dart';
import 'package:main/my_cars/create_car/page_0.dart';
import 'package:main/my_cars/create_car/page_1.dart';
import 'package:main/my_cars/create_car/page_2.dart';
import 'package:main/my_cars/create_car/page_3.dart';
import 'package:main/my_cars/create_car/page_4.dart';
import 'package:main/my_cars/create_car/page_5.dart';

class CreateCarInfoScreen extends StatelessWidget {
  CreateCarInfoScreen({super.key});

  final PageController controller = PageController(initialPage: 0);
  final CreateCarCubit cubit = CreateCarCubit(inject());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Мои машины"),
      ),
      body: BlocConsumer<CreateCarCubit, CreateCarState>(
        listener: (context, state) {
          print(state.position);
          if (state.isEmpty) {
            showToast("Пожалуйста, заполните все поля.");
          }else
          if (state.error.isNotEmpty) {
            showToast(state.error);
          } else if (state.position == 0) {
            context.closeActiveScreen();
          } else if (state.position <= 5) {
            controller.animateToPage(
              state.position,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
            );
          } else {
            showToast("Автомобиль успешно создан");
            context.closeActiveScreen();
          }
        },
        bloc: cubit,
        builder: (context, state) {
          print("state ${state.isLoading}");
          return BaseLoaderBuilder(
            hasLoading: state.isLoading,
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    controller: controller,
                    children: [
                      Page0(
                        onStart: () {
                          cubit.changePositionToRight();
                        },
                      ),
                      Page1(
                        onChangedMake: cubit.onChangedMake,
                        onChangedModel: cubit.onChangeModel,
                        onChangedRegNumber: cubit.onChangedRegNumber,
                        onChangedCity: cubit.onChangedCity,
                        onChangedTransmission: cubit.onChangedTransmission,
                        onChangedPassengerCapacity:
                            cubit.onChangedPassengerCapacity,
                        onChangedLocations: cubit.onChangedLocations,
                      ),
                      Page2(
                        onChangedYear: cubit.onChangedYear,
                        onChangedMileage: cubit.onChangedMileage,
                        onChangedFuelCapacity: cubit.onChangedFuelCapacity,
                        onChangedPhotos: cubit.onChangedPhotos,
                      ),
                      Page3(
                        onChangedDailyRate: cubit.onChangedDailyRate,
                        onChangedDescription: cubit.onChangedDescription,
                      ),
                      Page4(
                        onChangedPort: cubit.onChangedPort,
                        onChangedUniqueId: cubit.onChangedUniqueId,
                        onChangedDocument: cubit.onChangedDocument,
                      ),
                      Page5(
                        carModel: state.carModel,
                        onCreate: () {
                          cubit.carCreateProcessFinal();
                        },
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: state.position != 0 && state.position != 5,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                cubit.changePositionToLeft();
                              },
                              child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)),
                                child: Container(
                                  width: 145,
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    top: 8,
                                    bottom: 8,
                                  ),
                                  child: Text(
                                    state.position == 1 ? "Оставлять" : "Назад",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 18,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            BaseButton(
                                width: 145,
                                onPressed: () {
                                  cubit.changePositionToRight();
                                },
                                title:
                                    state.position < 4 ? "Следующий" : "Обзор")
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 52,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
