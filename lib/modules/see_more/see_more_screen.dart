import 'package:econfiy/shared/component/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SeeMoreScreen extends StatelessWidget {
  const SeeMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Product',style: GoogleFonts.poppins(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500
        ),),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 20.h,left: 10.w,right: 10.w),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 6,
          physics: const BouncingScrollPhysics(),
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w,
            childAspectRatio: 0.65, // Adjust as needed
          ),
          itemBuilder: (BuildContext context, int index) {
            return const BuildProductCard();
          },
        ),
      ),
    );
  }
}
