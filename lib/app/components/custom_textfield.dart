import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController  controller;
  final String hintText;
  final bool obsureText;
  final Widget? preffixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obsureText,
    required this.onChanged,
    this.preffixIcon,
    this.suffixIcon,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    const Color background =  Color(0xFF000000);
    const Color colorText = Color (0xFF818181);

    return TextFormField(
      controller: controller,
      obscureText: obsureText,
      style: GoogleFonts.plusJakartaSans(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: background
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: preffixIcon,
        suffixIcon: suffixIcon,
        prefixIconColor: background,
        hintText: hintText,
        hintStyle: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            color: colorText
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder:  OutlineInputBorder(
          borderSide: const BorderSide(color: colorText, width: 1.3),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: const BorderSide(color: background, width: 1.3),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      validator: validator,
    );
  }
}
