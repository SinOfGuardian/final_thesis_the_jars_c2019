
import 'package:final_thesis_the_jars_c2019/database/DatabaseManager.dart';
import 'package:final_thesis_the_jars_c2019/readData/get_categories.dart';
import 'package:final_thesis_the_jars_c2019/widgets/HomeAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePagePage extends StatefulWidget {
  const HomePagePage({super.key});

  @override
  State<HomePagePage> createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePagePage> {
   List categoriesIDs = [];

  Future getcategoriesIDs() async{
    await FirebaseFirestore.instance
    .collection('categories')
   // .orderBy('age ', descending: false)
    .get()
    .then(
      (snapshot) => snapshot.docs.forEach((document) {
        print(document.reference);
        categoriesIDs.add(document.reference.id);
       }),
      );
  }
   @override
  void initState(){
    getcategoriesIDs();
    //fetchcategories();
     //fetchDatabaseList();
    //TODO: implement initState
    super.initState();
  }
    List productitemList = [];

  fetchDatabaseList() async{
    dynamic resultant = await DatabaseManager().getUsersList();
     
     if (resultant == null){
      print("Unable to retrieve");
     }else{
      setState(() {
        productitemList = resultant;
      });
      
     }
  }
  //    fetchcategories() async{
    
  //   QuerySnapshot qn = await FirebaseFirestore.instance.collection("categories").get();
  //   setState((){
  //     for(int i = 0; i<qn.docs.length; i++){
  //     _categoriesWidget.add(
  //       {
  //         "category":qn.docs[i]["category"],
  //         "image": qn.docs[i]["image"]
  //       }
  //       //qn.docs[i]["image"],
  //     );

  //   }
  //   });
  //   return qn.docs;
  //  }
  @override
  Widget build(BuildContext context) {
     double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(    
      body: ListView(children: [
        HomeAppBar(),
        Container(
          
          //remporary height
          //height: 500,
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 247, 232, 212),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight:  Radius.circular(35)
            ),
          ),
        child: Column(children: [

          //Search Widget
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              children: [
              Container(
                margin: EdgeInsets.only(left: 5),
                height: 50,
                width: 200,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search here...",
                  ),
                ),
              ),
              Spacer(),
              Icon(
                Icons.mic,
                size: 24,
                color: Color.fromARGB(255, 190, 143, 77),
                
              ),
                   
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.camera_alt,
                  size: 24,
                  color: Color.fromARGB(255, 190, 143, 77),
                  
                ),
              ),
               
            ],),
          ),
          SizedBox(height: 10,),

        
      ]),
        ),
          SingleChildScrollView(
               
               child: FutureBuilder(
                
                future: getcategoriesIDs(),
                builder: (context, snapshot) {
                  return ListView.builder(
                  
                  scrollDirection: Axis.vertical,
                  
                  shrinkWrap: true,
                  itemCount: categoriesIDs.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ListTile(
                        title: GetCategories(docCategory: categoriesIDs[index]),
                        tileColor: Colors.grey[200],
                ),
                    );
               });
                  
                }),
               ), 
      ]),
         
        
          );
  }
}