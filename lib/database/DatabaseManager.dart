

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_thesis_the_jars_c2019/model/Product.dart';

class DatabaseManager{
 final CollectionReference categoryList =
     FirebaseFirestore.instance.collection('categories');

Future<void> createProductData(
    String category, String image, String uid) async{
    return await categoryList
      .doc(uid)
      .set({'image': image, 'category': category});
    }
  // Future updateUserList(String name, String gender, int score, String uid) async {
  //   return await profileList.document(uid).updateData({
  //     'name': name, 'gender': gender, 'score': score
  //   });
  // }

  Future getUsersList() async{
    List itemList = [];

    try{
      await categoryList.get().then((querySnapshot){
        querySnapshot.docs.forEach((element){
          itemList.add(element.data);
        });
      });
      return itemList;
    }catch (e){
      print(e.toString());
      return null;
    }
  }


}