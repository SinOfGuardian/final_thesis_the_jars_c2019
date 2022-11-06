// // ignore: file_names
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:final_thesis_the_jars_c2019/widgets/ItemAppBar.dart';
import 'package:final_thesis_the_jars_c2019/widgets/ItemBottomNavBar.dart';



class ItemPage extends StatelessWidget{

  List<Color> Clrs = [
    Colors.red,
    Colors.black,
    Colors.green,
    Colors.blue,
    Colors.white,
    Colors.orange,
  ];

  @override
    var arr = ['S', 'M', 'L', 'XL'];

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: ListView(
        children: [
          ItemAppBar(),
          Padding(
            padding: EdgeInsets.all(20),
            child: Image.asset("assets/images/1.png",height: 300),
          ),
          Arc(
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(
                      top: 48,
                      bottom: 15,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Product Title",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 190, 143, 77),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            onRatingUpdate: (index){},

                          ),
                          
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    ),
                                  ]),
                                  child: Icon(
                                    CupertinoIcons.minus,
                                    size: 18,
                                    color: Color.fromARGB(255, 190, 143, 77),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      "01",
                                      style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 190, 143, 77),
                                    ),),
                                  ),

                                       Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    ),
                                  ]),
                                  child: Icon(
                                    CupertinoIcons.plus,
                                    size: 18,
                                    color: Color.fromARGB(255, 190, 143, 77),
                                    ),
                                  ),
                              
                            ],
                          ),

                        ],
                      ),),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(

                          "This is more detailed of the product. you can write here more about the product this is the lenghthy description",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 190, 143, 77),
                          ),
                        ),),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Text(
                                "Size:", 
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 190, 143, 77),
                                  fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Row(
                                  children: [
                                    
                                    for(final x in arr)
                                  Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                        ),
                                      ]),
                                      child: Text(
                                        x.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 190, 143, 77),
                                        ),
                                      ),
                                  ),
                                ],),
                            ],
                          ),),
                             Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Text(
                                "Color:", 
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 190, 143, 77),
                                  fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Row(
                                  children: [
                                    
                                    for(int i = 0; i < 5; i++)
                                  Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: Clrs[i],
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                        ),
                                      ]),
                                     

                                  ),
                                ],),
                            ],
                          ),),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
      bottomNavigationBar: ItemBottomNavBar(),
    );
  }

}