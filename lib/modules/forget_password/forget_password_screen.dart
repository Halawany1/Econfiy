import 'package:econfiy/shared/constant/color.dart';
import 'package:econfiy/shared/component/material_button.dart';
import 'package:econfiy/shared/component/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var font = Theme
        .of(context)
        .textTheme;
    var fontColor = Theme.of(context);
    var formKey=GlobalKey<FormState>();
    var emailController = TextEditingController();
    bool isValidEmail(String email) {
      // Regular expression for validating email format
      final RegExp emailRegex =
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$', caseSensitive: false);
      return emailRegex.hasMatch(email);
    }
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.5.w,
                vertical: 20.h),
            child: Column(

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(height: 2.5.h,width: 30.w,
                  color: ColorConstant.generalColor,
                  ),
                  SizedBox(width: 8.w,),
                  Container(height: 2.5.h,width: 30.w,
                    color:  Color(0xFFD6DFFF),
                  ),
                    SizedBox(width:8.w,),
                  Container(height: 2.5.h,width: 30.w,
                    color: Color(0xFFD6DFFF),
                  )
                ],),
                SizedBox(height: 80.h,),
                Image.asset('assets/images/forgetpass.png'),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Forget Password',
                  style: font.titleMedium!.copyWith(
                      color: fontColor.highlightColor,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 10.h,),
                Text(
                  maxLines: 3,
                  'Make sure you enter a valid email address associated with your account To receive the accreditation letter',
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF61677D),
                      fontSize: 12.sp
                  )
                ),
                SizedBox(height: 30.h,),
                BuildTextFormField(
                    controller: emailController,
                    maxLength: 120,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      } else if (!isValidEmail(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    hintText: 'Email Address'),
                SizedBox(height: 35.h,),
                BuildMaterialButton(text: 'Continue',
                    onPress: () {
                  if(formKey.currentState!.validate()){

                  }
                    },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
