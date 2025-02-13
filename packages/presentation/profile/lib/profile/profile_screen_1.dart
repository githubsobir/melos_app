// import 'package:common/l10n/build_context_extension.dart';
// import 'package:common/path_images.dart';
// import 'package:common/widgets/base_button.dart';
// import 'package:flutter/material.dart';
// import 'package:intent_launcher/intent_launcher.dart';
// import 'package:navigation/profile_navigation_intents.dart';
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:
//           Theme.of(context).colorScheme.brightness == Brightness.light
//               ? const Color(0xFFF6F7F9)
//               : const Color(0xFF061136),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 24.0,
//                 right: 24.0,
//                 top: 16,
//                 bottom: 16.0,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 20),
//                     child: Row(
//                       children: [
//                         Text(
//                           "Фамилия",
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyMedium
//                               ?.copyWith(fontWeight: FontWeight.w700),
//                         ),
//                         Expanded(child: Container()),
//                         Text(
//                           "Kuchimov",
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 20),
//                     child: Row(
//                       children: [
//                         Text(
//                           "Имя",
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyMedium
//                               ?.copyWith(fontWeight: FontWeight.w700),
//                         ),
//                         Expanded(child: Container()),
//                         Text(
//                           "Azamat",
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 20),
//                     child: Row(
//                       children: [
//                         Text(
//                           "Очества",
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyMedium
//                               ?.copyWith(fontWeight: FontWeight.w700),
//                         ),
//                         Expanded(child: Container()),
//                         Text(
//                           "Nemadulla o’g’li",
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 20),
//                     child: Row(
//                       children: [
//                         Text(
//                           context.translations.contact_phone,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyMedium
//                               ?.copyWith(fontWeight: FontWeight.w700),
//                         ),
//                         Expanded(child: Container()),
//                         Text(
//                           "+99893***0321",
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 20),
//                     child: Row(
//                       children: [
//                         Text(
//                           context.translations.pinfl,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyMedium
//                               ?.copyWith(fontWeight: FontWeight.w700),
//                         ),
//                         Expanded(child: Container()),
//                         Text(
//                           "521120******25",
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 20),
//                     child: Row(
//                       children: [
//                         Text(
//                           "Вод Прав",
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyMedium
//                               ?.copyWith(fontWeight: FontWeight.w700),
//                         ),
//                         Expanded(child: Container()),
//                         Text(
//                           "AG 12****8",
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 20),
//                     child: Row(
//                       children: [
//                         Text(
//                           context.translations.password,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyMedium
//                               ?.copyWith(fontWeight: FontWeight.w700),
//                         ),
//                         Expanded(child: Container()),
//                         Text(
//                           "********",
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Divider(),
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 24.0,
//                 right: 24.0,
//                 top: 8,
//               ),
//               child: Stack(
//                 children: [
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Column(
//                       children: [
//                         Text(
//                           "Доверенность",
//                           textAlign: TextAlign.center,
//                           style: Theme.of(context)
//                               .textTheme
//                               .titleSmall
//                               ?.copyWith(fontWeight: FontWeight.w500),
//                         ),
//                         Image.asset(
//                           alignment: Alignment.center,
//                           PathImages.image11,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Column(
//                       children: [
//                         Text(
//                           "Страховка",
//                           textAlign: TextAlign.center,
//                           style: Theme.of(context)
//                               .textTheme
//                               .titleSmall
//                               ?.copyWith(fontWeight: FontWeight.w500),
//                         ),
//                         Image.asset(
//                           alignment: Alignment.center,
//                           PathImages.image11,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 24, bottom: 24),
//               child: BaseButton(
//                 onPressed: () {
//                   context.openScreen(EditProfileIntent());
//                 },
//                 title: "Редактировать",
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
