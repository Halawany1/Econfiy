import 'package:econfiy/controller/search/search_cubit.dart';
import 'package:econfiy/shared/component/product.dart';
import 'package:econfiy/shared/component/snak_bar_component.dart';
import 'package:econfiy/shared/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is ErrorSearchState) {
          showMessageResponse(
              message: 'Link is not found', context: context, success: false);
        }
      },
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 80.h, left: 10.w, right: 10.w),
                  child: TextFormField(
                    onFieldSubmitted: (value) {
                      cubit.search(value);
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide:
                              const BorderSide(color: Color(0xFFEBF0FF)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: const BorderSide(
                                color: ColorConstant.generalColor)),
                        prefixIcon: const Icon(
                          CupertinoIcons.search,
                          color: ColorConstant.generalColor,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 12.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        hintText: 'Search by link',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12.sp,
                        )),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                if (state is! LoadingSearchState) const Divider(),
                if (state is LoadingSearchState)
                  LinearProgressIndicator(
                    color: ColorConstant.generalColor,
                  ),
                if(cubit.searchProductModel!=null)
                 Padding(
                   padding:  EdgeInsets.all(15.h),
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
                                borderRadius: BorderRadius.circular(8.r),
                                child: Image.network(
                                    width: 150.w,
                                    height: 128.h,
                                    cubit.searchProductModel!.data!.product!
                                        .image!),
                              ),
                              Positioned(
                                right: 5.w,
                                bottom: 5.w,
                                child: CircleAvatar(
                                  radius: 12.r,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    size: 15.r,
                                    SolarIconsOutline.heart,
                                    color: ColorConstant.generalColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  cubit.searchProductModel!.data!.product!.name!,
                                  style: GoogleFonts.poppins(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  cubit.searchProductModel!.data!.product!
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
                                          '${cubit.searchProductModel!.data!.product!.price!} EG',
                                          style: GoogleFonts.poppins(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Row(
                                          children: [
                                            RatingBar.builder(
                                              initialRating: cubit
                                                  .searchProductModel!
                                                  .data!
                                                  .product!
                                                  .averageRating!,
                                              itemSize: 12.r,
                                              minRating: cubit.searchProductModel!
                                                  .data!.product!.averageRating!,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 1.w),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              unratedColor: Colors.grey,
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Text(
                                              '(${cubit.searchProductModel!.data!.product!.averageRating!})',
                                              style: GoogleFonts.poppins(
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Image.network(
                                      cubit.searchProductModel!.data!.product!
                                          .brand!.icon!,
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
