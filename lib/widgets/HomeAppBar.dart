
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';


class HomeAppBar extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        children: [
          Icon(Icons.sort,
          size: 30,
          color: Color.fromARGB(255, 190, 143, 77),
          ),
          Padding(
            padding: EdgeInsets.only(
            left: 20,
          ),
          child: Text(
            "The Jars Clothing Co.",
            style: TextStyle(fontSize: 25, 
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 190, 143, 77),
            ),
          ),
          ),
          Spacer(),
           Badge(
            badgeColor: Colors.red,
            padding: EdgeInsets.all(7),
            badgeContent: Text(
              "3",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            child: InkWell(
              onTap:(){
                Navigator.pop(context, "cartPage");
              },
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 30,
                color: Color.fromARGB(255, 190, 143, 77),
              ),
            ),
          ),     
        ],
      ),
      );
    
  }
}