import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/home/view/home_page.dart';
import 'package:loginapp/home/view/login.dart';
import 'package:loginapp/home/view/ragisterScreen.dart';
import 'package:loginapp/home/view/splashScreen.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>SplashScreen(),
        '/login':(context)=>LoginScreen(),
        '/sign':(context)=>RegisterScreen(),
        '/home':(context)=>HomeScreen(),
      },
    ),
  );
}