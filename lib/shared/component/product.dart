import 'package:econfiy/shared/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';

class BuildProductCard extends StatelessWidget {
  const BuildProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r)
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r)
        ),
        width:150.w ,
        height: 228.h,
        child:Column(children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                    fit: BoxFit.cover,
                    width: 150.w,
                    height: 128.h,
                    'assets/images/product.png'),
              ),
              Positioned(
                right: 5.w,
                bottom: 5.w,
                child: CircleAvatar(
                  radius: 12.r,
                  backgroundColor: Colors.white,
                  child: Icon(
                    size: 15.r,
                    SolarIconsOutline.heart,
                    color: ColorConstant.generalColor,
                  ),
                ),
              ),


            ],
          ),
          SizedBox(height: 5.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  'Black Winter t-Shirt',
                  style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  'EARTHEN Rose Pink Embroidered Tiered Max',
                  style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                  ),
                ),
                SizedBox(height: 5.h,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1900 EG',
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        Image.asset('assets/images/startsrating.png')
                      ],),
                    Spacer(),
                    Image.asset('assets/images/amazonlogo.png')
                  ],
                )
              ],),
          )

        ],),
      ),
    );
  }
}
