import 'package:final_thesis_the_jars_c2019/database/auth_controller.dart';
import 'package:final_thesis_the_jars_c2019/pages/forgotpwPage.dart';
import 'package:final_thesis_the_jars_c2019/pages/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginPage extends StatefulWidget{
  const LoginPage ({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();

}
class _LoginPageState extends State<LoginPage>{
    bool _isHidden = true;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context){
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w,
              height: h*0.3,
              decoration: const BoxDecoration(
                image:DecorationImage(
                image: AssetImage(
                  "assets/images/appbarwithtitle.png"
                  ),
                  fit: BoxFit.fill
                ),
              ),

            ),
      
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
             
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: 54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign into your account",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(height: 30,),
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
                            
                            
                            )
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
                  SizedBox(height: 20,),
      
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
                         
                      controller: passwordController,
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                        hintText: "Password ",

                        prefixIcon:  Icon(Icons.lock, color: Color.fromARGB(255, 170, 108, 85),  size: 24,),
                        
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 164, 150, 56),
                            width: 1.0,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),
                         suffixIcon: InkWell(
                          
                          onTap: _togglePasswordView,
                          child: Icon( 
                            color: Colors.black45,
                            size: 24, 
                            _isHidden
                            ?Icons.visibility_off : Icons.visibility),
                          ),
                      ),
                    ),
                    
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context){
                            return ForgotPasswordPage();
                          },
                          ),);
                        },
                        child: Text(
                        "Forget Password?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                          decoration: TextDecoration.underline,
                        ),
                                          ),
                      ),
                      ],
                    ),
                  ),
                  
      
             ]),
            ),
      
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
              //   showDialog(
              //      context: context, 
              //      builder: (context){
              //   return CircularProgressIndicator();
              // });
                AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
              },
              child: Container(
                width: w*0.5,
                height: h*0.07,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image:DecorationImage(
                  image: AssetImage(
                    "assets/images/loginbtn1.png"
                    ),
                    fit: BoxFit.cover
                  ),
                ),
                child: Center(
                  child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                ),
              ),
            ),
            SizedBox(height: w*0.1),
            RichText(text: TextSpan(
              text: "Don\'t have an account?",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: " Create",
                  style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
               ),
               recognizer: TapGestureRecognizer()..onTap=() => Get.to(()=>SignUpPage())
               ),
              ]
            ),),
      
          ],
        ),
      ),
    );
  }
 void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  
  }
}