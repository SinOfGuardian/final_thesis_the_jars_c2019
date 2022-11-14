import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetProducts extends StatelessWidget {
     List productIDs = [];

 final String docProduct;

 GetProducts({required this.docProduct});




  @override
  Widget build(BuildContext context) {
     
    CollectionReference categories_ = FirebaseFirestore.instance.collection('product');

       return FutureBuilder<DocumentSnapshot>(
       
      future: categories_.doc(docProduct).get(), 
      builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
        Map<String, dynamic> data = 
            snapshot.data!.data() as Map<String, dynamic>;
            
          //  // Image.network('${data['image']}');
          //    Image.network('${data['item_image']}');
          //    Text(' ${data['item_name']}', //+
          //   // Text(Products[index]["item_price"].toString()),
          //     //+ 
          //   // ' ' +
          //   //  ' ${data['image']}'
            
          //    style: TextStyle(
          //        fontWeight: FontWeight.bold,
          //           fontSize: 16,
          //           color: Color.fromARGB(255, 190, 143, 77),
          //    ),
          //    );
     
            return (snapshot.connectionState == ConnectionState.waiting)
         
          ? const Center(
            // color: Colors.amber,
            //    margin: const EdgeInsets.only(bottom: 15.0),
            //    width: double.infinity,
            // height: h*0.60,
           child:CircularProgressIndicator(),
          )
          : Container(
              
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10,),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),    
          child: Column(
            
                 children: [
                  
                         //   Image.network('data["item_image"][0]'),
                           // Image.network("${Products[index]["item_image"][0]}",),
                  //top of card 
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 190, 143, 77),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Sale",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    
                         const Icon(Icons.favorite_border,
                         color: Colors.red,
                         ),
                     ],
                   ),
                            
                   InkWell(
                    onTap: (){
                    Navigator.pushNamed(context, "itemPage");
                  },
                     child: Container(
                      margin: const EdgeInsets.all(10),
                         child: Image.network("${data["item_image"][0]}",),
                      // child: Image.network('${data["item_image"]}',height: 40, width: 40,),
                      //child: Image.asset("assets/images/1.png", height: 40,width: 40,),
                          height: 80,
                      width: 80,      
                                     ),
                   ),
                   Flexible(
                    // flex: 2,
                    // padding: EdgeInsets.only(bottom: 8),
                    // alignment: Alignment.centerLeft,
                    child: Text('${data["item_name"]}', 
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 190, 143, 77),
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                   ), 
                //   Container(
                //     alignment: Alignment.centerLeft,
                //     child: Text('${data["item_description"]}',
                //     maxLines: 2,
                //     overflow: TextOverflow.ellipsis,
                //     style: TextStyle(
                //       fontSize: 12,
                //       color: Color.fromARGB(255, 190, 143, 77),
                //     ),
                //   ),
                // ),
                  // const SizedBox(height: 10,),
                  Flexible(
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                            Text("₱ "'${data["item_price"].toString()}',
                             style: const TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 190, 143, 77),
                               ),
                            ),
                           const Icon(
                          Icons.shopping_cart_checkout,
                          color: Color.fromARGB(255, 190, 143, 77),
                          ),
                        
                          ],),
                          
                      ),
                       const SizedBox(height: 10,),
                          ],
                      ),
                      
                  );
         
              
      }
      return const Text('loading...');
    },);
  
  }
    
}