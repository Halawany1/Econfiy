import 'package:econfiy/controller/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductAnalysisScreen extends StatelessWidget {
  const ProductAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit=context.read<HomeCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Product Analysis',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 15.sp)),),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price analysis',
                    style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 25.h,),
                  Image.asset('assets/images/Chart.png'),
                  SizedBox(height: 25.h,),
                  Text(
                    'Product analysis',
                    style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 25.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/Chart-container.png'),
                    ],),
                  SizedBox(height: 25.h,),
                  Text(
                    'FakeReview analysis',
                    style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 25.h,),
                  Image.asset('assets/images/Chart2.png'),
                  SizedBox(height: 25.h,),
                ],),
            ),
          ),
        );
      },
    );
  }
}

