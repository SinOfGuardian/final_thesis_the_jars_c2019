import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:final_thesis_the_jars_c2019/widgets/customFullScreenDialog.dart';
import 'package:final_thesis_the_jars_c2019/widgets/customSnackBar.dart';
import 'package:final_thesis_the_jars_c2019/model/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController fnameController, ageController, genderController, addressController;

  // Firestore operation
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReference;

  RxList<UserModel> profileInfo = RxList<UserModel>([]);

  @override
  void onInit() {
    super.onInit();
    fnameController = TextEditingController();
    ageController = TextEditingController();
    genderController = TextEditingController();
    addressController = TextEditingController();
    collectionReference = firebaseFirestore.collection("profileInfo");
    profileInfo.bindStream(getAllprofileInfo());
  }

  String? validatefName(String value) {
    if (value.isEmpty) {
      return "Full Name can not be empty";
    }
    return null;
  }


  String? validateAge(String value) {
    if (value.isEmpty) {
      return "Age can not be empty";
    }
    return null;
  }

  String? validateGender(String value) {
    if (value.isEmpty) {
      return "Gender can not be empty";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return "Address can not be empty";
    }
    return null;
  }


  void saveUpdateEmployee(
      String name, int age, String gender, String address, String docId, int addEditFlag) {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    if (addEditFlag == 1) {
      CustomFullScreenDialog.showDialog();
      collectionReference
          .add({'name': name, 'age': age, 'gender': gender, 'address': address}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "User Added",
            message: "User added successfully",
            backgroundColor: Colors.green);
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroundColor: Colors.green);
      });
    } else if (addEditFlag == 2) {
      //update
      CustomFullScreenDialog.showDialog();
      collectionReference
          .doc(docId)
          .update({'name': name, 'age': age, 'gender': gender, 'address': address}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "User Updated",
            message: "User updated successfully",
            backgroundColor: Colors.green);
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroundColor: Colors.red);
      });
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    fnameController.dispose(); 
    genderController.dispose();
    ageController.dispose();
    addressController.dispose();
  }

  void clearEditingControllers() {
     fnameController.clear();
    genderController.clear();
    ageController.clear();
    addressController.clear();
  }

  Stream<List<UserModel>> getAllprofileInfo() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((item) => UserModel.fromMap(item)).toList());

  void deleteData(String docId) {
    CustomFullScreenDialog.showDialog();
    collectionReference.doc(docId).delete().whenComplete(() {
      CustomFullScreenDialog.cancelDialog();
      Get.back();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "User Deleted",
          message: "User deleted successfully",
          backgroundColor: Colors.green);
    }).catchError((error) {
      CustomFullScreenDialog.cancelDialog();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Error",
          message: "Something went wrong",
          backgroundColor: Colors.red);
    });
  }
}
