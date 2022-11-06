// import 'package:flutter/material.dart';

// import '../database/DatabaseManager.dart';

// class ItemsWidget extends StatelessWidget{
//     TextEditingController _nameController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();
//   TextEditingController _priceController = TextEditingController();
//   List productitemList = [];
//   @override
//   void inistate(){
//       super.initState();
//       fetchDatabaseList();
//   }
//   fetchDatabaseList() async{
//     dynamic resultant = await DatabaseManager().getUsersList();
     
//      if (resultant == null){
//       print("Unable to retrieve");
//      }else{
//       setState(() {
//         productitemList = resultant;
//       });
      
//      }
//   }
//   @override
//   Widget build(BuildContext context){
//     return GridView.count(
    
//       childAspectRatio: 0.68,
//       // it disable the scroll functionality of gridview 
//       //then it will scroll in list view of home page
//       physics: NeverScrollableScrollPhysics(),
//       crossAxisCount: 2,
//       shrinkWrap: true,
//       children: <Widget>[
//           // itemCount: productitemList.length,
//           //  itemBuilder: (context,index){
    
//            ListView.builder(
//              physics: const NeverScrollableScrollPhysics(),
//               // crossAxisCount: 2,
//                 shrinkWrap: true,
//             itemCount: productitemList.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 child: ListTile(
//                   title: Text(productitemList[index]['name']),
//                   subtitle: Text(productitemList[index]['gender']),
//                   leading: CircleAvatar(
//                     child: Image(
//                       image: AssetImage('assets/images/1.png'),
//                     ),
//                   ),
//                   trailing: Text('${productitemList[index]['price']}'),
//                 ),
//               );
//             }),
        
      
          
//         //}
//       ],

//     );
//   }
// }