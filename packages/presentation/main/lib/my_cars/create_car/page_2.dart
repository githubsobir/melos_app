import 'dart:io';

import 'package:common/path_images.dart';
import 'package:common/widgets/textfield3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class Page2 extends StatefulWidget {
  final ValueChanged<String> onChangedYear;
  final ValueChanged<String> onChangedMileage;
  final ValueChanged<String> onChangedFuelCapacity;
  final Function(List<String> photos) onChangedPhotos;

  const Page2({
    super.key,
    required this.onChangedYear,
    required this.onChangedMileage,
    required this.onChangedFuelCapacity,
    required this.onChangedPhotos,
  });

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<XFile> allImages = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 16,
              ),
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
                bottom: 24,
              ),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 55,
                        width: 55,
                        child: CircularProgressIndicator(
                          value: 0.50,
                          backgroundColor: const Color(0xFFD9D9D9),
                          color: Theme.of(context).colorScheme.primary,
                          strokeWidth: 8.0,
                        ),
                      ),
                      Text(
                        '2/4',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: const Color(0xFF658DF1)),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Состояние транспортного средства',
                          textAlign: TextAlign.end,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: const Color(0xFF658DF1)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Год выпуска",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
                SizedBox(
                    width: 170,
                    child: TextField3(
                      hint: "2025",
                      keyboardType: TextInputType.number,
                      onChanged: widget.onChangedYear,
                    ))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Пробег",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
                SizedBox(
                    width: 170,
                    child: TextField3(
                      hint: "12 000 км",
                      keyboardType: TextInputType.number,
                      onChanged: widget.onChangedMileage,
                    ))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Объем топливного бака",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
                SizedBox(
                    width: 170,
                    child: TextField3(
                      hint: "4",
                      keyboardType: TextInputType.number,
                      onChanged: widget.onChangedFuelCapacity,
                    ))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              // height: 180,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 8.0,
                children: allImages.map((image) {
                  return Container(
                    padding: const EdgeInsets.all(2),
                    width: MediaQuery.sizeOf(context).width / 3 - 32,
                    height: 64,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.file(
                        File(image.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Загрузите фото автомобиля",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Поддерживаемые форматы: JPEG, PNG, PDG (до 10 МБ)",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: const Color(0xffA9ACB4)),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    if (allImages.length < 6) {
                      _imgFromSelector();
                    }
                  },
                  child: SvgPicture.asset(PathImages.upload),
                ),
                Expanded(child: Container())
              ],
            )
          ],
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
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
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
      widget.onChangedPhotos(allImages.map((e) => e.path).toList());
      setState(() {
        allImages.add(img);
      });
    }
  }

  _imgFromSelector() async {
    final ImagePicker picker = ImagePicker();
    var img = await picker.pickMultiImage(
      maxHeight: 640,
      maxWidth: 320,
      imageQuality: 50,
      limit: 6,
    );
    widget.onChangedPhotos(allImages.map((e) => e.path).toList());
    setState(() {
      allImages = img;
    });
  }

  _imgFromCamera() async {
    final ImagePicker picker = ImagePicker();
    var img = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 640,
      maxWidth: 320,
      imageQuality: 50,
    );
    if (img != null) {
      widget.onChangedPhotos(allImages.map((e) => e.path).toList());
      setState(() {
        allImages.add(img);
      });
    }
  }
}
