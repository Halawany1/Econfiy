import 'package:bloc/bloc.dart';
import 'package:econfiy/modules/favourite/favourite_screen.dart';
import 'package:econfiy/modules/home/home_screen.dart';
import 'package:econfiy/modules/profile/profile_screen.dart';
import 'package:econfiy/modules/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  List<Widget> screens=const[
    HomeScreen(),
    SearchScreen(),
    FasvouriteScreen(),
    ProfileScreen()
  ];
  int currentScreen=0;
  void changeIndexScreen(int index){
    currentScreen=index;
    emit(ChangeIndexScreenState());
  }
}
