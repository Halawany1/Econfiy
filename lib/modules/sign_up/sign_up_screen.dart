import 'package:econfiy/shared/constant/color.dart';
import 'package:econfiy/controller/authentication/authentication_cubit.dart';
import 'package:econfiy/layout/layout_screen.dart';
import 'package:econfiy/modules/log_in/log_in_screen.dart';
import 'package:econfiy/shared/component/material_button.dart';
import 'package:econfiy/shared/component/navigations.dart';
import 'package:econfiy/shared/component/row_sign_in_third_services.dart';
import 'package:econfiy/shared/component/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var font = Theme.of(context).textTheme;
    var fontColor = Theme.of(context);
    var nameController = TextEditingController();
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
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 65.h),
                child: Column(
                  children: [
                    Image.asset('assets/images/wavesignup.png'),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      'Sign Up',
                      style: font.titleMedium!.copyWith(
                          color: fontColor.highlightColor,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    const BuildSignInWithGoogleAndFacebook(),
                    SizedBox(
                      height: 15.h,
                    ),
                    BuildTextFormField(
                        controller: nameController,
                        maxLength: 40,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        hintText: 'Name'),
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
                        obscureText: !cubit.visibality?true:false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                        hintText: 'Password'),
                    SizedBox(
                      height: 40.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                value: cubit.check,
                                fillColor:
                                   !cubit.check? MaterialStateColor.resolveWith((states) {
                                  return const Color(0xFFF5F9FE);
                                }):null,
                                activeColor: Colors.green,
                                side: const BorderSide(color: Colors.grey),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                onChanged: (value) {
                                  cubit.changeCheckBox(value!);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              'I’m agree to The ',
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                              ),
                            ),
                            Text(
                              'Tarms of Service ',
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  color: const Color(0xFF3461FD)),
                            ),
                            Text(
                              'and ',
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                              ),
                            ),
                            Text(
                              'Privasy',
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  color: const Color(0xFF3461FD)),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Text(
                            'Policy',
                            style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                color: const Color(0xFF3461FD)),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    BuildMaterialButton(
                      text: 'Creat Account',
                      onPress: () {
                        if (formKey.currentState!.validate()&&cubit.check) {
                          pushReplacement(context, const LayoutScreen());
                        }
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Do you have account? ',
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            cubit.changeCheckBox(false);
                            cubit.visibality=false;
                            push(context, const LogInScreen());
                          },
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                color: const Color(0xFF3461FD)),
                          ),
                        )
                      ],
                    )
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
