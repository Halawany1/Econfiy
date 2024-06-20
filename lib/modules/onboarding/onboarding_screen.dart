import 'package:econfiy/shared/constant/app.dart';
import 'package:econfiy/shared/constant/color.dart';
import 'package:econfiy/controller/onboarding/on_boarding_cubit.dart';
import 'package:econfiy/modules/get_start/get_start_screen.dart';
import 'package:econfiy/shared/network/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        var cubit = context.read<OnBoardingCubit>();
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
              child: Column(
                children: [
                  Image.asset("assets/images/onboarding${cubit.index}.png",
                    width: 322.w, height: 300.h,),
                  AnimatedSmoothIndicator(
                    activeIndex: cubit.index - 1,
                    count: 2,
                    effect: WormEffect(
                        radius: 8, // Radius of each dot
                        activeDotColor: ColorConstant.generalColor,
                        dotWidth: 11.w,
                        dotHeight: 11.w
                    ),
                  ),
                  SizedBox(height: 40.h,),
                  if(cubit.index == 1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('find the best!', style: GoogleFonts.poppins(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500
                        )),
                        Image.asset('assets/icons/Ok.png'),
                      ],),
                  if(cubit.index == 2)
                    Text('The Best Product ', style: GoogleFonts.poppins(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500
                    )),
                  SizedBox(height: 35.h,),
                  Text(
                    'Aenean eu lacinia ligula. Quisque eu risus erat. Aenean placerat sollicitudin lectus.',
                    style: GoogleFonts.poppins(
                        fontSize: 15.sp,

                        color: Color(0xFF7D8794)
                    ),),
                  SizedBox(height: 80.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(children: [
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const GetStartScreen(),));
                        CacheHelper.saveData(key: AppConstant.onBoarding,
                            value: true);
                        },
                          child: Text('SKIP',
                            style: GoogleFonts.poppins(
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                            ),)),
                      const Spacer(),
                      MaterialButton(
                        onPressed: () {
                          if (cubit.index == 2) {
                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => const GetStartScreen(),));
                            CacheHelper.saveData(key: AppConstant.onBoarding,
                                value: true);
                          }else{
                            cubit.changeCurrentScreen(2);
                          }
                        },
                        height: 55.h,
                        minWidth: 100.w,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.r)
                        ),
                        elevation: 5,
                        color: ColorConstant.generalColor,
                        child: Text('NEXT',
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                          ),),
                      )
                    ],),
                  )


                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
