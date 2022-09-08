import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/home/view/home_page.dart';
import 'package:loginapp/home/view/login.dart';

import '../controller/homeController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LRController lrc = Get.put(LRController());

  @override
  Widget build(BuildContext context) {
    splash();
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.pink.shade700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: Colors.pink),
                alignment: Alignment.center,
                child: Text(
                  "Taste Me",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void splash() {
    bool check = lrc.checkUser();
    if (check) {
      Timer(Duration(seconds: 3), () {
        Get.to(HomeScreen());
      });
    }
    else{
      Timer(Duration(seconds: 3), () {
        Get.to(LoginScreen());
      });
    }

  }
}
