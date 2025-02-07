import 'package:common/path_images.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main/car_info/car_image_selector_widget.dart';
import 'package:main/car_info/car_info_detail_cubit.dart';

class CarInfoDetailScreen extends StatelessWidget {
  CarInfoDetailScreen({super.key, required this.carId});

  final num carId;

  final cubit = CarInfoDetailCubit(inject());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.light
              ? const Color(0xFFF6F7F9)
              : const Color(0xFF061136),
      appBar: AppBar(
        title: SvgPicture.asset(
          PathImages.logo,
        ),
      ),
      body: BlocBuilder(
        bloc: cubit..getCarDetail(carId),
        builder: (context, state) {
          if (state is CarDetailState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: CarImageSelectorWidget(
                        images: state.carDetail.photos ?? [],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Card(
                      elevation: 0,
                      // margin: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "${state.carDetail.make} ${state.carDetail.model}",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                                SvgPicture.asset(
                                  PathImages.share,
                                  height: 24,
                                  width: 24,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                (state.carDetail.liked ?? false)
                                    ? SvgPicture.asset(
                                        PathImages.favouriteOn,
                                        height: 24,
                                        width: 24,
                                      )
                                    : SvgPicture.asset(
                                        PathImages.favouriteOff,
                                        height: 24,
                                        width: 24,
                                      ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating:
                                      (state.carDetail.averageRating ?? 0)
                                          .toDouble(),
                                  minRating: 1,
                                  itemCount: 5,
                                  itemSize: 18,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 1.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "440+ рецензентов",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              (state.carDetail.description ?? ""),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Card(
                      elevation: 0,
                      // margin: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "${state.carDetail.make} ${state.carDetail.model}",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                                SvgPicture.asset(
                                  PathImages.share,
                                  height: 24,
                                  width: 24,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                (state.carDetail.liked ?? false)
                                    ? SvgPicture.asset(
                                        PathImages.favouriteOn,
                                        height: 24,
                                        width: 24,
                                      )
                                    : SvgPicture.asset(
                                        PathImages.favouriteOff,
                                        height: 24,
                                        width: 24,
                                      ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating:
                                      (state.carDetail.averageRating ?? 0)
                                          .toDouble(),
                                  minRating: 1,
                                  itemCount: 5,
                                  itemSize: 18,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 1.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "440+ рецензентов",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Новый Chevrolet Malibu отличается более агрессивным, динамичным дизайном с изогнутыми линиями и обтекаемой формой. Его фирменная двойная решетка радиатора сочетается с более узкими светодиодными фарами. Кузов, схожий с моделями Impala и Camaro, предлагает улучшенную .",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
