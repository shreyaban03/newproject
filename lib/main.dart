import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/color_extension.dart';
import 'package:flutter_application_1/view/splash_view.dart';
import 'package:get/get.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Music Player",
      debugShowCheckedModeBanner: false,
        theme :ThemeData(
          fontFamily: "Circular Std",
          scaffoldBackgroundColor: TColor.bg,
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: TColor.primaryText,
            displayColor: TColor.primaryText,
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: TColor.primary,
        ) ,
        useMaterial3: false,
          ),
          home:const SplashView(),
    );
  }
}