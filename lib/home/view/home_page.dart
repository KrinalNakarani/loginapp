import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/home/view/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../controller/homeController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  LRController lrc = Get.put(LRController());
  //
  // var user;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   var fir = FirebaseAuth.instance;
  //    user = fir.currentUser;
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
          title: Text("Taste Me"),
          actions: [
            IconButton(onPressed: () {
              lrc.signOut();
              Get.to(LoginScreen());
            }, icon: Icon(Icons.logout)),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Column(
          children:[
            // Text("${user!.email}"),
            // SizedBox(
            //   width: 10,
            // ),
            // Text("${user!.providerData}"),
            // SizedBox(
            //   width: 10,
            // ),
            // Text("${user!.uid}"),
          ],
        ),
      ),
    );
  }
}
