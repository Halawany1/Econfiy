import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildRating extends StatelessWidget {
  const BuildRating({super.key,
    required this.rate,
    required this.fontSize,
    required this.iconSize,});
  final double rate;
  final double iconSize;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        RatingBar.builder(
          initialRating: rate,
          itemSize: iconSize.r,
          minRating: rate,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal:1.w),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          unratedColor: Colors.grey,
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(width: 2.w,),
        Text(
          '($rate)',
          style: GoogleFonts.poppins(
            fontSize: fontSize.sp,
          ),
        ),
      ],
    );
  }
}
