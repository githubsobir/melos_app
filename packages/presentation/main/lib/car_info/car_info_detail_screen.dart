import 'package:common/path_images.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      appBar: AppBar(
        title: SvgPicture.asset(
          PathImages.logo,
        ),
      ),
      body: BlocBuilder(
        bloc: cubit..getCarDetail(carId),
        builder: (context, state) {
          if (state is CarDetailState) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 16),
              child: CarImageSelectorWidget(
                images: state.carDetail.photos ?? [],
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
