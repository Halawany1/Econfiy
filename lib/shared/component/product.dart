import 'package:econfiy/controller/home/home_cubit.dart';
import 'package:econfiy/models/product_model.dart';
import 'package:econfiy/shared/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';

class BuildProductCard extends StatelessWidget {
  const BuildProductCard({super.key, required this.product});

  final ProductData product;

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
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
                      width: 150.w, height: 128.h, product.image!),
                ),
                Positioned(
                  right: 5.w,
                  bottom: 5.w,
                  child: InkWell(
                    onTap: () {
                      if(product.isFavorite==0){
                        cubit.postFavourites(product.id!);
                      }else{
                        cubit.deleteFavourites(product.id!);
                      }
                    },
                    child: CircleAvatar(
                      radius: 12.r,
                      backgroundColor: Colors.white,
                      child: Icon(
                        size: 15.r,
                        product.isFavorite==0?
                        CupertinoIcons.heart:CupertinoIcons.heart_fill,
                        color:  product.isFavorite==0?
                        ColorConstant.generalColor:Colors.red,
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
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    product.name!,
                    style: GoogleFonts.poppins(
                        fontSize: 15.sp, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    product.shortDescription!,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${product.price} EG',
                            style: GoogleFonts.poppins(
                                fontSize: 12.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              RatingBar.builder(
                                initialRating: product.averageRating!,
                                itemSize: 12.r,
                                minRating: product.averageRating!,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal:1.w),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                unratedColor: Colors.grey,
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(width: 2.w,),
                              Text(
                                '(${product.averageRating!})',
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
                        product.brand!.icon!,
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
    );
  }
}
