import 'dart:io';

import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main/car_info/car_image_selector_widget.dart';
import 'package:main/payment_details/receiving_the_car/receiving_the_car_cubit.dart';

class ReceivingTheCarScreen extends StatelessWidget {
  ReceivingTheCarScreen({super.key, required this.bookingId});

  // final ReceivingTheCarCubit cubit = ReceivingTheCarCubit(inject());
  final ReceivingTheCarCubit cubit = ReceivingTheCarCubit();

  final num bookingId;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor:
            Theme.of(context).colorScheme.brightness == Brightness.light
                ? const Color(0xFFF6F7F9)
                : const Color(0xFF061136),
        appBar: AppBar(
          title: const Text("Получение автомобиля"),
        ),
        body: BlocBuilder<ReceivingTheCarCubit, ReceivingTheCarState>(
          bloc: cubit,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Card(
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: CarImageSelectorWidget(
                          images: [
                            "/backend/media/car_photos/db/cars_image/photo141.jpg",
                            "/backend/media/car_photos/db/cars_image/photo158.jpg",
                            "/backend/media/car_photos/db/cars_image/photo158.jpg",
                            "/backend/media/car_photos/db/cars_image/photo78.jpg",
                            "/backend/media/car_photos/db/cars_image/photo78.jpg",
                            "/backend/media/car_photos/db/cars_image/photo257.jpg"
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Отчет",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Срок аренды",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                  ),
                                ),
                                Text(
                                  "3",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Стоимость за день",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                  ),
                                ),
                                Text(
                                  "10300 сум",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Залог",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                  ),
                                ),
                                Text(
                                  "23000 сум",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Общая сумма аренды",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Text(
                                  "100500 сум",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Владелец автомобиля",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  PathImages.nearbyCircled,
                                  height: 44,
                                  width: 44,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Azizbek Karimov",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  PathImages.phoneCircled,
                                  height: 44,
                                  width: 44,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "+998 93 935 0321",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  PathImages.nearbyCircledGrey,
                                  height: 44,
                                  width: 44,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Tashkent, Shaykhontohur, Qoratosh 33A",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          decoration: TextDecoration.underline,
                                          color: const Color(0xff0404B9)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Загрузите файл доверенности",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 24, right: 24),
                              child: Text(
                                "Поддерживаемые форматы: JPEG, PNG, PDG (до 10 МБ)",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(color: const Color(0xffA9ACB4)),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            GestureDetector(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: Container(
                                child: state.imageFile == null
                                    ? SvgPicture.asset(
                                  PathImages.uploadImage,
                                )
                                    : Image.file(File(state.imageFile?.path ?? "")),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: 190,
                      child: BaseButton(onPressed: () {}, title: "Отправить"),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  _imgFromGallery() async {
    final ImagePicker picker = ImagePicker();
    var img = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 640,
      maxWidth: 320,
      imageQuality: 50,
    );
    if (img != null) {
      cubit.uploadImage(img);
    }
  }

  // Future<double> getFileSize(File file) async {
  //   int bytes = await file.length();
  //   if (bytes <= 0) return 0;
  //   // var i = (log(bytes) / log(1024)).floor();
  //   return (bytes*10 / pow(1024, 2));
  // }

  _imgFromCamera() async {
    final ImagePicker picker = ImagePicker();
    var img = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 640,
      maxWidth: 320,
      imageQuality: 100,
    );
    if (img != null) {
      cubit.uploadImage(img);
    }
  }
}
