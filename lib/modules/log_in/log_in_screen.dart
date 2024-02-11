import 'package:econfiy/controller/authentication/authentication_cubit.dart';
import 'package:econfiy/layout/layout_screen.dart';
import 'package:econfiy/modules/forget_password/forget_password_screen.dart';
import 'package:econfiy/modules/sign_up/sign_up_screen.dart';
import 'package:econfiy/shared/component/material_button.dart';
import 'package:econfiy/shared/component/navigations.dart';
import 'package:econfiy/shared/component/row_sign_in_third_services.dart';
import 'package:econfiy/shared/component/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var font = Theme
        .of(context)
        .textTheme;
    var fontColor = Theme.of(context);
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    bool isValidEmail(String email) {
      // Regular expression for validating email format
      final RegExp emailRegex =
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$', caseSensitive: false);
      return emailRegex.hasMatch(email);
    }

    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        var cubit=context.read<AuthenticationCubit>();
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w,
                    vertical: 20.h),
                child: Column(
                  children: [
                    Image.asset('assets/images/wavelogin.png'),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      'Sign In',
                      style: font.titleMedium!.copyWith(
                          color: fontColor.highlightColor,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    const BuildSignInWithGoogleAndFacebook(),
                    SizedBox(
                      height: 15.h,
                    ),

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
                    SizedBox(
                      height: 15.h,
                    ),
                    BuildTextFormField(
                        suffixOnTap: () {
                          cubit.changeVisibalityPassword();
                        },
                        controller: passwordController,
                        maxLength: 120,
                        withSuffix: true,
                        obscureText: !cubit.visibality ? true : false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                        hintText: 'Password'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: () {
                          push(context, const ForgetPasswordScreen());
                        }, child: Text(
                          'Forget Password?',
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: const Color(0xFF7C8BA0)
                          ),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),

                    BuildMaterialButton(
                      text: 'Log In',
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          pushReplacement(context, const LayoutScreen());
                        }
                      },
                    ),
                    SizedBox(height: 15.h,),
                    Row(children: [
                      Text(
                        'Don’t have account? ',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,),
                      ),
                      InkWell(
                        onTap: () {
                          pushReplacement(context, const SignUpScreen());
                        },
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp, color: const Color(0xFF3461FD)),

                        ),
                      )
                    ],)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
