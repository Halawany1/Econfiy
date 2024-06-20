import 'package:econfiy/controller/home/home_cubit.dart';
import 'package:econfiy/modules/product_details/product_details_screen.dart';
import 'package:econfiy/shared/component/navigations.dart';
import 'package:econfiy/shared/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';

class RecentProductScreen extends StatelessWidget {
  const RecentProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'Recent Product',
                style: GoogleFonts.poppins(
                    fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
            ),
            body: cubit.recentProductModel != null &&
                    state is! LoadingGetRecentProductsState
                ? Padding(
                    padding:
                        EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount:
                          cubit.recentProductModel!.data!.recent!.data!.length,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w,
                        childAspectRatio: 0.65, // Adjust as needed
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              push(context, const ProductDetailsScreen());
                              cubit.getProductById(cubit.recentProductModel!
                                  .data!.recent!.data![index].product!.id!);
                            },
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.r)),
                                width: 150.w,
                                height: 240.h,
                                child: Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          child: Image.network(
                                              width: 150.w,
                                              height: 128.h,
                                              cubit
                                                  .recentProductModel!
                                                  .data!
                                                  .recent!
                                                  .data![index]
                                                  .product!
                                                  .image!),
                                        ),
                                        Positioned(
                                          right: 5.w,
                                          bottom: 5.w,
                                          child: InkWell(
                                            onTap: () {
                                              if (cubit
                                                      .recentProductModel!
                                                      .data!
                                                      .recent!
                                                      .data![index]
                                                      .product!
                                                      .isFavorite ==
                                                  0) {
                                                cubit.postFavourites(cubit
                                                    .recentProductModel!
                                                    .data!
                                                    .recent!
                                                    .data![index]
                                                    .product!
                                                    .id!);
                                              } else {
                                                cubit.deleteFavourites(cubit
                                                    .recentProductModel!
                                                    .data!
                                                    .recent!
                                                    .data![index]
                                                    .product!
                                                    .id!);
                                              }
                                            },
                                            child: CircleAvatar(
                                              radius: 12.r,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                size: 15.r,
                                                cubit
                                                            .recentProductModel!
                                                            .data!
                                                            .recent!
                                                            .data![index]
                                                            .product!
                                                            .isFavorite ==
                                                        0
                                                    ? CupertinoIcons.heart
                                                    : CupertinoIcons.heart_fill,
                                                color: cubit
                                                            .recentProductModel!
                                                            .data!
                                                            .recent!
                                                            .data![index]
                                                            .product!
                                                            .isFavorite ==
                                                        0
                                                    ? ColorConstant.generalColor
                                                    : Colors.red,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 6.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            cubit
                                                .recentProductModel!
                                                .data!
                                                .recent!
                                                .data![index]
                                                .product!
                                                .name!,
                                            style: GoogleFonts.poppins(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            cubit
                                                .recentProductModel!
                                                .data!
                                                .recent!
                                                .data![index]
                                                .product!
                                                .shortDescription!,
                                            style: GoogleFonts.poppins(
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${cubit.recentProductModel!.data!.recent!.data![index].product!.price} EG',
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      RatingBar.builder(
                                                        initialRating: cubit
                                                            .recentProductModel!
                                                            .data!
                                                            .recent!
                                                            .data![index]
                                                            .product!
                                                            .averageRating!,
                                                        itemSize: 12.r,
                                                        minRating: cubit
                                                            .recentProductModel!
                                                            .data!
                                                            .recent!
                                                            .data![index]
                                                            .product!
                                                            .averageRating!,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 5,
                                                        itemPadding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    1.w),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        ),
                                                        unratedColor:
                                                            Colors.grey,
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                      Text(
                                                        '(${cubit.recentProductModel!.data!.recent!.data![index].product!.averageRating!})',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 10.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Spacer(),
                                              Image.network(
                                                cubit
                                                    .recentProductModel!
                                                    .data!
                                                    .recent!
                                                    .data![index]
                                                    .product!
                                                    .brand!
                                                    .icon!,
                                                width: 30.w,
                                                height: 30.w,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ));
                      },
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
