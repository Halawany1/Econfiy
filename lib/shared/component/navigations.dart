import 'package:flutter/material.dart';

void pushReplacement(BuildContext context,Widget widget){
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder:(context) {
        return widget;
      },));
}


void push(BuildContext context,Widget widget){
  Navigator.push(context,
      MaterialPageRoute(builder:(context) {
        return widget;
      },));
}