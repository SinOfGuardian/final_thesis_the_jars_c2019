import 'package:final_thesis_the_jars_c2019/widgets/customSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
final emailController = TextEditingController();


@override
void dispose(){
  emailController.dispose();
  super.dispose();
}

Future passwordReset() async{
 try{
     await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());

     CustomSnackBar.showSnackBar(
                  context: context,
                  title: "Success!",
                  message: "Password reset link sent! Check your email",
                  backgroundColor: Colors.green);
 }on FirebaseAuthException catch(e){
    print(e);
              CustomSnackBar.showSnackBar(
                  context: context,
                  title: "Error:",
                  message: e.message.toString(),
                  backgroundColor: Colors.redAccent);
 }

}

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Back",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
        
        
        ),
        backgroundColor: Color.fromARGB(255, 192, 153, 62),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Enter Your Email and we will send you a password reset',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
            ),
          ),
          //email textfield
          SizedBox(height: 10,),
               Container(
                    height: h*0.08,
                    decoration: BoxDecoration(  
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)
                        )
                      ]
                    ),
                    child: TextField(
                      controller: emailController,
              
                      decoration: InputDecoration(
                        hintText: "Email ",
                        prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 170, 108, 85),),
                        
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 164, 150, 56),
                            width: 1.0,
                            ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),
                      
                      ),
                    ),
                  ),
                 MaterialButton(
                  onPressed: passwordReset,
                  child: Text('Reset Password'),
                  color: Colors.brown[300],
                  ),
        ],
      ),
    );
  }
}