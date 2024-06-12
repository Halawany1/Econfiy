import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryReviews extends StatelessWidget {
  const SummaryReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Summarization'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(20.h),
          child: Column(
            children: [
              Image.asset('assets/images/Review Product (1).png'),
            ],
          ),
        ),
      ),
    );
  }
}
