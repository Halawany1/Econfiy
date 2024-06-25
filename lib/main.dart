import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:econfiy/controller/profile/profile_cubit.dart';
import 'package:econfiy/controller/search/search_cubit.dart';
import 'package:econfiy/layout/layout_screen.dart';
import 'package:econfiy/modules/log_in/log_in_screen.dart';
import 'package:econfiy/shared/constant/app.dart';
import 'package:econfiy/shared/constant/color.dart';
import 'package:econfiy/controller/authentication/authentication_cubit.dart';
import 'package:econfiy/controller/home/home_cubit.dart';
import 'package:econfiy/controller/layout/layout_cubit.dart';
import 'package:econfiy/controller/onboarding/on_boarding_cubit.dart';
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
  CacheHelper.deleteAllData();
  Bloc.observer = MyBlocObserver();
  Widget? widget;
  if(CacheHelper.getData(key: AppConstant.token) != null){
    widget=const LayoutScreen();
  }else{
    if(CacheHelper.getData(key: AppConstant.onBoarding) == null){
      widget=const OnBoardingScreen();
    }else{
      widget=const LogInScreen();
    }

  }
  print(CacheHelper.getData(key: AppConstant.token));
  runApp( MyApp(widget: widget,));
}

class MyApp extends StatelessWidget {

   MyApp({super.key, required this.widget});
  Widget widget;
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
            BlocProvider(create: (context) => HomeCubit()..
            getProducts()..getRecommendProducts()..getFavourites(),),
            BlocProvider(create: (context) => LayoutCubit(),),
            BlocProvider(create: (context) => SearchCubit(),),
            BlocProvider(create: (context) => ProfileCubit()..getProfile(),),
          ],
          child: MaterialApp(
            home: AnimatedSplashScreen(
              animationDuration: const Duration(milliseconds: 500),
              pageTransitionType: PageTransitionType.fade,
              backgroundColor: Colors.white,
              splashIconSize:150.h ,
              splash: "assets/images/splash.png",
              nextScreen: widget,
            ),

            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white
              ),
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
              ),/* colorScheme: ColorScheme(background: Colors.black)*/
            ),
            themeMode: ThemeMode.light,

          ),
        );
      },
    );
  }
}

