import 'package:econfiy/controller/layout/layout_cubit.dart';
import 'package:econfiy/modules/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:solar_icons/solar_icons.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit=context.read<LayoutCubit>();
        return Scaffold(
          body:cubit.screens[cubit.currentScreen],
          bottomNavigationBar: Card(
            elevation: 15,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w,
                    vertical: 10.h),
                child: GNav(
                    haptic: true,
                    iconSize: 26,
                    gap: 8,
                    color: const Color(0xFF539DF3),
                    activeColor: const Color(0xFF539DF3),
                    tabBackgroundColor: const Color(0xFF539DF3).withOpacity(
                        0.37),
                    padding: EdgeInsets.symmetric(
                        horizontal: 12.w, vertical: 8.h),
                    onTabChange: (value) {
                      cubit.changeIndexScreen(value);
                      print(value);
                    },
                    // navigation bar padding
                    tabs: const[
                      GButton(
                        icon: SolarIconsOutline.home,
                        text: 'Home',
                        iconColor: Color(0xFF484C52),
                      ),
                      GButton(
                        icon: CupertinoIcons.search,
                        text: 'Search',
                        iconColor: Color(0xFF484C52),
                      ),
                      GButton(
                        icon: SolarIconsOutline.heart,
                        text: 'Favourite',
                        iconColor: Color(0xFF484C52),
                      ),
                      GButton(
                        icon: SolarIconsOutline.user,
                        text: 'Profile',
                        iconColor: Color(0xFF484C52),
                      )
                    ]
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
