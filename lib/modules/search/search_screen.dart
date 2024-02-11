import 'package:econfiy/shared/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData>iconsOne=[
      SolarIconsOutline.tShirt,
      SolarIconsOutline.skirt,
      SolarIconsOutline.health,
      SolarIconsOutline.bag,

    ];
    List<IconData>iconsTwo=[
      SolarIconsOutline.phone,
      SolarIconsOutline.medicalKit,
      SolarIconsOutline.gameboy,
      SolarIconsOutline.toPIP,
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80.h, left: 10.w, right: 10.w),
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: const BorderSide(color: Color(0xFFEBF0FF)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide:
                            const BorderSide(color: ColorConstant.generalColor)),
                    prefixIcon: const Icon(
                      CupertinoIcons.search,
                      color: ColorConstant.generalColor,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    hintText: 'Search Product',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 12.sp,
                    )),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.all(12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Color(0xFF223263),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 65.w,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>  Container(
                          width: 68.w,
                          height: 68.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(38.r),
                              color: Colors.white,
                              border: Border.all(color: Color(0xFFEBF0FF))
                          ),
                          child: Icon(
                            iconsOne[index],
                            size: 27.r,
                            color: ColorConstant.generalColor,
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 15.w,)
                        , itemCount: 4),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 65.w,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>  Container(
                          width: 68.w,
                          height: 68.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(38.r),
                              color: Colors.white,
                              border: Border.all(color: Color(0xFFEBF0FF))
                          ),
                          child: Icon(
                            iconsTwo[index],
                            size: 27.r,
                            color: ColorConstant.generalColor,
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 15.w,)
                        , itemCount: 4),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 65.w,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>  Container(
                          width: 68.w,
                          height: 68.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(38.r),
                              color: Colors.white,
                              border: Border.all(color: Color(0xFFEBF0FF))
                          ),
                          child: Icon(
                            iconsOne[index],
                            size: 27.r,
                            color: ColorConstant.generalColor,
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 15.w,)
                        , itemCount: 4),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 65.w,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>  Container(
                          width: 68.w,
                          height: 68.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(38.r),
                              color: Colors.white,
                              border: Border.all(color: Color(0xFFEBF0FF))
                          ),
                          child: Icon(
                            iconsTwo[index],
                            size: 27.r,
                            color: ColorConstant.generalColor,
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 15.w,)
                        , itemCount: 4),
                  )
                ],
              ),
            ),
        
        
          ],
        ),
      ),
    );
  }
}
