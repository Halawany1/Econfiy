import 'package:econfiy/shared/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildMaterialButton extends StatelessWidget {
  const BuildMaterialButton({super.key,
  required this.text,
  required this.onPress,
    this.width=double.infinity
  });
  final String text;
  final double width;
  final VoidCallback onPress;


  @override
  Widget build(BuildContext context) {
    var font=Theme.of(context).textTheme;
    return MaterialButton(
        onPressed:onPress,
        height: 52.h,
        elevation: 8,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r)
        ),
        color: ColorConstant.generalColor,
        minWidth:width ,
        child: Text(text,
          style:font.titleMedium,),

      );
  }
}
