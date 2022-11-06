import 'package:final_thesis_the_jars_c2019/database/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_thesis_the_jars_c2019/model/user_model.dart';
import 'package:final_thesis_the_jars_c2019/pages/Homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePage();
  }
class _WelcomePage extends State<WelcomePage>{
  final userLogin = FirebaseAuth.instance.currentUser!;

  //document IDs
  List<String> docIDs = [];

  //get DocsIDs
  Future getDocId() async{
    await FirebaseFirestore.instance.collection('profileInfo').get().then(
      (snapshot) => snapshot.docs.forEach((document) {
        print(document.reference);
        docIDs.add(document.reference.id);
       }),
      );
  }

  @override
  void initState(){
    getDocId();
    super.initState();
  }

  final UserModel user = new UserModel();
   static const routeName = '/user_model';

   late String docId;
   late String fname;
   late String lname;
   late String email;
   late int age;
   late String gender;
   late String address;


 // WelcomePage({Key? key, }) : super(key: key);
  
 // final _fnameController = TextEditingController() ;

  @override
  Widget build(BuildContext context){
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

   
   return Scaffold(
       backgroundColor: Colors.white,
      body: SingleChildScrollView(
        
        child: Column(
          children: [
            Container(
      
              width: w,
              height: h*0.25,
              
              child: Column(
                children: [
                  SizedBox( height: h*0.08,),
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 170, 108, 85),
                    radius: 40,
                    backgroundImage: AssetImage(
                      "assets/images/profile.png"
                    ),
                  )
                ],
              ),
            ),
      
             SizedBox(height: 25,),
            
           Container(
            width: w,
            margin: const EdgeInsets.only(left: 20),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                "WELCOME!",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 170, 108, 85),
                ),
              ),
      
               Text(
                'Signed in as: '+ userLogin.email!,
                style: TextStyle(
                  fontSize: 18,
                  
                  color: Colors.grey[500],
                ),
              ),
              ],
             ),
           ),
          SizedBox(height: 10,),
               
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const SizedBox(height: 40,),
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
                       //controller: name.emailController,
                      
                        decoration: InputDecoration(
                          hintText: "Full Name ",
                          prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 170, 108, 85),),
                          
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                    )
                            ),
                          
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                              )
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
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
                       // controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Age ",
                          prefixIcon: Icon(Icons.numbers, color: Color.fromARGB(255, 170, 108, 85),),
                          
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                    )
                            ),
                          
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                              )
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
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
                       // controller: emailController,
                
                        decoration: InputDecoration(
                          hintText: "Gender ",
                          prefixIcon: Icon(Icons.transgender, color: Color.fromARGB(255, 170, 108, 85),),
                          
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                    )
                            ),
                          
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                              )
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
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
                       // controller: emailController,
                
                        decoration: InputDecoration(
                          hintText: "Address ",
                          prefixIcon: Icon(Icons.location_city, color: Color.fromARGB(255, 170, 108, 85),),
                          
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                    )
                            ),
                          
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                              )
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                          ),
                        ),
                      ),
                    ),
            
               ]),
              ),


            ),
                   
                  SizedBox(height: 20,),
            SingleChildScrollView(
               scrollDirection: Axis.horizontal,

              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      //AuthController.instance.logOut();
                     // Navigator.pushNamed(context, "homePage");
                    },
                    child: Container(
                    width: w * 0.3,
                    height: h * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage("assets/images/loginbtn1.png"),
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Text(
                        "Add",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                          ),
                  ),
              SizedBox(width: 5,),
                  GestureDetector(
                onTap: (){
                    //AuthController.instance.logOut();
                },  
                child: Container(
                    width: w * 0.3,
                    height: h * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage("assets/images/loginbtn1.png"),
                        fit: BoxFit.cover),
                ),
                child: Center(
                    child: Text(
                      "Update",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                ),
                        ),
              ),
              SizedBox(width: 5,),
               GestureDetector(
                    onTap: (){
                      //AuthController.instance.logOut();
                      Navigator.pushNamed(context, "homePage");
                    },
                    child: Container(
                    width: w * 0.3,
                    height: h * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage("assets/images/loginbtn1.png"),
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                          ),
                  ),
                SizedBox(width: 5,),
                  GestureDetector(
                onTap: (){
                    AuthController.instance.logOut();
                },  
                child: Container(
                    width: w * 0.3,
                    height: h * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage("assets/images/loginbtn1.png"),
                        fit: BoxFit.cover),
                ),
                child: Center(
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                ),
                        ),
              ),
                  
                ],
              ),
            ),      
             SizedBox(height: 20,),
            ]),
           
      ),
      
    );
  }
  
}