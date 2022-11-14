
import 'package:final_thesis_the_jars_c2019/database/DatabaseManager.dart';
import 'package:final_thesis_the_jars_c2019/readData/get_product.dart';
import 'package:final_thesis_the_jars_c2019/widgets/HomeAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeitemWidget extends StatefulWidget {
  const HomeitemWidget({super.key});

  @override
  State<HomeitemWidget> createState() => _HomeitemWidget();
}

class _HomeitemWidget extends State<HomeitemWidget> {
   List productIDs = [];

  Future getproductIDs() async{
    await FirebaseFirestore.instance
    .collection('product')
   // .orderBy('age ', descending: false)
    .get()
    .then(
      (snapshot) => snapshot.docs.forEach((document) {
        print(document.reference);
        productIDs.add(document.reference.id);
       }),
      );
  }
   @override
  void initState(){
    getproductIDs();
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

  @override
  Widget build(BuildContext context) {
     double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    // return   Container(
      
    //           color: Colors.white,
    //           margin: const EdgeInsets.only(bottom: 15.0),
    //           width: double.infinity,
    //           height: h*0.80,
    //           child: FutureBuilder(
                
    //           future: getproductIDs(),
    //           builder: (context, snapshot) {
                return GridView.builder(
                  shrinkWrap: true,
                //physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
               
               
                itemCount: productIDs.length,
                itemBuilder: (context, index){
                  return 
                  
                     GetProducts(docProduct: productIDs[index]);
               
               });
                  
              //   }),
              //  );
        
   
  }
 
}