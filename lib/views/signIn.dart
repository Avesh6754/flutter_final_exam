import 'package:flutter/material.dart';
import 'package:flutter_final_exam/services/authFirebase.dart';
import 'package:flutter_final_exam/views/signUp.dart';
import 'package:get/get.dart';

import 'homePage.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              TextField(
                controller: habitController.txtEmail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                    ), hintText: 'Email'),
              ),
              TextField(
                controller: habitController.txtPassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:  BorderRadius.circular(15)
                    ), hintText: 'Password'),
              ),
              ElevatedButton(onPressed: () async {
               final result= await AuthServices.authServices.signWithEmailAndPassWord(habitController.txtEmail.text, habitController.txtPassword.text);
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                  Get.snackbar("Sign In Successfully", "",duration:Duration(seconds: 1));
              }, child: Text("Sign In")),
              TextButton(onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp(),));
              }, child: Text("Don't Have account"))
            ],
          ),
        ),
      ),
    );
  }
}
