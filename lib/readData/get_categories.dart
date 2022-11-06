import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetCategories extends StatelessWidget {
     List categoriesIDs = [];

 final String docCategory;

 GetCategories({required this.docCategory});

  @override
  Widget build(BuildContext context) {
     
    CollectionReference categories_ = FirebaseFirestore.instance.collection('categories');

       return FutureBuilder<DocumentSnapshot>(
      future: categories_.doc(docCategory).get(), 
      builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
        Map<String, dynamic> data = 
            snapshot.data!.data() as Map<String, dynamic>;
           // Image.network('${data['image']}');

            return Text(' ${data['category']}', //+
              //+ 
            // ' ' +
            //  ' ${data['image']}'
            
             style: TextStyle(
                 fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 190, 143, 77),
             ),
             );
         
              
      }
      return Text('loading...');
    },);
  
  }
    
}