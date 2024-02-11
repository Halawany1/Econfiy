import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildSignInWithGoogleAndFacebook extends StatelessWidget {
  const BuildSignInWithGoogleAndFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    var font=Theme.of(context).textTheme;
    var fontColor=Theme.of(context);
    return Column(
      children: [
        Row(children: [
          Container(
            width: 150.w,
            height: 45.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: fontColor.hoverColor,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/facebook.png'),
                SizedBox(width: 15.w,),
                Text('Facebook',
                  style: font.titleMedium!.copyWith(
                      color: fontColor.cardColor,
                      fontSize: 14.sp
                  ),)
              ],),
          ),
          const Spacer(),
          Container(
            width: 150.w,
            height: 45.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: fontColor.hoverColor,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/google.png'),
                SizedBox(width: 15.w,),
                Text('Google',
                  style: font.titleMedium!.copyWith(
                      color: fontColor.cardColor,
                      fontSize: 14.sp
                  ),)
              ],),
          ),
        ],),
        SizedBox(height: 15.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 140.w,height: 1,
              color: fontColor.canvasColor,
            ),
            SizedBox(width: 8.w,),
            Text('Or',style: font.titleMedium!.copyWith(
                fontSize: 12.sp,
                color: Color(0xFF7C8BA0)
            ),)
            ,
            SizedBox(width:8.w,),
            Container(width: 140.w,height: 1,
              color: fontColor.canvasColor,
            )
          ],)
      ],
    );
  }
}
