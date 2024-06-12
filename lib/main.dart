import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:econfiy/shared/constant/color.dart';
import 'package:econfiy/controller/authentication/authentication_cubit.dart';
import 'package:econfiy/controller/home/home_cubit.dart';
import 'package:econfiy/controller/layout/layout_cubit.dart';
import 'package:econfiy/controller/onboarding/on_boarding_cubit.dart';
import 'package:econfiy/controller/product/product_cubit.dart';
import 'package:econfiy/modules/onboarding/onboarding_screen.dart';
import 'package:econfiy/shared/network/bloc_observer.dart';
import 'package:econfiy/shared/network/local.dart';
import 'package:econfiy/shared/network/remote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => OnBoardingCubit(),),
            BlocProvider(create: (context) => AuthenticationCubit(),),
            BlocProvider(create: (context) => HomeCubit(),),
            BlocProvider(create: (context) => LayoutCubit(),),
            BlocProvider(create: (context) => ProductCubit(),)
          ],
          child: MaterialApp(
            home: AnimatedSplashScreen(
              animationDuration: const Duration(milliseconds: 500),
              pageTransitionType: PageTransitionType.fade,
              backgroundColor: Colors.white,
              splashIconSize:150.h ,
              splash: "assets/images/splash.png",
              nextScreen: const OnBoardingScreen(),
            ),

            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white
              ),
              backgroundColor: Colors.black,
                scaffoldBackgroundColor: Colors.white,
              cardColor: ColorConstant.cardColor,
              hoverColor: ColorConstant.boxSignInServiceColor,
              canvasColor: ColorConstant.lineColor,
              highlightColor: ColorConstant.textTitleColor,
              textTheme: TextTheme(
                titleMedium: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp
                )
              )
            ),
            themeMode: ThemeMode.light,

          ),
        );
      },
    );
  }
}

