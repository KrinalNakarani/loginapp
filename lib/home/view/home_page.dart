import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/home/view/login.dart';

import '../controller/homeController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  LRController lrc = Get.put(LRController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text("Taste Me"),
          actions: [
            IconButton(onPressed:(){
              lrc.signOut();
              Get.to(LoginScreen());
            } ,icon:Icon(Icons.logout)),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Container(),
      ),
    );
  }
}
