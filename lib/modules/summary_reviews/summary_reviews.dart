import 'package:econfiy/controller/home/home_cubit.dart';
import 'package:econfiy/modules/product_details/widget/reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryReviews extends StatelessWidget {
  const SummaryReviews({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('All Summarization'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(20.h),
          child: Column(
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => BuildReviews(
                      withSummary: true,
                      index: index),
                  separatorBuilder: (context, index) => SizedBox(height: 16.h,),
                  itemCount:cubit.reviewsModel!.data!.reviews!.data!.length ),
            ],
          ),
        ),
      ),
    );
  }
}
