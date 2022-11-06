import 'package:flutter/material.dart';
import 'package:final_thesis_the_jars_c2019/const/AppColors.dart';


Widget customButton (String buttonText,onPressed){
  return SizedBox(
    width: 1,
    height: 56,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
            color: Colors.white, fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        primary: AppColors.deep_orange,
        elevation: 3,
      ),
    ),
  );
}