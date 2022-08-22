import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce/MyNavigationBar/cart.dart';
import 'package:e_commerce/MyNavigationBar/home.dart';
import 'package:e_commerce/MyNavigationBar/more.dart';
import 'package:e_commerce/MyNavigationBar/profile.dart';
import 'package:e_commerce/MyNavigationBar/search.dart';
import 'package:e_commerce/myFavorite/myfavoritecategories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  //---------------Start Theme Mode data---------------
  bool isdarkTheme = false;
  //---------------End Theme Mode data---------------
  List<Widget> bottomNavBarPages = [
    const Home(),
    const Search(),
    const Cart(),
    const Profile(),
    const More(),
  ];

  int selectedPage = 0;

  void onBottomNavBarChanged(value) {
    setState(() {
      selectedPage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            (isdarkTheme == false) ? Colors.white : Colors.grey[850],
        floatingActionButton: SpeedDial(
          //Speed dial menu
          marginBottom: 10, //margin bottom
          icon: Icons.menu, //icon on Floating action button
          activeIcon: Icons.close, //icon when menu is expanded on button
          backgroundColor: Colors.deepOrangeAccent, //background color of button
          foregroundColor: Colors.white, //font color, icon color in button
          activeBackgroundColor:
              Colors.deepPurpleAccent, //background color when menu is expanded
          activeForegroundColor: Colors.white,
          buttonSize: 56.0, //button size
          visible: true,
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: .5,
          // onOpen: () => print('OPENING DIAL'), // action when menu opens
          // onClose: () => print('DIAL CLOSED'), //action when menu closes

          elevation: 8.0, //shadow elevation of button
          shape: const CircleBorder(), //shape of button

          children: [
            SpeedDialChild(
              //speed dial child
              child: const Icon(Icons.favorite),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              label: 'My Categories Favorite',
              labelStyle: const TextStyle(fontSize: 18.0),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyFavouriteCategories(),
                ),
              ),
              //   onLongPress: () => print('FIRST CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: isdarkTheme
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              label: 'My Theme',
              labelStyle: const TextStyle(fontSize: 18.0),
              onTap: () {
                setState(() {
                  isdarkTheme = !isdarkTheme;
                });
              },
              // onLongPress: () => print('SECOND CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: const Icon(Icons.keyboard_voice),
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              label: 'Third Menu Child',
              labelStyle: const TextStyle(fontSize: 18.0),
          
            ),

          ],
        ),

      
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.blueAccent,
            items: const <Widget>[
              Icon(Icons.home_outlined, size: 30),
              Icon(Icons.search, size: 30),
              Icon(Icons.shopping_cart, size: 30),
              Icon(Icons.person, size: 30),
              Icon(Icons.more_horiz, size: 30),
            ],
            onTap: onBottomNavBarChanged),
        body: bottomNavBarPages[selectedPage],
      ),
    );
  }
}
