import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UserModel{
   String? docId;
   String? fname;
   String? lname;
   String? mname;
   String? address;
    int? age;

  UserModel({
     this.docId, 
     this.fname,
     this.lname, 
     this.mname,
     this.address, 
     this.age, 
    });
UserModel.fromMap(DocumentSnapshot data){
    docId = data.id;
    fname = data["fname"];
    lname = data["lname"];
    mname = data["mname"];
    address = data["address"];
     age = data["age"];
}
    
   
}