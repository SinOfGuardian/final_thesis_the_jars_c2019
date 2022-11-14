import 'package:final_thesis_the_jars_c2019/database/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_thesis_the_jars_c2019/model/user_model.dart';
import 'package:final_thesis_the_jars_c2019/pages/Homepage.dart';
import 'package:final_thesis_the_jars_c2019/readData/get_product.dart';
import 'package:final_thesis_the_jars_c2019/readData/get_user_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';


class WelcomehomePage extends StatefulWidget {
  const WelcomehomePage({Key? key}) : super(key: key);

  @override
  State<WelcomehomePage> createState() => _WelcomehomePage();
  }
class _WelcomehomePage extends State<WelcomehomePage>{
  final userLogin = FirebaseAuth.instance.currentUser!;


  // List categoriesIDs = [];

  // Future getcategoriesIDs() async{
  //   await FirebaseFirestore.instance
  //   .collection('categories')
  //  // .orderBy('age ', descending: false)
  //   .get()
  //   .then(
  //     (snapshot) => snapshot.docs.forEach((document) {
  //       print(document.reference);
  //       categoriesIDs.add(document.reference.id);
  //      }),
  //     );
  // }
  //  @override
  // void initState(){
  //   //getcategoriesIDs();
  //   //fetchcategories();
  //    //fetchDatabaseList();
  //   //TODO: implement initState
  //   super.initState();
  // }

  //document IDs
  List<String> docIDs = [];

  //get DocsIDs
  Future getDocId() async{
    await FirebaseFirestore.instance
    .collection('profileInfo')
   // .orderBy('age ', descending: false)
    .get()
    .then(
      (snapshot) => snapshot.docs.forEach((document) {
        print(document.reference);
        docIDs.add(document.reference.id);
       }),
      );
  }

  // @override
  // void initState(){
  //   getDocId();
  //   super.initState();
  // }

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
      appBar: AppBar(
        
        title: Text(
                userLogin.email!,
                style: TextStyle(
                  fontSize: 16,
                  
                  color: Color.fromARGB(255, 50, 48, 48),
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: (){
                    FirebaseAuth.instance.signOut();
                  },
                  child: Icon(Icons.logout)),
              ],
      ),

       backgroundColor: Colors.white,
      body: Center(
        
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
              ],
             ),
           ),
          SizedBox(height: 10,),
               Expanded(
               child: FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot) {
                  return ListView.builder(
                  itemCount: docIDs.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ListTile(
                      title: GetUserName(documentId: docIDs[index]),
                      tileColor: Colors.grey[200],
                ),
                    );
               });
                  
                }),
               ), 

              //    Expanded(
              //  child: FutureBuilder(
              //   future: getcategoriesIDs(),
              //   builder: (context, snapshot) {
              //     return ListView.builder(
              //     itemCount: categoriesIDs.length,
              //     itemBuilder: (context, index){
              //       return Padding(
              //         padding: const EdgeInsets.all(4.0),
              //         child: ListTile(
              //         title: GetCategories(docCategory: categoriesIDs[index]),
              //         tileColor: Colors.grey[200],
              //   ),
              //       );
              //  });
                  
              //   }),
              //  ), 
               
         //HERE middle data
         



             
            ]),
           
      ),
    
      
    );
  }
  
}