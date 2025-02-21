import 'package:flutter/material.dart';
import 'package:flutter_final_exam/services/authFirebase.dart';
import 'package:flutter_final_exam/views/signIn.dart';
import 'package:get/get.dart';

import 'homePage.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                final result= await AuthServices.authServices.createAccountWithEmailAndPassword(habitController.txtEmail.text, habitController.txtPassword.text);
                if(result=="response")
                {
                  habitController.txtPassword.clear();
                  habitController.txtEmail.clear();
                  Navigator.pop(context);
                  Get.snackbar("Sign Up Successfully", "",duration:Duration(seconds: 1));
                }
              }, child: Text("Sign Up")),

              TextButton(onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signin(),));
              }, child: Text("Already Have account"))
            ],
          ),
        ),
      ),
    );
  }
}
