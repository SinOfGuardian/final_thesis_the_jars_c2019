import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../database/DatabaseManager.dart';
class ItemsWidget extends StatelessWidget{
  // void getData()async{}
  // final data =  await Firebase.instance.collection("categories").doc('categories').get();
  //   snapshot = data;

  @override
  Widget build(BuildContext context){
    return GridView.count(
    
      childAspectRatio: 0.68,
      // it disable the scroll functionality of gridview 
      //then it will scroll in list view of home page
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      // itemBuilder:(_,index){
        
      // }
      children: <Widget>[
          // itemCount: productitemList.length,
          //  itemBuilder: (context,index){
        //for(int i = 0; i<22; i++)
           
      Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
            
            child: Column(
              children: [
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 190, 143, 77),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "-50%",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    
                    Icon(Icons.favorite_border,
                    color: Colors.red,
                    ),
                ],
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "itemPage");
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Image.asset("assets/images/1.png",
                    height: 100,
                    width: 100,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child:  Text("T-Shirt",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 190, 143, 77),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Write the description of product",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 190, 143, 77),
                    ),
                  ),
                ),
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 0.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\₱150",
                      style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 190, 143, 77),
                        ),
                      ),
                      Icon(
                        Icons.shopping_cart_checkout,
                        color: Color.fromARGB(255, 190, 143, 77),
                      ),
                    ],
                  ),
                ),
          
              ],
            ),
          
          ),
        //}
      ],

    );
  }
}