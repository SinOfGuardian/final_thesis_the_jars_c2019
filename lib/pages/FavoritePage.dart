import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class favoritPage extends StatefulWidget {
  const favoritPage({super.key});

  @override
  State<favoritPage> createState() => _favoritPageState();
}

class _favoritPageState extends State<favoritPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Page'),
      ),
    );
  }
}