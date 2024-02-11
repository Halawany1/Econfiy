import 'package:econfiy/modules/sign_up/sign_up_screen.dart';
import 'package:econfiy/shared/component/material_button.dart';
import 'package:econfiy/shared/component/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: Column(children: [
          Image.asset("assets/images/getstart.png",
            width: 322.w, height: 300.h,),
          SizedBox(height: 120.h,),
          Text('Welcome to Light',style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 25.sp
          ),),
          SizedBox(height: 20.h,),
          BuildMaterialButton(text: 'Creat New Account',
              onPress: () {
            pushReplacement(context, const SignUpScreen());
              },),
          SizedBox(height: 20.h,),
          TextButton(onPressed: () {

          },
              child: Text('I already have an account?',

                style: GoogleFonts.poppins(
                  decoration: TextDecoration.underline,
                  decorationColor:  Colors.black,
                  color: Colors.black,
                  fontSize: 14.sp
                ),))

        ],),
      ),
    );
  }
}
