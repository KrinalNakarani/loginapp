import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/home/controller/homeController.dart';
import 'package:loginapp/home/view/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController Password = TextEditingController();

  LRController lrc = Get.put(LRController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Taste Me",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.pink,
                      ),
                      label: Text("E-mail"),
                    ),
                    cursorColor: Colors.pink,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                      controller: Password,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        focusColor: Colors.pink,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.pink,
                        ),
                        label: Text("Password"),
                      ),
                      cursorColor: Colors.pink,
                      keyboardType: TextInputType.number),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () async {
                      var data =
                          await lrc.createAccount(email.text, Password.text);
                      Get.snackbar("Sign up", "${data}");
                      if (data == "Success") {
                        Get.to(LoginScreen());
                      }
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
