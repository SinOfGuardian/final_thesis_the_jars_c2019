
import 'package:final_thesis_the_jars_c2019/app/customBottomNavBar.dart';
import 'package:final_thesis_the_jars_c2019/pages/Homepage.dart';
import 'package:final_thesis_the_jars_c2019/pages/Homepage_Page.dart';
import 'package:final_thesis_the_jars_c2019/pages/Welcomehome_page.dart';
import 'package:final_thesis_the_jars_c2019/pages/login_page.dart';
import 'package:final_thesis_the_jars_c2019/pages/welcome_page.dart';
import 'package:final_thesis_the_jars_c2019/widgets/customSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AuthController extends GetxController{
  //AuthController.instance..
    static AuthController instance = Get.find();
    //email, password, name...
    late Rx<User?> _user;
    FirebaseAuth auth = FirebaseAuth.instance;

    @override
    void onReady(){
      super.onReady();
      _user = Rx<User?>(auth.currentUser);
      //our user would be notified
      _user.bindStream(auth.userChanges());
      ever(_user, _initialScreen);

    }

    _initialScreen(User? user){
      if(user==null){
        //print("Login page");
        Get.offAll(()=>LoginPage());
      }else{
      //  Get.offAll(()=>WelcomehomePage());
       //Get.offAll(()=>WelcomePage());
       //Get.offAll(()=>HomePage());
      // Get.offAll(()=>HomePagePage());
      //Get.offAll(() => customBottomNavBar());
      Get.offAll(()=>customBottomNavBar());
      }
    }

    void register(String email, password)async{
      try{
        await auth.createUserWithEmailAndPassword(email: email, password: password);
        
      } on FirebaseAuthException catch(e){
        if(e.code == 'weakpassword'){
          print('The password provided is too week');
        } else if  (e.code == 'email-already-in-use') {
          print('The account already ixist for that email');
          }
      
        Get.snackbar("About User", "User Message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Account Creation Failed",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white
          ),
        )
        );
      }
    }
    
   


       void login(String email, password)async{
      try{
        //loading circle
        

        await auth.signInWithEmailAndPassword(email: email, password: password);
      }catch(e){
   

         CustomSnackBar.showSnackBar(
                  context: Get.context,
                  title: "Login Failed",
                  message: "Something is wrong!",
                  backgroundColor: Colors.redAccent);
      }
    }
    void logOut()async{
      await auth.signOut();
    }

}