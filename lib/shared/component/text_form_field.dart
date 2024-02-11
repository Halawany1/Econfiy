import 'package:econfiy/shared/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildTextFormField extends StatelessWidget {
  const BuildTextFormField({super.key,
  required this.controller,
  required this.maxLength,
  required this.hintText,
   this.suffixOnTap,
  required this.validator,
   this.withSuffix=false,
   this.obscureText=false,
  });
  final TextEditingController controller;
  final String hintText;
  final int maxLength;
  final VoidCallback ?suffixOnTap;
  final bool obscureText;
  final String? Function(String?) validator;
  final bool withSuffix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller:controller ,
      maxLength: maxLength,
      cursorColor: ColorConstant.generalColor,
      obscureText: obscureText,
      decoration: InputDecoration(
        errorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide:const BorderSide(color:Colors.red)
        ) ,
        suffixIcon:withSuffix?
        GestureDetector(
          onTap: suffixOnTap,
          child: Icon(!obscureText?Icons.visibility_outlined
              :Icons.visibility_off_outlined,color: const Color(0xFF7C8BA0),
          ),
        ):null,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide:const BorderSide(color: ColorConstant.generalColor)
          ),
          contentPadding:
          EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide.none),
          filled: true,
          counterText: '',
          hintStyle: GoogleFonts.poppins(
              fontSize: 14.sp, color: const Color(0xFF7C8BA0)),
          fillColor: const Color(0xFFF5F9FE),
          hintText:hintText),
    );
  }

}
