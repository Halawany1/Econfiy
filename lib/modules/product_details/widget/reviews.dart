import 'package:econfiy/controller/home/home_cubit.dart';
import 'package:econfiy/shared/component/reating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildReviews extends StatelessWidget {
  const BuildReviews({super.key, required this.index,this.withSummary=false});
  final int index;
  final bool withSummary;
  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return Card(
      elevation: 2,
      color: Colors.grey[100],
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding:  EdgeInsets.all(8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(CupertinoIcons.profile_circled,size: 40.r,
                  color: Colors.grey,),
                SizedBox(width: 10.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cubit.reviewsModel!.data!.reviews!
                        .data![index].reviewer!,style: GoogleFonts.poppins(fontSize: 15.sp),),
                    BuildRating(rate: 4, iconSize: 12.r,fontSize: 10.sp,),
                  ],),
                Spacer(),
                Text(cubit.reviewsModel!.data!.reviews!
                    .data![index].isFake==0?'Real Review':'Fake Review',style: GoogleFonts.poppins(fontSize: 15.sp),),
              ],),
            SizedBox(height: 10.h,),
            Text(withSummary?
            cubit.reviewsModel!.data!.reviews!
                .data![index].summarize!
            :cubit.reviewsModel!.data!.reviews!
                .data![index].text!,
              style: GoogleFonts.poppins(fontSize: 12.sp,
                  color: Color(0xFF9098B1)),),
          ],),
      ),
    );
  }
}

