import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItemSamples extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        for(int i = 1; i < 4; i++)
      Container(
        height: 110,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          Radio(
            value: "", 
            groupValue: "", 
            activeColor: Color.fromARGB(255, 190, 143, 77),
            onChanged: (index){},
            ),
            Container(
              height: 60,
              width: 60,
              margin: EdgeInsets.only(right: 10),
              child: Image.asset("assets/images/$i.png"),
            ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                "Product Title",
                style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 190, 143, 77), 
                ),
              ),
              Text(
                "\₱150",
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 190, 143, 77), 
                ),
              ),
            ],
          ),
          ),

          //Spacer(),
          Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Icon(
                Icons.delete,
                color: Colors.red,
              ),
              Row(children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                    ),
                  ]
                  ),
                  child: Icon(
                    CupertinoIcons.plus,
                    size: 18,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "01",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 190, 143, 77), 
                    ),
                    ),
                ),
                   Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                    ),
                  ]
                  ),
                  child: Icon(
                    CupertinoIcons.minus,
                    size: 18,
                  ),
                ),
              ],
              )
            ],
          ),
          ),
        ],
        ),
      ),
    ],
    );
  }
}