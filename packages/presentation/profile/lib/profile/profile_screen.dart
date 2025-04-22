import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/extension.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:common/navigation/profile_navigation_intents.dart';
import 'package:common/path_images.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:profile/profile/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final cubit = ProfileCubit(inject())..userInformation();

  @override
  void initState() {
    cubit.userInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.light
              ? const Color(0xFFF6F7F9)
              : const Color(0xFF061136),
      body: RefreshIndicator(
        onRefresh: () {
          cubit.userInformation();
          return Future<void>.delayed(const Duration(seconds: 1));
        },
        child: BlocBuilder<ProfileCubit, ProfileState>(
          bloc: cubit..userInformation(),
          builder: (context, state) {
            if (state is UserInfoState) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      itemProfile(
                        context: context,
                        firstName: state.info.firstName ?? "",
                        middleName: state.info.middleName ?? "",
                        lastName: state.info.lastName ?? "",
                        phoneNumber: state.info.phoneNumber ?? "",
                        imagePath: "$BASE_URL_IMAGE${state.info.photo}",
                        onChange: () {
                          context
                              .openScreen(EditProfileIntent(state.info))
                              .then(
                            (value) {
                              if (value is bool && value == true) {
                                cubit.userInformation();
                              }
                            },
                          );
                        },
                        changeImage: () {
                          _showPicker(context);
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Card(
                        elevation: 0,
                        color: const Color(0xFFEEEAE9),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.asset(PathImages.flag),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    "O’ZBEKISTON\nУЗБЕКИСТАН\nUZBEKISTAN",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 8,
                                        ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          "HAYDOVCHILIK GUVOHNOMASI",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 10,
                                                  color:
                                                      const Color(0xff3563E9)),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "ВОДИТЕЛЬСКОЕ УДОСТОВЕРЕНИЕ  | DRIVER LICENSE",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(
                                                fontSize: 6,
                                                color: const Color(0xff3563E9),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "UZ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 170,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      right: 16,
                                      bottom: 16,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Visibility(
                                          visible:
                                              state.info.driverLicense?.photo !=
                                                  null,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 16),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "$BASE_URL_IMAGE${state.info.driverLicense?.photo}",
                                                width: 80,
                                                height: 120,
                                                fit: BoxFit.fill,
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        SizedBox(
                                                  width: 100,
                                                  height: 150,
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: SizedBox(
                                                          width: 24,
                                                          height: 24,
                                                          child:
                                                              CircularProgressIndicator(
                                                            value:
                                                                downloadProgress
                                                                    .progress,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary,
                                                            strokeWidth: 1,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: (state.info.driverLicense
                                                        ?.text ??
                                                    [])
                                                .mapIndexed(
                                                  (e, i) => Text(
                                                    "${i + 1}.$e",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium
                                                        ?.copyWith(
                                                            fontSize: 10),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Image.asset(
                                        PathImages.emblem,
                                        width: 48,
                                        height: 48,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          item(
                              context: context,
                              image: PathImages.changeProfile,
                              title: "Изменить профиль",
                              onTap: () {
                                context
                                    .openScreen(EditProfileIntent(state.info))
                                    .then(
                                  (value) {
                                    if (value is bool && value == true) {
                                      cubit.userInformation();
                                    }
                                  },
                                );
                              }),
                          item(
                              context: context,
                              image: PathImages.check,
                              title: "Счет",
                              onTap: () {
                                context.openScreen(CheckScreenIntent());
                              }),
                          item(
                              context: context,
                              image: PathImages.report,
                              title: "Снятие денег",
                              onTap: () {
                                context.openScreen(WithdrawingMoneyScreenIntent());
                              }),
                          item(
                              context: context,
                              image: PathImages.withdrawingMoney,
                              title: "Отчет",
                              onTap: () {
                                context.openScreen(ReportsScreenIntent());
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              );
            } else if (state is LoaderState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: const SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget itemProfile({
    required BuildContext context,
    required String firstName,
    required String middleName,
    required String lastName,
    required String phoneNumber,
    required String imagePath,
    required VoidCallback onChange,
    required VoidCallback changeImage,
  }) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 16,
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: changeImage,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: CachedNetworkImage(
                  imageUrl: imagePath,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      SizedBox(
                    width: 48,
                    height: 48,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: Theme.of(context).colorScheme.primary,
                              strokeWidth: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "$firstName $middleName $lastName",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Tel: $phoneNumber",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // onChange

  Widget item({
    required BuildContext context,
    required String image,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 90,
        width: 90,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
              side: const BorderSide(color: Color(0xff3671D9))),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 8,
              right: 8,
              bottom: 8,
            ),
            child: Column(
              children: [
                SvgPicture.asset(image),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: const Color(0xff3671D9),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text(context.translations.photo_library),
                  onTap: () {
                    _imgFromGallery();
                    Navigator.of(context).pop();
                  }),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text(context.translations.camera),
                onTap: () {
                  _imgFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
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
      cubit.uploadImage(img.path);
    }
  }

  // Future<double> getFileSize(File file) async {
  _imgFromCamera() async {
    final ImagePicker picker = ImagePicker();
    var img = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 640,
      maxWidth: 320,
      imageQuality: 50,
    );
    if (img != null) {
      cubit.uploadImage(img.path);
    }
  }
}
