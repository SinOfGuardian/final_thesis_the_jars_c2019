import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_thesis_the_jars_c2019/database/DatabaseManager.dart';
import 'package:final_thesis_the_jars_c2019/readData/get_categories.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_thesis_the_jars_c2019/widgets/ItemsWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/Product.dart';

import 'package:final_thesis_the_jars_c2019/widgets/CategoriesWidget.dart';
import 'package:final_thesis_the_jars_c2019/widgets/HomeAppBar.dart';


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}
// Product shirtdata;
// Product Suitdata;
class _HomePageState extends State<HomePage>{
  
  List categoriesIDs = [];

  Future getcategoriesIDs() async{
    
    await FirebaseFirestore.instance
    .collection('categories')
   // .orderBy('age ', descending: false)
    .get()
    .then(
      (snapshot) => snapshot.docs.forEach((document) {
        print(document.reference);
        categoriesIDs.add(document.reference.id);
       }),
      );
      
  }
  
   @override
  void initState(){
    getcategoriesIDs();
    //fetchcategories();
     fetchDatabaseList();
    //TODO: implement initState
    super.initState();
  }

  var _firestoreInstance = FirebaseFirestore.instance;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  List productitemList = [];


  fetchDatabaseList() async{
    dynamic resultant = await DatabaseManager().getUsersList();
     
     if (resultant == null){
      print("Unable to retrieve");
     }else{
      setState(() {
        productitemList = resultant;
      });
      
     }
  }



 

