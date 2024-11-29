// import 'package:flutter/material.dart';
// import 'package:libos/utils/constants.dart';
// import 'package:libos/utils/dimensions.dart';
//
// class CustomEdittext extends StatefulWidget {
//   final String title;
//   final String hint;
//   final bool isNecessary;
//   TextEditingController? controller;
//   final IconData? icon;
//   bool isPasswordEdittext;
//   final TextInputType textInputType;
//   Function(String price)? onChange;
//   int maxLines;
//   CustomEdittext({
//     super.key,
//     required this.title,
//     required this.hint,
//     this.controller,
//     this.icon,
//     this.isPasswordEdittext = false,
//     this.isNecessary = false,
//     this.textInputType = TextInputType.text,
//     this.onChange,
//     this.maxLines = 1,
//   });
//
//   @override
//   State<CustomEdittext> createState() => _CustomEdittextState();
// }
//
// class _CustomEdittextState extends State<CustomEdittext> {
//   bool isSecured = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Row(
//           children: [
//             Text(
//               widget.title,
//               style: TextStyle(
//                 color: colorBaseText,
//                 fontSize: font_size_14,
//                 fontFamily: FontFamily.MEDIUM.name,
//               ),
//             ),
//             SizedBox(
//               width: margin_padding_4,
//             ),
//             Visibility(
//               visible: widget.isNecessary,
//               child: Text(
//                 "*",
//                 style: TextStyle(
//                   color: colorBaseBackground,
//                   fontSize: font_size_12,
//                   fontFamily: FontFamily.REGULAR.name,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: margin_padding_8,
//         ),
//         widget.isPasswordEdittext
//             ? TextField(
//                 controller: widget.controller,
//                 obscureText: isSecured,
//                 onChanged: widget.onChange,
//                 keyboardType: widget.textInputType,
//                 maxLines: widget.maxLines,
//                 style: TextStyle(
//                   color: colorBaseText,
//                   fontFamily: FontFamily.REGULAR.name,
//                   fontSize: font_size_14,
//                 ),
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.only(
//                     left: margin_padding_16,
//                     right: margin_padding_16,
//                     top: margin_padding_12,
//                     bottom: margin_padding_12,
//                   ),
//                   hintText: widget.hint,
//                   hintStyle: TextStyle(
//                     color: colorDarkGrey,
//                     fontSize: font_size_14,
//                     fontFamily: FontFamily.REGULAR.name,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       color: colorBaseBackground,
//                       width: 1,
//                     ),
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       color: colorDarkGrey,
//                       width: 0.5,
//                     ),
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       // Based on passwordVisible state choose the icon
//                       isSecured ? Icons.visibility : Icons.visibility_off, color: colorDarkGrey,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         isSecured = !isSecured;
//                       });
//                     },
//                   ),
//                   prefixIcon: widget.icon == null
//                       ? null
//                       : Icon(
//                           widget.icon,
//                           color: colorDarkGrey,
//                         ),
//                 ),
//               )
//             : TextField(
//                 controller: widget.controller,
//                 keyboardType: widget.textInputType,
//                 onChanged: widget.onChange,
//                 maxLines: widget.maxLines,
//                 style: TextStyle(
//                   color: colorBaseText,
//                   fontFamily: FontFamily.REGULAR.name,
//                   fontSize: font_size_14,
//                 ),
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.only(
//                     left: margin_padding_16,
//                     right: margin_padding_16,
//                     top: margin_padding_12,
//                     bottom: margin_padding_12,
//                   ),
//                   hintText: widget.hint,
//                   hintStyle: TextStyle(
//                     color: colorDarkGrey,
//                     fontFamily: FontFamily.REGULAR.name,
//                     fontSize: font_size_14,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       color: colorBaseBackground,
//                       width: 1,
//                     ),
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       color: colorDarkGrey,
//                       width: 0.5,
//                     ),
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   prefixIcon: widget.icon == null
//                       ? null
//                       : Icon(
//                           widget.icon,
//                           color: colorDarkGrey,
//                         ),
//                 ),
//               ),
//       ],
//     );
//   }
// }
