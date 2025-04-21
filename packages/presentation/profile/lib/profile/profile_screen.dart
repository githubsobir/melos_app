import 'package:cached_network_image/cached_network_image.dart';
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
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        child: SvgPicture.asset(PathImages.chat),
        onPressed: () {},
      ),
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
                      imagePath: "$BASE_URL_IMAGE${state.info.photo}",
                      onChange: () {
                        context.openScreen(EditProfileIntent(state.info)).then(
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
                    SizedBox(
                      height: 16,
                    ),
                    item(
                      context: context,
                      title: context.translations.contact_phone,
                      content: state.info.phoneNumber ?? "",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    item(
                      context: context,
                      title: context.translations.pinfl,
                      content: state.info.passportPinfl ?? "",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    item(
                      context: context,
                      title: context.translations.drivers_license,
                      content: "state.info.driverLicense ?? """,
                    ),
                  ],
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
    required String imagePath,
    required VoidCallback onChange,
    required VoidCallback changeImage,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0), // Adjust radius as needed
      ),
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
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      SizedBox(
                    width: 100,
                    height: 100,
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
                    firstName,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    lastName,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    middleName,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              height: 100,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                      onPressed: onChange,
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget item({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0), // Adjust radius as needed
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 36,
          right: 36,
          top: 16,
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium,
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
