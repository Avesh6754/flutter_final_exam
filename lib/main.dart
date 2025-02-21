
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_exam/services/authFirebase.dart';
import 'package:flutter_final_exam/services/dbhelper.dart';
import 'package:flutter_final_exam/views/homePage.dart';
import 'package:flutter_final_exam/views/signIn.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DbHelper.dbHelper.database;
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:(AuthServices.authServices.getCurrentUser()!=null)?HomePage():Signin(),
    );
  }
}
