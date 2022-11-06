import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUserName extends StatelessWidget {
 // const GetUserName({super.key});
final String documentId;

 GetUserName({required this.documentId});

  @override
  Widget build(BuildContext context) {

    //get collection
    CollectionReference profileInfo = FirebaseFirestore.instance.collection('profileInfo');
    
    return FutureBuilder<DocumentSnapshot>(
      future: profileInfo.doc(documentId).get(),
      builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done){
        Map<String, dynamic> data = 
            snapshot.data!.data() as Map<String, dynamic>;
            return Text(' ${data['fname']}' + 
            ' ' +
             ' ${data['lname']}'+ 
             ' ' + 
             ' ${data['age']}'+
              ' ' + 
              ' ${data['gender']}');
      }
      return Text('loading...');
    },);
  }
}