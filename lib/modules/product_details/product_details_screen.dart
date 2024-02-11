import 'package:carousel_slider/carousel_slider.dart';
import 'package:econfiy/shared/constant/color.dart';
import 'package:econfiy/controller/product/product_cubit.dart';
import 'package:econfiy/modules/product_analysis/product_analysis_screen.dart';
import 'package:econfiy/shared/component/material_button.dart';
import 'package:econfiy/shared/component/navigations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:solar_icons/solar_icons.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> image = [
      'assets/images/tshirt0.jpg',
      'assets/images/tshirt1.jpg',
      'assets/images/tshirt2.jpg',
    ];
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        var cubit = context.read<ProductCubit>();
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: GestureDetector(
                  onTap: () {
                    push(context, const ProductAnalysisScreen());
                  },
                  child: const Icon(
                    CupertinoIcons.chart_bar,
                    color: ColorConstant.generalColor,
                  ),
                ),
              )
            ],
            title: Text('Black Winter t-Shirt',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 15.sp)),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                CarouselSlider(
                    items: image
                        .map((e) => SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              e,
                              fit: BoxFit.cover,
                            )))
                        .toList(),
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        print(index);
                        cubit.changeImageIndex(index);
                      },
                      height: 180.h,
                      scrollDirection: Axis.horizontal,
                      viewportFraction: 1,
                      enableInfiniteScroll: true,
                      initialPage: 0,
                      reverse: false,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                AnimatedSmoothIndicator(
                  activeIndex: cubit.currentImageIndex,
                  count: image.length,
                  effect: JumpingDotEffect(
                      radius: 8, // Radius of each dot
                      activeDotColor: ColorConstant.generalColor,
                      dotWidth: 8.w,
                      dotHeight: 8.w),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Black Winter t-Shirt',
                              style: GoogleFonts.poppins(
                                  color: Color(0xFF223263),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp)),
                          Spacer(),
                          Icon(
                            SolarIconsOutline.heart,
                            color: Color(0xFF9098B1),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/startsrating.png',
                            scale: 0.78,
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Text('See FakeReviews',
                                style: GoogleFonts.poppins(
                                    color: ColorConstant.generalColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text('1900 EG',
                          style: GoogleFonts.poppins(
                              color: ColorConstant.generalColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp)),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Description',
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            color: const Color(0xFF223263),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        '''Stay warm and fashionable this winter with our Black Winter T-Shirt. Crafted from premium, cozy cotton fabric, this essential piece offers both style and comfort to see you through the chilly months ahead.

The sleek black color adds a touch of sophistication to your winter wardrobe, making it versatile for both casual and semi-formal occasions. Whether you're layering it under a jacket for outdoor adventures or pairing it with jeans for a relaxed indoor gathering, this t-shirt effortlessly elevates your winter look.
        
Designed with durability and insulation in mind, the winter t-shirt features a slightly thicker construction to provide extra warmth without sacrificing breathability. Its relaxed fit ensures ease of movement and layering, while the classic crew neckline adds a timeless appeal.
        
Upgrade your winter wardrobe with the Black Winter T-Shirt and experience unmatched comfort and style all season long.''',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp, color: Color(0xFF9098B1)),
                      ),
                      SizedBox(height: 40.h,),
                      BuildMaterialButton(text: 'Open in Amazon',
                        onPress: () {

                        },),
                      SizedBox(height: 50.h,),
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
