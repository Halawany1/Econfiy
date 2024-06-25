import 'package:carousel_slider/carousel_slider.dart';
import 'package:econfiy/controller/home/home_cubit.dart';
import 'package:econfiy/modules/all_reviews/all_reviews.dart';
import 'package:econfiy/modules/product_details/widget/reviews.dart';
import 'package:econfiy/shared/component/reating.dart';
import 'package:econfiy/shared/constant/color.dart';
import 'package:econfiy/modules/product_analysis/product_analysis_screen.dart';
import 'package:econfiy/shared/component/material_button.dart';
import 'package:econfiy/shared/component/navigations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        return Scaffold(
            appBar: AppBar(
              titleSpacing: 0,
              actions: [
                cubit.productByIdModel != null &&
                        state is! LoadingGetProductByIdState
                    &&cubit.reviewsModel!=null&&
                    state is! LoadingGetReviewsState
                    ? Padding(
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
                    : Container()
              ],
              title: cubit.productByIdModel != null &&
                      state is! LoadingGetProductByIdState&&cubit.reviewsModel!=null&&
                state is! LoadingGetReviewsState
                  ? Text(cubit.productByIdModel!.data!.product!.name!,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 15.sp))
                  : null,
            ),
            body: cubit.productByIdModel != null &&
                    state is! LoadingGetProductByIdState
                &&cubit.reviewsModel!=null&&
                state is! LoadingGetReviewsState
                ? SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Image.network(
                          height: 200.h,
                          cubit.productByIdModel!.data!.product!.image!,
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
                                  SizedBox(
                                    width: 300.w,
                                    child: Text(cubit.productByIdModel!.data!.product!.name!,
                                        maxLines: 3,
                                        style: GoogleFonts.poppins(
                                            color: Color(0xFF223263),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp)),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      if( cubit.productByIdModel!.data!.product!.isFavorite==0){
                                        cubit.postFavourites( cubit.productByIdModel!.data!.product!.id!);
                                      }else{
                                        cubit.deleteFavourites( cubit.productByIdModel!.data!
                                            .product!
                                            .id!);
                                      }
                                      cubit.getProductById(cubit.productByIdModel!.data!
                                          .product!
                                          .id!);
                                    },
                                    child:  Icon(
                                      size: 15.r,
                                      cubit.productByIdModel!.data!
                                        .product!.isFavorite==0?
                                      CupertinoIcons.heart:CupertinoIcons.heart_fill,
                                      color:  cubit.productByIdModel!.data!
                                        .product!.isFavorite==0?
                                      ColorConstant.generalColor:Colors.red,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                children: [
                                  BuildRating(rate: cubit.productByIdModel
                                      !.data!.product!.averageRating!,
                                      fontSize: 15.sp,
                                      iconSize: 20.r),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        backgroundColor: Colors.white,
                                        builder: (context) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(25.r),
                                                  topRight:
                                                      Radius.circular(25.r)),
                                              color: const Color(0xFFF9F9F9),
                                            ),
                                            width: double.infinity,
                                            height: 250.h,
                                            child: SingleChildScrollView(
                                              child: Padding(
                                                padding:  EdgeInsets.all(15.h),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                      Container(
                                                        width: 60.w,
                                                        height: 5.h,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(10.r),
                                                          color: Colors.grey.shade300,
                                                        ),

                                                      ),

                                                    ]),
                                                    SizedBox(height: 25.h,),
                                                    Text('Fake Percentage',style:
                                                    GoogleFonts.poppins(fontWeight:
                                                    FontWeight.bold,fontSize: 15.sp),),
                                                    SizedBox(height: 10.h,),
                                                    BuildRating(rate: double.parse(cubit.analysisModel!.data!
                                                        .fakePercentage!.toStringAsFixed(2)),
                                                        fontSize: 15.sp,
                                                        iconSize: 25.r),
                                                    SizedBox(height: 25.h,),
                                                    Text('Real Rating',style:
                                                    GoogleFonts.poppins(fontWeight:
                                                    FontWeight.bold,fontSize: 15.sp),),
                                                    SizedBox(height: 10.h,),
                                                    BuildRating(rate: double.parse(cubit.analysisModel!.data!
                                                        .ratingAfterFakeFilter!.toStringAsFixed(2)),
                                                        fontSize: 15.sp,
                                                        iconSize: 25.r)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
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
                              Text('${cubit.productByIdModel!.data!.product!.price!} EG',
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
                                cubit.productByIdModel!.data!.product!.shortDescription!,
                                style: GoogleFonts.poppins(
                                    fontSize: 12.sp, color: Color(0xFF9098B1)),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Reviews',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp)),
                                  InkWell(
                                    onTap: () {
                                      push(context, const AllReviewsScreen());
                                    },
                                    child: Text('See All Reviews',
                                        style: GoogleFonts.poppins(
                                            color: ColorConstant.generalColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp)),
                                  )
                                ],
                              ),
                              SizedBox(height: 20.h,),
                              BuildReviews(index: 0),
                              SizedBox(
                                height: 40.h,
                              ),
                              BuildMaterialButton(
                                text: 'Open in ${cubit.productByIdModel!.data!
                                    .product!.website!.name!}',
                                onPress: () async{
                                  await launchUrl(Uri.parse(cubit.productByIdModel!.data!.product!.url!));

                                },
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                    color: ColorConstant.generalColor,
                  )));
      },
    );
  }
}
