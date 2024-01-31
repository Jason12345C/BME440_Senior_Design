import 'package:flutter/material.dart';
import 'package:risestride/onboarding/onboarding_view.dart';
import 'package:risestride/pages/home.dart';
import 'common/colors_extension.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false, 
        title: "Rise Stride",
        theme: ThemeData(primaryColor: ThemeColors.primaryColor1);
        fontFamily: "Poppins",
        home: const OnBoardingView()); //MaterialApp
  }
}
