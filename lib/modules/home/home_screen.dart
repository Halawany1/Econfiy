import 'package:carousel_slider/carousel_slider.dart';
import 'package:econfiy/shared/constant/color.dart';
import 'package:econfiy/controller/home/home_cubit.dart';
import 'package:econfiy/modules/product_details/product_details_screen.dart';
import 'package:econfiy/modules/see_more/see_more_screen.dart';
import 'package:econfiy/shared/component/navigations.dart';
import 'package:econfiy/shared/component/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:solar_icons/solar_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> model = [
      'https://s3.us-east-1.amazonaws.com/images.gearjunkie.com/uploads/2023/05/Fake-Reviews.jpg',
      'https://i.ytimg.com/vi/J3lv45BlpKI/sddefault.jpg',
      'https://truthinadvertising.org/wp-content/uploads/2023/09/Fake-Reviews-Rule-Image.png',
      'https://i.ytimg.com/vi/qhS3dSiLPrc/maxresdefault.jpg',
    ];
    if(HomeCubit.get(context).productModel==null){
      HomeCubit.get(context).getProducts();
      HomeCubit.get(context).getRecommendProducts();
    }
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        return Scaffold(
          appBar: AppBar(
            leading: Image.asset(
              'assets/images/Logo.png',
            ),
            titleSpacing: 0,
            title: Text(
              'Econfiy',
              style: GoogleFonts.poppins(
                  fontSize: 14.sp, fontWeight: FontWeight.w700),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Icon(
                      size: 24.w,
                      SolarIconsOutline.bell,
                      color: Colors.black.withOpacity(0.79),
                    ),
                    Positioned(
                      right: 1.w,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFFB7181),
                        radius: 4.r,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          body: cubit.productModel==null
              ? const Center(
                  child: CircularProgressIndicator(
                  color: ColorConstant.generalColor,
                ))
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Column(
                      children: [
                        CarouselSlider(
                            items: model
                                .map((e) => Container(
                                    width: 330.w,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFFDFDFD),
                                        borderRadius:
                                            BorderRadius.circular(8.r)),
                                    child: Image.network(
                                      e,
                                      fit: BoxFit.cover,
                                    )))
                                .toList(),
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                cubit.changeIndexCourselSlider(index);
                              },
                              height: 180.h,
                              scrollDirection: Axis.horizontal,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 1),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              viewportFraction: 1,
                              enableInfiniteScroll: true,
                              initialPage: 0,
                              reverse: false,
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        AnimatedSmoothIndicator(
                          activeIndex: cubit.currentIndex,
                          count: model.length,
                          effect: SlideEffect(
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
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'ِAll Products',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        color: const Color(0xFF223263),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                      onPressed: () {
                                        push(context, const SeeMoreScreen());
                                      },
                                      child: Text(
                                        'See More',
                                        style: GoogleFonts.poppins(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          color: ColorConstant.generalColor,
                                        ),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                               SizedBox(
                                height: 240.h,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          push(context,
                                              const ProductDetailsScreen());
                                          cubit.getProductById(cubit.allProducts[index].id!);
                                          cubit.getAllReviews(cubit.allProducts[index].id!);
                                          cubit.getReviewAnalysis(cubit.recommend[index].id!);
                                        },
                                        child:  BuildProductCard(product: cubit.allProducts[index],)),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                  itemCount: cubit.allProducts.length,),
                              ),

                              SizedBox(
                                height: 20.h,
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Image.asset(
                                  width: double.infinity,
                                  'assets/images/Recomended Product Banner .png'),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Recommended items',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        color: Color(0xFF223263),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.h),

                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.h),
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: cubit.recommend.length,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent:240.h ,
                              mainAxisSpacing: 10.h,
                              crossAxisSpacing: 10.w,
                            ),
                            itemBuilder:
                                (BuildContext context, int index) {
                              return InkWell(
                                  onTap: () {
                                    push(context,
                                        const ProductDetailsScreen());
                                    cubit.getProductById(cubit.recommend[index].id!);
                                    cubit.getAllReviews(cubit.recommend[index].id!);
                                    cubit.getReviewAnalysis(cubit.recommend[index].id!);
                                  },
                                  child: BuildProductCard(product: cubit.recommend[index],));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
