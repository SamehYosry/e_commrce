import 'package:flutter/material.dart';

class MyFavouriteCategories extends StatefulWidget {
  const MyFavouriteCategories({super.key});

  @override
  State<MyFavouriteCategories> createState() => _MyFavouriteCategoriesState();
}

class _MyFavouriteCategoriesState extends State<MyFavouriteCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favourite"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(),
    );
  }
}
