import 'package:flutter/material.dart';
import 'package:final_thesis_the_jars_c2019/widgets/CartAppBar.dart';
import 'package:final_thesis_the_jars_c2019/widgets/CartBottomNavBar.dart';
import 'package:final_thesis_the_jars_c2019/widgets/CartItemSamples.dart';

class CartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: [
          CartAppBar(),

          Container(
            //temporary height
            height: 700,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 236, 236, 236),
              borderRadius: BorderRadius.only(
              topLeft:  Radius.circular(35),
              topRight: Radius.circular(35),
              )),
              child: Column(
                children: [
                CartItemSamples(),
                Container(
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  padding: EdgeInsets.all(10),
                  child: Row(children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 190, 143, 77), 
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Add Coupon Code",
                      style: TextStyle(
                        color: Color.fromARGB(255, 190, 143, 77), 
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    )
                  ],),
                ),
              ],),
          ),
        ],
      ),
      bottomNavigationBar: CartBottomNavBar(),
    );

  }
}