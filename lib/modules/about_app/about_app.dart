import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('About App',
        style: TextStyle(fontSize: 18.sp),),
      ),
      body: Padding(
        padding:  EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/splash.png',
                width: 200.w,height: 200.w,),
              ],
            ),
            SizedBox(height: 35.h,),
            Text('Impact of the project :',
            style:GoogleFonts.poppins(fontSize: 18.sp,
                fontWeight: FontWeight.w700) ,),
            SizedBox(height: 15.h,),
            Text(
              textAlign: TextAlign.left,
              """Our project has a significant impact by empowering consumers to make informed decisions, detect fake reviews, and avoid counterfeit products when shopping online. It contributes to a more trustworthy online marketplace and helps users navigate through genuine feedback for abetter shopping experience.""",
              style:GoogleFonts.poppins(fontSize: 15.sp,) ,),
          ],
        ),
      )
    );
  }
}
