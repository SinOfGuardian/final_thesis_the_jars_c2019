import 'package:flutter/material.dart';

class Product{
  final String name;
  final String image;
  final String description;
  final double price;

  Product({
    required this.image,
    required this.name, 
    required this.description, 
    required this.price
    });

    factory Product.fromJson(Map<String, dynamic> json){
      return Product(
        image: json['image'], 
        name: json['name'], 
        description: json['description'], 
        price: json['price'],);
    }
}