import 'dart:io';

import 'package:common/path_images.dart';
import 'package:common/widgets/textfield3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class Page4 extends StatefulWidget {
  final ValueChanged<String> onChangedPort;
  final ValueChanged<String> onChangedUniqueId;
  final ValueChanged<String> onChangedDocument;

  const Page4({
    super.key,
    required this.onChangedPort,
    required this.onChangedUniqueId,
    required this.onChangedDocument,
  });

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  final List<String> radioButtons = [
    "yes",
    "no",
  ];

  String selectedRadio = "yes";
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          value: 1.0,
                          backgroundColor: Color(0xFFD9D9D9),
                          color: Theme.of(context).colorScheme.primary,
                          strokeWidth: 8.0,
                        ),
                      ),
                      Text(
                        '4/4',
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
                          "Страхование и документы",
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
            Row(
              children: [
                SvgPicture.asset(PathImages.lampOn),
                Expanded(
                  child: Text(
                    "Для сдачи автомобиля в аренду необходима установка GPS!",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "GPS-данные",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Порт",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                SizedBox(
                    width: 170,
                    child: TextField3(
                      hint: "21073",
                      keyboardType: TextInputType.number,
                      onChanged: widget.onChangedPort,
                    ))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Уникальный ID",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                SizedBox(
                    width: 170,
                    child: TextField3(
                      hint: "357454075150068",
                      keyboardType: TextInputType.number,
                      onChanged: widget.onChangedUniqueId,
                    ))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "У вас есть страховка автомобиля?",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    value: radioButtons[0],
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: Text(
                      "Да",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    groupValue: selectedRadio,
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        selectedRadio = value ?? "";
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: radioButtons[1],
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: Text(
                      "Нет",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    groupValue: selectedRadio,
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        selectedRadio = value ?? "";
                      });
                    },
                  ),
                ),
              ],
            ),
            Visibility(
              visible: selectedRadio == "yes",
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Загрузить подтверждение регистрации",
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
                          _showPicker(context);
                        },
                        child: image == null
                            ? SvgPicture.asset(PathImages.upload)
                            : Container(
                                padding: const EdgeInsets.all(2),
                                width:
                                    MediaQuery.sizeOf(context).width / 3 - 32,
                                height: 64,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.file(
                                    File(image?.path ?? ""),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                      Expanded(child: Container())
                    ],
                  )
                ],
              ),
            ),
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
      widget.onChangedDocument(img.path);
      setState(() {
        image = img;
      });
    }
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
      widget.onChangedDocument(img.path);
      setState(() {
        image = img;
      });
    }
  }
}
