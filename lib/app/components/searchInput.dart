import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/constans/constans.dart';

class MyInputSearch extends StatelessWidget {
  const MyInputSearch(
      {super.key,
      required this.controller,
      required this.controllerField,
      this.prefixIcon,
      this.suffixIcon,
      required this.height,
      required this.width,
      required this.hintText,
      this.isPassword = false,
      this.autoFocus = false,
      this.validator,
      this.textAlign = TextAlign.left});
  final controller;
  final TextEditingController controllerField;
  final validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final bool autoFocus;
  final String hintText;
  final double height;
  final double width;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    Timer? debounce;

    void onChanged(String value) {
      if (debounce?.isActive ?? false) debounce?.cancel();
      debounce = Timer(const Duration(milliseconds: 1000), () {
        controller.searchData(value);
      });
    }
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      controller: controllerField,
      autofocus: true,
      textAlign: textAlign,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.poppins().fontFamily),
      decoration: InputDecoration(
        suffixIcon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              size: 18,
              suffixIcon,
              color: Colors.black,
            ),
          ],
        ),
        prefixIcon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              size: 18,
              prefixIcon,
              color: Colors.black,
            ),
          ],
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            fontFamily: GoogleFonts.poppins().fontFamily),
        filled: true,
        fillColor: const Color(0xffFFFFFF),
        contentPadding:
            EdgeInsets.symmetric(horizontal: width, vertical: height),
        errorStyle: const TextStyle(
          color: errorInputColor,
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: errorInputColor, width: 0)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: errorInputColor, width: 0)),
        // border: OutlineInputBorder(),
      ),
    );
  }
}
