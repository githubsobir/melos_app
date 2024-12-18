import 'package:common/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:main/my_cars/create_car/create_car_cubit.dart';
import 'package:main/my_cars/create_car/page_1.dart';
import 'package:main/my_cars/create_car/page_2.dart';
import 'package:main/my_cars/create_car/page_3.dart';
import 'package:main/my_cars/create_car/page_4.dart';

class CreateCarInfoScreen extends StatelessWidget {
  CreateCarInfoScreen({super.key});

  final PageController controller = PageController(initialPage: 0);
  final CreateCarCubit cubit = CreateCarCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Мои машины"),
      ),
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  onPageChanged: (position) {
                    cubit.changePosition(position);
                  },
                  children: [
                    Page1(),
                    Page2(),
                    Page3(),
                    Page4(),
                  ],
                ),
              ),
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
                        cubit.changePosition(--cubit.position);
                        if (cubit.position == -1) {
                          context.closeActiveScreen();
                        } else {
                          controller.animateToPage(
                            cubit.position,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        }
                      },
                      child: Card(
                        elevation: 0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(
                                color: Theme.of(context).colorScheme.primary)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 6, bottom: 6),
                          child: Text(
                            cubit.position == 0 ? "Оставлять" : "Назад",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ),
                      ),
                    ),
                    BaseButton(
                        onPressed: () {
                          cubit.changePosition(++cubit.position);
                          if (cubit.position <= 3) {
                            controller.animateToPage(
                              cubit.position,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear,
                            );
                          } else {
                            // context.openScreen(LoginIntent());
                            context.closeActiveScreen(true);
                          }
                        },
                        title: "Следующий")
                  ],
                ),
              ),
              const SizedBox(
                height: 52,
              ),
            ],
          );
        },
      ),
    );
  }
}
