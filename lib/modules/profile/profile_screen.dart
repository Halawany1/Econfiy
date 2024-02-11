import 'package:econfiy/shared/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 45.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile',
                style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    color: Color(0xFF223263),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              Card(
                elevation: 6,
                child: Container(
                  width: double.infinity,
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: ColorConstant.generalColor,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 28.r,
                        backgroundColor: Colors.white,
                        child: Icon(
                          SolarIconsOutline.user,
                          size: 30.r,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mohamed Elhalawany',
                            style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            '@Halawany120',
                            style: GoogleFonts.poppins(
                                fontSize: 10.sp, color: Color(0xFFD7D7D7)),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.edit,
                        size: 24.r,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r)),
                  padding: EdgeInsets.symmetric(horizontal: 20.w,
        
                      vertical: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            radius: 22.r,
                            child: const Icon(
                              SolarIconsOutline.user,
                              color: ColorConstant.generalColor,
                            ),
                          ),
                          SizedBox(width: 20.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('My Account',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.sp
                              ),),
                              SizedBox(height: 2.h,),
                              Text('Make changes to your account',
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    color: Color(0xFFABABAB)
                                ),)
                            ],),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,size: 15.r,color: Color(0xFFABABAB),)
                        ],
                      ),
                      SizedBox(height: 12.h,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            radius: 22.r,
                            child: const Icon(
                              CupertinoIcons.globe,
                              color: ColorConstant.generalColor,
                            ),
                          ),
                          SizedBox(width: 20.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('English | USD',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.sp
                              ),),
                              SizedBox(height: 2.h,),
                              Text('change your language',
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    color: Color(0xFFABABAB)
                                ),)
                            ],),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,size: 15.r,color: Color(0xFFABABAB),)
                        ],
                      ),
                      SizedBox(height: 12.h,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            radius: 22.r,
                            child: const Icon(
                              SolarIconsOutline.shieldCheck,
                              color: ColorConstant.generalColor,
                            ),
                          ),
                          SizedBox(width: 20.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Two-Factor Authentication',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.sp
                              ),),
                              SizedBox(height: 2.h,),
                              Text('Further secure your account for safety',
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    color: Color(0xFFABABAB)
                                ),)
                            ],),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,size: 15.r,color: Color(0xFFABABAB),)
                        ],
                      ),
                      SizedBox(height: 12.h,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            radius: 22.r,
                            child: const Icon(
                              SolarIconsOutline.logout,
                              color: ColorConstant.generalColor,
                            ),
                          ),
                          SizedBox(width: 20.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Log out',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.sp
                              ),),
                              SizedBox(height: 2.h,),
                              Text('Further secure your account for safety',
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    color: Color(0xFFABABAB)
                                ),)
                            ],),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,size: 15.r,color: Color(0xFFABABAB),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.h,),
              Text(
                'More',
                style: GoogleFonts.dmSans(
                    fontSize: 14.sp,
                    color: Color(0xFF181D27),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h,),
              Card  (
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r)),
                  padding: EdgeInsets.symmetric(horizontal: 20.w,
        
                      vertical: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            radius: 22.r,
                            child: const Icon(
                              SolarIconsOutline.bell,
                              color: ColorConstant.generalColor,
                            ),
                          ),
                          SizedBox(width: 20.w,),
                          Text('Help & Support',style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp
                          ),),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,size: 15.r,color: Color(0xFFABABAB),)
                        ],
                      ),
                      SizedBox(height: 12.h,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            radius: 22.r,
                            child: const Icon(
                              CupertinoIcons.suit_heart,
                              color: ColorConstant.generalColor,
                            ),
                          ),
                          SizedBox(width: 20.w,),
                          Text('About App',style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp
                          ),),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,size: 15.r,color: Color(0xFFABABAB),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
