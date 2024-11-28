import 'package:common/base_button.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/onboarding/onboarding_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController controller = PageController(initialPage: 0);
  final OnboardingCubit cubit = OnboardingCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          return Column(
            children: [
              Expanded(child: Container()),
              SizedBox(
                height: 400,
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  onPageChanged: (position) {
                    cubit.changePosition(position);
                  },
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              height: 200,
                              width: 200,
                              PathImages.onboarding1,
                            ),
                            Text(
                              "Надежная платформа",
                              style: Theme.of(context).textTheme.bodyMedium!,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Свяжитесь с проверенными владельцами\n автомобилей и используйте безопасные варианты оплаты. Наша платформа обеспечивает безопасную и надежную транзакцию как для арендаторов, так и для владельцев",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: const Color(0xFF90A3BF)),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              height: 200,
                              width: 200,
                              PathImages.onboarding1,
                            ),
                            Text(
                              "Надежная платформа",
                              style: Theme.of(context).textTheme.bodyMedium!,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Свяжитесь с проверенными владельцами\n автомобилей и используйте безопасные варианты оплаты. Наша платформа обеспечивает безопасную и надежную транзакцию как для арендаторов, так и для владельцев",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: const Color(0xFF90A3BF)),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              height: 200,
                              width: 200,
                              PathImages.onboarding1,
                            ),
                            Text(
                              "Надежная платформа",
                              style: Theme.of(context).textTheme.bodyMedium!,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Свяжитесь с проверенными владельцами\n автомобилей и используйте безопасные варианты оплаты. Наша платформа обеспечивает безопасную и надежную транзакцию как для арендаторов, так и для владельцев",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: const Color(0xFF90A3BF)),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BaseButton(
                      onPressed: () {
                        cubit.changePosition(++cubit.position);
                        if (cubit.position <= 2) {
                          controller.animateToPage(
                            cubit.position,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        } else {
                          print("next screen");
                        }
                      },
                      title: cubit.position<2
                          ? context.translations.next
                          : context.translations.begin,
                    ),
                  ],
                ),
              )),
            ],
          );
        },
      ),
    );
  }
}
