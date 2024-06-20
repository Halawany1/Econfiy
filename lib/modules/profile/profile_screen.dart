import 'package:econfiy/controller/home/home_cubit.dart';
import 'package:econfiy/controller/profile/profile_cubit.dart';
import 'package:econfiy/modules/about_app/about_app.dart';
import 'package:econfiy/modules/edit_profile/edit_profile.dart';
import 'package:econfiy/modules/log_in/log_in_screen.dart';
import 'package:econfiy/modules/recent_product/recent_product.dart';
import 'package:econfiy/shared/component/navigations.dart';
import 'package:econfiy/shared/component/snak_bar_component.dart';
import 'package:econfiy/shared/constant/app.dart';
import 'package:econfiy/shared/constant/color.dart';
import 'package:econfiy/shared/network/local.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:url_launcher/url_launcher.dart';
void launchGmail() async {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

// ···
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'mohamedelhalawany120@gmail.com',
    query: encodeQueryParameters(<String, String>{
      'subject': 'Problem in Econfiy',
    }),
  );

  launchUrl(emailLaunchUri);
}
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if(state is SuccessUpdateProfileState){
         showMessageResponse(message: 'Profile Updated Successfully',
             context: context, success: true);
        }
      },
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Scaffold(
            body: cubit.profileModel != null && state is! LoadingGetProfileState
                ? SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 45.h),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        cubit.profileModel!.data!.user!.name!,
                                        style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        cubit.profileModel!.data!.user!.email!,
                                        style: GoogleFonts.poppins(
                                            fontSize: 10.sp,
                                            color: Color(0xFFD7D7D7)),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      push(context, const EditProfileScreen());
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      size: 24.r,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.r)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 15.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      push(context, EditProfileScreen());
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor:
                                              Colors.grey.withOpacity(0.2),
                                          radius: 22.r,
                                          child: const Icon(
                                            SolarIconsOutline.user,
                                            color: ColorConstant.generalColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'My Account',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13.sp),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Text(
                                              'Make changes to your account',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 10.sp,
                                                  color: Color(0xFFABABAB)),
                                            )
                                          ],
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 15.r,
                                          color: Color(0xFFABABAB),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      push(context, const RecentProductScreen());
                                      HomeCubit.get(context).getRecentProducts();
                                      },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor:
                                              Colors.grey.withOpacity(0.2),
                                          radius: 22.r,
                                          child:  const Icon(
                                            Icons.history,
                                            color: ColorConstant.generalColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Recent Products',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13.sp),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Text(
                                              'see all recent products',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 10.sp,
                                                  color: Color(0xFFABABAB)),
                                            )
                                          ],
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 15.r,
                                          color: Color(0xFFABABAB),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            'More',
                            style: GoogleFonts.dmSans(
                                fontSize: 14.sp,
                                color: Color(0xFF181D27),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          InkWell(
                            onTap: () {
                              launchGmail();
                            },
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.r)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 15.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor:
                                              Colors.grey.withOpacity(0.2),
                                          radius: 22.r,
                                          child: const Icon(
                                            SolarIconsOutline.bell,
                                            color: ColorConstant.generalColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Text(
                                          'Help & Support',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13.sp),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 15.r,
                                          color: Color(0xFFABABAB),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        push(context, AboutAppScreen());
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.withOpacity(0.2),
                                            radius: 22.r,
                                            child: const Icon(
                                              CupertinoIcons.suit_heart,
                                              color: ColorConstant.generalColor,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Text(
                                            'About App',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15.r,
                                            color: Color(0xFFABABAB),
                                          )
                                        ],
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          InkWell(
                            onTap: () {
                              CacheHelper.removeData(key: AppConstant.token);
                              HomeCubit.get(context).favouriteModel=null;
                              HomeCubit.get(context).productModel=null;
                              pushReplacement(context, const LogInScreen());
                            },
                            child: Card(
                              surfaceTintColor: Colors.transparent,
                              color: Colors.white,
                              elevation: 3,
                              child: Padding(
                                padding:  EdgeInsets.all(10.h),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                      Colors.grey.withOpacity(0.2),
                                      radius: 22.r,
                                      child: const Icon(
                                        SolarIconsOutline.logout,
                                        color:Colors.red,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Log out',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13.sp),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Text(
                                          'Further secure your account for safety',
                                          style: GoogleFonts.poppins(
                                              fontSize: 10.sp,
                                              color: Color(0xFFABABAB)),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15.r,
                                      color: Color(0xFFABABAB),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                    color: ColorConstant.generalColor,
                  )));
      },
    );
  }
}
