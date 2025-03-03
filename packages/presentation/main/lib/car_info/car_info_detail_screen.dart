import 'package:common/items/item_car_popular.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:common/widgets/date_selector_widget.dart';
import 'package:common/widgets/pickub_and_return_widget.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:main/car_info/car_image_selector_widget.dart';
import 'package:main/car_info/car_info_detail_cubit.dart';
import 'package:main/car_info/review_card.dart';
import 'package:navigation/main_navigation_intents.dart';
import 'package:navigation/my_cars_intents.dart';

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
                  if ((state.carDetail.photos ?? []).isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Card(
                        elevation: 0,
                        margin: const EdgeInsets.all(0),
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
                    ),
                  ////////////////////////
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 16),
                    child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.all(0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
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
                  ////////////////////////
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 4,
                    ),
                    child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
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
                                    context.translations.car_type,
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    (state.carDetail.category ?? ""),
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    context.translations.capacity,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "${(state.carDetail.passengerCapacity ?? 0)}",
                                    textAlign: TextAlign.end,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    context.translations.steering,
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    (state.carDetail.transmission ?? ""),
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Бензин",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "${(state.carDetail.fuelCapacity ?? 0)}",
                                    textAlign: TextAlign.end,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ////////////////////////
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 4,
                    ),
                    child: DateSelectorWidget(
                      onRangeSelected: (dateRange, timeRange) {
                        print(
                            "xaxaaxa ${dateRange.toString()} - ${timeRange.toString()}");
                      },
                    ),
                  ),
                  ////////////////////////
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 4,
                    ),
                    child: PickupAndReturnWidget(),
                  ),
                  ////////////////////////
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 4,
                    ),
                    child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.all(0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                            10.0,
                          ),
                          bottomRight: Radius.circular(
                            10.0,
                          ),
                        ), // Adjust radius as needed
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 16,
                          bottom: 16,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${(state.carDetail.originalPrice ?? 0)}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                  Text(
                                    "сум/день",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "${(state.carDetail.dailyRate ?? 0)}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            BaseButton(
                                onPressed: () {
                                  context.openScreen(PaymentDetailsIntent());
                                },
                                title: context.translations.rent)
                          ],
                        ),
                      ),
                    ),
                  ),
                  ////////////////////////
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 16,
                    ),
                    child: ReviewCard(
                      reviews: state.carDetail.reviews ?? [],
                    ),
                  ),
                  ////////////////////////
                  Visibility(
                      visible: (state.carDetail.recommendCars ?? []).isNotEmpty,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  context.translations.recommendation_car,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                Text(
                                  context.translations.view_all,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 280,
                            child: ListView.builder(
                              itemCount:
                                  (state.carDetail.recommendCars ?? []).length,
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(right: 24),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: ItemCarPopular(
                                  carImage:
                                      "$BASE_URL_IMAGE${(state.carDetail.recommendCars ?? [])[index].photo}",
                                  carName:
                                      "${(state.carDetail.recommendCars ?? [])[index].make}",
                                  carType:
                                      "${(state.carDetail.recommendCars ?? [])[index].category}",
                                  price: ((state.carDetail.recommendCars ??
                                              [])[index]
                                          .originalPrice ??
                                      ""),
                                  fullPrice: ((state.carDetail.recommendCars ??
                                              [])[index]
                                          .originalPrice ??
                                      ""),
                                  onPressed: () {
                                    context.openScreen(CarInfoDetailIntent(
                                      carId: (state.carDetail.recommendCars ??
                                                  [])[index]
                                              .id ??
                                          0,
                                    ));
                                  },
                                  passengerCapacity:
                                      ((state.carDetail.recommendCars ??
                                                      [])[index]
                                                  .passengerCapacity ??
                                              0)
                                          .toInt(),
                                  fuelCapacity:
                                      ((state.carDetail.recommendCars ??
                                                      [])[index]
                                                  .fuelCapacity ??
                                              0)
                                          .toInt(),
                                  onLike: (isLiked) {
                                    cubit.likeCar(
                                        ((state.carDetail.recommendCars ??
                                                        [])[index]
                                                    .id ??
                                                0)
                                            .toInt(),
                                        isLiked);
                                  },
                                  isLiked: ((state.carDetail.recommendCars ??
                                              [])[index]
                                          .liked ??
                                      false),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))
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
