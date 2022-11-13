import 'package:final_thesis_the_jars_c2019/database/auth_controller.dart';
import 'package:final_thesis_the_jars_c2019/widgets/customButton.dart';
import 'package:final_thesis_the_jars_c2019/widgets/customFullScreenDialog.dart';
import 'package:final_thesis_the_jars_c2019/widgets/customSnackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

    
class SignUpPage extends StatefulWidget{
  
   SignUpPage({Key? key}) : super(key: key);
   @override
  _SignUpPageState createState() => _SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage>{
    final fnameController = TextEditingController();
    final lnameController = TextEditingController();
    final ageController = TextEditingController();
    final genderController = TextEditingController();
    final addressController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmpasswordController = TextEditingController();
    bool _isHidden = true,  _isconfirmHidden = true;
  
    
    
    @override
    void dispose(){
      fnameController.dispose();
      lnameController.dispose();
      ageController.dispose();
      genderController.dispose();
      addressController.dispose();
      emailController.dispose();
      passwordController.dispose();
      confirmpasswordController.dispose();
      super.dispose();
    }

   Future addUserDetails(String fname, String lname, int age, String gender, String address, String email)async{
      await FirebaseFirestore.instance.collection('profileInfo').add({
        'fname': fname,
        'lname': lname,
        'age': age,
        'gender': gender,
        'address': address,
        'email': email,
  
      });
      
    }
    bool passwordConfirmed(){
    if(passwordController.text.trim() == confirmpasswordController.text.trim()){
      return true;
    }else{
      return false;
    }
}
  @override
  Widget build(BuildContext context){
    

    List images = [
      "g.png",
      "f.png",
      "t.png"
    ];

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
              child: Column(
                children: [
                  SizedBox( height: h*0.16,),
                  const CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 40,
                    backgroundImage: AssetImage(
                      "assets/images/profile.png"
                    ),
                  )
                ],
              ),
            ),
      
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  const SizedBox(height: 40,),
                  Container(
                    
                    width: w*5.0,
                    height: h*0.08,
                    decoration: BoxDecoration(  
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)
                        )
                      ]
                    ),
                    child: Center(
                      
                      child: TextField(
                        
                        controller: fnameController,
              
                        decoration: InputDecoration(
                          
                          hintText: "First Name ",
                          
                          prefixIcon: const Icon(Icons.person, color: Color.fromARGB(255, 170, 108, 85),),
                          
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 164, 150, 56),
                              width: 1.0,
                              ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(50)
                          ),
                        
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),

                   Container(
                    height: h*0.08,
                    decoration: BoxDecoration(  
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)
                        )
                      ]
                    ),
                    child: TextField(
                       keyboardType: TextInputType.multiline,
                      controller: lnameController,
              
                      decoration: InputDecoration(
                        hintText: "Last Name ",
                        prefixIcon: const Icon(Icons.people, color: Color.fromARGB(255, 170, 108, 85),),
                        
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 164, 150, 56),
                            width: 1.0,
                            ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),
                      
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                   Container(
                    height: h*0.08,
                    decoration: BoxDecoration(  
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)
                        )
                      ]
                    ),
                    child: TextField(
                      controller: ageController,
                       keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Age ",
                        prefixIcon: const Icon(Icons.numbers, color: Color.fromARGB(255, 170, 108, 85),),
                        
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 164, 150, 56),
                            width: 1.0,
                            ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),
                      
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: h*0.08,
                    decoration: BoxDecoration(  
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)
                        )
                      ]
                    ),
                    child: TextField(
                      controller: genderController,
                      
                      decoration: InputDecoration(
                        hintText: "Gender",
                        prefixIcon: const Icon(Icons.transgender, color: Color.fromARGB(255, 170, 108, 85),),
                        
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 164, 150, 56),
                            width: 1.0,
                            ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),
                      
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: h*0.08,
                    decoration: BoxDecoration(  
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)
                        )
                      ]
                    ),
                    child: TextField(
                      controller: addressController,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                        hintText: "Address",
                        prefixIcon: const Icon(Icons.location_city, color: Color.fromARGB(255, 170, 108, 85),),
                        
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 164, 150, 56),
                            width: 1.0,
                            ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),
                      
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),

                  Container(
                    height: h*0.08,
                    decoration: BoxDecoration(  
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)
                        )
                      ]
                    ),
                    child: TextField(
                      controller: emailController,
                       keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: const Icon(Icons.email, color: Color.fromARGB(255, 170, 108, 85),),
                        
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 164, 150, 56),
                            width: 1.0,
                            ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),
                      
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
      
                  Container(
                    height: h*0.08,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)
                        )
                      ]
                    ),
                    child: TextField(
                      
                      controller: passwordController,
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                        hintText: "Password ",
                         suffixIcon: InkWell(
                          onTap: _togglePasswordView,
                          
                          child: Icon( 
                            color: Colors.black45,
                            _isHidden
                            ?Icons.visibility_off : Icons.visibility),
                          ),
                        prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 170, 108, 85),
                        ),
                        
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 164, 150, 56),
                            
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),

                    Container(
                    height: h*0.08,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)
                        )
                      ]
                    ),
                    child: TextField(
                      
                      controller: confirmpasswordController,
                      obscureText: _isconfirmHidden,
                      decoration: InputDecoration(
                        hintText: "ConfirmPassword ",
                         suffixIcon: InkWell(
                          onTap: _toggleconfirmPasswordView,
                          
                          child: Icon( 
                            color: Colors.black45,
                            _isconfirmHidden
                            ?Icons.visibility_off : Icons.visibility),
                          ),
                        prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 170, 108, 85),
                        ),
                        
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 164, 150, 56),
                            
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 25,),
                 
            GestureDetector(
              onTap: (){
                if (passwordConfirmed()){
                  saveUpdateEmployee();
                
                  CustomFullScreenDialog.showDialog();
                  CustomSnackBar.showSnackBar(
                  context: Get.context,
                  title: "Success!",
                  message: "Register is completed",
                  backgroundColor: Colors.green);
                  Get.back();
                }else{
                  //  CustomFullScreenDialog.cancelDialog();
                  CustomSnackBar.showSnackBar(
                  context: Get.context,
                  title: "Error:",
                  message: "Password is not same",
                  backgroundColor: Colors.redAccent);
                }
              },
              child: Container(
                margin: const EdgeInsets.only(left: 60.0),
                width: w*0.5,
                height: h*0.07,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image:const DecorationImage(
                    image: AssetImage(
                    "assets/images/loginbtn1.png"
                    ),
                    fit: BoxFit.cover
                  ),
                ),
                child: const Center(
                  child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      
                ),
                
              ),
            ),
             Padding(
               padding: const EdgeInsets.only(left: 100.0, top: 20.0),
               child: RichText(
            
            text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap=()=>Get.back(), 
                text: "Have an account?",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[500],
                   decoration: TextDecoration.underline,
                   fontWeight: FontWeight.bold,
                )
            )
          ),
             ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 20.0),
              child: RichText(
                text: TextSpan(
                text: "Sign up using on the following method",
                
                style: TextStyle(
                  
                  color: Colors.grey[500],
                  fontSize: 14,
                ),
               
              ),),
            ),
            const SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.only(left: 75.0),
             child: Wrap(
              
                  children: List<Widget>.generate(
                  3 , 
                  (index){
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: const Color.fromARGB(255, 212, 118, 84),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(
                            "assets/images/"+images[index]
                          ),
                        ),
                      ),
                    );
                  }),
                ),
           ),
            
             ]),
            ),
      
            const SizedBox(height: 50,),
          
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
  void _toggleconfirmPasswordView() {
    setState(() {
      _isconfirmHidden = !_isconfirmHidden;
    });
  }
   void saveUpdateEmployee(){
                  AuthController.instance.register(emailController.text.trim(), passwordController.text.trim(),);

                  addUserDetails(
                    fnameController.text.trim(),
                    lnameController.text.trim(),
                    int.parse(ageController.text.trim()),
                    genderController.text.trim(),
                    addressController.text.trim(),
                    emailController.text.trim(),
                  );
   }
}
