import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';

class FasvouriteScreen extends StatelessWidget {
  const FasvouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              SolarIconsOutline.heart,
              color: Color(0xFFF93C00),
              size: 80.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'You have no favorites...yet',
              style: GoogleFonts.poppins(
                fontSize: 14.sp
              ),

            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'tap like to save your favorites in one place',
              style: GoogleFonts.poppins(
                  fontSize: 12.sp,
              ),

            )
          ],
        ),
      ),
    );
  }
}
