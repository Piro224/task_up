import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_up/splashScreen/splashScreen.dart';

import 'Models/formcontroller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FormController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MY TASK APP',
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
       
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      home: const SplashScreen(),
    );
  }
}
