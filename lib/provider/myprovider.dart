import 'package:final_thesis_the_jars_c2019/model/category_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class MyProvider with ChangeNotifier{
//   List<CategoryModel> category_model =[];
//   late CategoryModel categoryModel;

//   Future <void> getCategories()async{
//     List<CategoryModel> list = [];
//     QuerySnapshot querySnapshot=await FirebaseFirestore.instance.collection("Categories").get();
//     querySnapshot.docs.forEach((categorydata) {
//       categoryModel=CategoryModel(
//       image: categorydata.data()["image"], 
//       name: categorydata.data()["name"],
//       );
//       list.data(categoryModel);
//      });
//      categoryModelList = list;
//   }
// }