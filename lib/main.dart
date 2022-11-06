import 'package:final_thesis_the_jars_c2019/database/auth_controller.dart';
import 'package:final_thesis_the_jars_c2019/pages/CartPage.dart';
import 'package:final_thesis_the_jars_c2019/pages/Homepage.dart';
import 'package:final_thesis_the_jars_c2019/pages/ItemPage.dart';
import 'package:final_thesis_the_jars_c2019/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:final_thesis_the_jars_c2019/pages/login_page.dart';
import 'package:final_thesis_the_jars_c2019/pages/signup_page.dart';
import 'package:final_thesis_the_jars_c2019/pages/welcome_page.dart';
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      //home: LoginPage()
        routes: {
       "/" : (context) => LoginPage(),
         "login_Page" : (context) => LoginPage(),
         "signup_Page" : (context) => SignUpPage(),
        "homePage" : (context) => HomePage(),
        "cartPage" : (context) => CartPage(),
        "itemPage" : (context) => ItemPage(),
      },
    );
  }
}
