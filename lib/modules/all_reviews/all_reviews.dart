import 'package:econfiy/modules/summary_reviews/summary_reviews.dart';
import 'package:econfiy/shared/component/material_button.dart';
import 'package:econfiy/shared/component/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllReviewsScreen extends StatelessWidget {
  const AllReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Reviews'),
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/Review Product (1).png',
                ),
                SizedBox(height: 40.h,),
                BuildMaterialButton(text: 'See Summarization',
                    onPress: () {
                  push(context, SummaryReviews());
                    },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