  @override
  Widget build(BuildContext context){

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(children: [
        HomeAppBar(),
        Container(
          
          //remporary height
          //height: 500,
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 247, 232, 212),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight:  Radius.circular(35)
            ),
          ),
        child: Column(children: [

          //Search Widget
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              children: [
              Container(
                margin: EdgeInsets.only(left: 5),
                height: 50,
                width: 200,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search here...",
                  ),
                ),
              ),
              Spacer(),
              Icon(
                Icons.mic,
                size: 24,
                color: Color.fromARGB(255, 190, 143, 77),
                
              ),
                   
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.camera_alt,
                  size: 24,
                  color: Color.fromARGB(255, 190, 143, 77),
                  
                ),
              ),
               
            ],),
          ),

       
        SizedBox(height: 10,),
      
          // Expanded(
          //   child: GridView.builder(  
          //     scrollDirection: Axis.horizontal, 
          //     itemCount: productitemList.length,
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1),
              
          //     itemBuilder: (_,index){
          //       return Card(
          //         elevation: 3,
          //         child: Column(
          //           children: [
          //              AspectRatio(aspectRatio: 2,
          //             child: Container(
          //               color: Colors.grey[500],
          //             child: Image.network(productitemList[index]["image"][0]),),),
          //             Text("${productitemList[index]["category"]}"),
                     
                      
          //           ],
          //         ),
          //       );
          //     }),
          //     ),
          //GOOD
          CategoriesWidget(),
  
      //  Container(
        
      //  margin: const EdgeInsets.only(bottom: 15.0),
      //     height: h*0.08,
        
      //     child: Center(
            
      //       child: ListView.builder(
                       
      //                   //physics: const NeverScrollableScrollPhysics(),
      //                   scrollDirection: Axis.horizontal,
                        
      //                   shrinkWrap: true,
      //                   itemCount: categoriesIDs.length,
      //                   itemBuilder: (context, index){
                           
      //                      //final categorypic = await snapshot.data!categoriesIDs[index].getDownloadURL();
      //                     return  Center(
                            
      //                       child: Container(
                              
      //                           margin: EdgeInsets.symmetric(horizontal: 5),
      //                           padding: EdgeInsets.only(top: 2, ),
      //                             // margin: EdgeInsets.only(  right: 5, left: 2,),
      //                             // padding: EdgeInsets.only(right: 5, left: 2,),
      //                              decoration: BoxDecoration(
      //                             color: Colors.white,
      //                             borderRadius: BorderRadius.circular(20),
      //                             ),
                                  
      //                             height: h*0.08,
      //                             width: 150,
      //                             child: Center(
                                    
      //                               child: ListTile(
      //                               leading: Image.asset(assetImage, width: 30.0, height: 30.0,),
                                    
      //                               // SizedBox: 20,
      //                            // leading: Icon( Icons.person_remove_alt_1_sharp,),
      //                               title: GetCategories(docCategory: categoriesIDs[index],),
                                
      //                               tileColor: Colors.grey[200],
      //                               ),
      //                 ),
      //                             ),
      //                         );
                          
                          
      //                }),
      //     ),
          
      //  ),
          
          //category number 2
          // Expanded(
                
          //      child: FutureBuilder(
                
          //       future: getcategoriesIDs(),
          //       builder: (context, snapshot) {
          //         return ListView.builder(
          //         scrollDirection: Axis.vertical,
          //         shrinkWrap: true,
          //         itemCount: categoriesIDs.length,
          //         itemBuilder: (context, index){
          //           return Padding(
          //             padding: const EdgeInsets.all(4.0),
          //             child: ListTile(
          //             title: GetCategories(docCategory: categoriesIDs[index]),
          //             tileColor: Colors.grey[200],
          //       ),
          //           );
          //      });
                  
          //       }),
          //      ), 


        //item 
        //******************* */
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
            "Recent Product",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 190, 143, 77),),
            ),
          ),
       //**************** */
       //Item Widget
      
      
          //  ListView.builder(
          //    physics: const NeverScrollableScrollPhysics(),
          //     // crossAxisCount: 2,
          //       shrinkWrap: true,
          //   itemCount: productitemList.length,
          //   itemBuilder: (context, index) {
          //     return Card(
          //       child: ListTile(
          //         title: Text(productitemList[index]['name']),
          //         subtitle: Text(productitemList[index]['gender']),
          //         leading: CircleAvatar(
          //           child: Image.network(itemList[index]["image"][0]),
          //             // image: net('assets/images/1.png'),
          //           ),
          //         ),
          //         trailing: Text('${itemList[index]['age']}'),
          //       ),
          //     );
          //   }),
     ItemsWidget(),
      
      

    //  Container(child: ItemsWidget()),
    //     FutureBuilder(
    //       future: FirebaseFirestore.instance
    //       .collection("categories")
    //       // .doc("1Ywr4IBsWvDtCmDMnv1e")
    //       // .collection("product")
    //       .get(),
    //       builder: (context, snapshot) {
    //         if(snapshot.connectionState == ConnectionState.waiting){
    //           return Center(child: CircularProgressIndicator(),
    //           );
    //         }
    //         return  ItemsWidget();
    //       }
    //     ),

        ],
        ),
        ),
        //
      //  Expanded(
      //  // scrollDirection: Axis.horizontal, 
      //       child: GridView.builder(  
      //        // scrollDirection: Axis.horizontal, 
      //         itemCount: productitemList.length,
      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1),
              
      //         itemBuilder: (_,index){
      //           return Card(
      //             elevation: 3,
      //             child: Column(
      //               children: [
      //                  AspectRatio(aspectRatio: 2,
      //                 child: Container(
      //                   color: Colors.grey[500],
      //                 child: Image.network(productitemList[index]["image"][0]),),),
      //                 Text("${productitemList[index]["category"]}"),
                     
                      
      //               ],
      //             ),
      //           );
      //         }),
      //         ),
//end
       ],
      ),
      
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index){},
        height: 50,
        color: Color.fromARGB(255, 190, 143, 77),
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          
           Icon(
            CupertinoIcons.heart_fill,
            size: 30,
            color: Colors.white,
            ),
          
            // Icon(
            // Icons.shopping_cart_checkout,
            // size: 30,
            // color: Colors.white,
            // ),
    
           Icon(
            CupertinoIcons.person_alt,
            size: 30,
            color: Colors.white,
          ),

          //  Icon(
          //   Icons.list,
          //   size: 30,
          //   color: Colors.white,
          // ),
        ],
      ),
    );
  }
}


