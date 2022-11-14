import 'dart:ui';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_thesis_the_jars_c2019/api/api/speech_api.dart';
import 'package:final_thesis_the_jars_c2019/database/DatabaseManager.dart';
import 'package:final_thesis_the_jars_c2019/pages/CartPage.dart';
import 'package:final_thesis_the_jars_c2019/pages/ProfileInfoPage.dart';
import 'package:final_thesis_the_jars_c2019/pages/homeitemWidget.dart';
import 'package:final_thesis_the_jars_c2019/readData/get_product.dart';
import 'package:final_thesis_the_jars_c2019/app/customBottomNavBar.dart';
import 'package:final_thesis_the_jars_c2019/utils.dart';
import 'package:final_thesis_the_jars_c2019/widgets/voiceBottomSheet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_thesis_the_jars_c2019/widgets/ItemsWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:substring_highlight/substring_highlight.dart';
import '../model/Product.dart';

import 'package:final_thesis_the_jars_c2019/widgets/CategoriesWidget.dart';
import 'package:final_thesis_the_jars_c2019/widgets/HomeAppBar.dart';

import 'FavoritePage.dart';


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
   String text = 'Press the button and start speaking';
  bool isListening = true;



  List Products = [];
  List categoriesIDs = [];
   var _firestoreInstance = FirebaseFirestore.instance;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController(); 


List productIDs = [];

  Future getproductIDs() async{
    await FirebaseFirestore.instance
    .collection('product')
    .get()
    .then(
      (snapshot) => snapshot.docs.forEach((document) {
        print(document.reference);
        productIDs.add(document.reference.id);
       }),
      );
  }

   @override
  void initState(){
    getproductIDs();
   
    super.initState();
  }

  
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context ){

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      
      body: ListView(
         physics: NeverScrollableScrollPhysics(),
         children: [

        HomeAppBar(),
        Container(
          
          //remporary height
          //height: 500,
          padding: const EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 247, 232, 212),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight:  Radius.circular(35)
            ),
          ),
        child: Column(children: [

          //Search Widget
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              children: [
                 const Icon(
                  Icons.search,
                  size: 24,
                  color: Color.fromARGB(255, 190, 143, 77),),
              Container(
               
                margin: const EdgeInsets.only(left: 5),
                height: 50,
                width: 200,
                child: TextFormField(
                  decoration: const InputDecoration(
                   
                    border: InputBorder.none,
                    hintText: "Search here...",
                  ),
                ),
              ),
              const Spacer(),
               InkWell(
                    onTap: (){
                      print("open voice page");
                    Navigator.pushNamed(context, "voicepage");
                  },
                 child:
                  Icon(
                  Icons.mic,
                  size: 24,
                  color: Color.fromARGB(255, 190, 143, 77),
                 ),

               ),
             //   Navigator.push(context, route),

                   
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.camera_alt,
                  size: 24,
                  color: Color.fromARGB(255, 190, 143, 77),
                  
                ),
              ),
               
            ],),
          ),
          

       
        const SizedBox(height: 10,),
      
          

          CategoriesWidget(),
         
      


        //item 
        //******************* */
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: const Text(
            "Recent Product",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 190, 143, 77),),
            ),
          ),
   
    ////////////////////////////////////////////////////////
    ///
       const HomeitemWidget(), 
      ///////////////////////////////
        ],
        ),
        ),
    

       ],
      ),
    
      
        
    );
    
  }
  
//   void BottomSheet(context){
//     showModalBottomSheet(context: context, 
//     backgroundColor: Colors.transparent,
//     builder: (context)=>Container(
//       decoration: BoxDecoration(
//         color: Color.fromARGB(255, 190, 143, 77),
//         borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(25),
//         topRight: Radius.circular(25)
//             )),

            
//             child: SubstringHighlight(
//             text: text,
//             terms: Command.all,
//             textStyle: TextStyle(
//               fontSize: 32.0,
//               color: Colors.black,
//               fontWeight: FontWeight.w400,
//             ),
//             textStyleHighlight: TextStyle(
//               fontSize: 32.0,
//               color: Colors.red,
//               fontWeight: FontWeight.w400,
//             ),
            
//           ),
// // ///////////////////////
//       AvatarGlow(
//           animate: isListening,
//           endRadius: 100,
//           glowColor: Theme.of(context).primaryColor,
      
//             child: const Icon( Icons.mic, size: 36),
//             onPressed: toggleRecording,
         
       
//        //////////////////////////
//        );
//       ///////////////////
//         ),
//       );
       
//   }

  //  Future toggleRecording() => SpeechApi.toggleRecording(
  //       onResult: (text) => setState(() => this.text = text),
  //       onListening: (isListening) {
  //         setState(() => this.isListening = isListening);

  //         if (!isListening) {
  //           Future.delayed(Duration(seconds: 1), () {
  //             Utils.scanText(text);
  //           });
  //         }
  //       },
  //     );
}


