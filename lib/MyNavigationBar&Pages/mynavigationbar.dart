import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce/MyNavigationBar&Pages/cart.dart';
import 'package:e_commerce/MyNavigationBar&Pages/home.dart';
import 'package:e_commerce/MyNavigationBar&Pages/more.dart';
import 'package:e_commerce/MyNavigationBar&Pages/profile.dart';
import 'package:e_commerce/MyNavigationBar&Pages/search.dart';
import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/myShoping/myshopinggories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  //---------------Start Theme Mode data By SharedPreferences---------------
  bool isdarkTheme = false;
  int backgroundColor = Colors.white.value;
  Future saveTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(BackGroundColor, backgroundColor);
  }

  Future getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      backgroundColor =
          sharedPreferences.getInt(BackGroundColor) ?? Colors.white.value;
    });
  }
  //---------------End Theme Mode data By SharedPreferences---------------

  @override
  void initState() {
    // TODO: implement initState
    getTheme();
    super.initState();
  }

  //---------------MyPages of ButtomNavigationBar---------------
  List<Widget> bottomNavBarPages = [
    const Home(),
    const Search(),
    const Cart(),
    const Profile(),
    const More(),
  ];
//-----------------Start selected page
  int selectedPage = 0;

  void onBottomNavBarChanged(value) {
    setState(() {
      selectedPage = value;
    });
  }

//-----------------End selected page
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(backgroundColor),
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
          elevation: 8.0, //shadow elevation of button
          shape: const CircleBorder(), //shape of button
//------------- Start My SpeedDialChild---------------
          children: [
            //speed dial "My Shopping Categories"
            SpeedDialChild(
              //speed dial child
              child: const Icon(Icons.shop),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              label: 'My Shopping Categories',
              labelStyle: const TextStyle(fontSize: 18.0),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyFavouriteCategories(),
                ),
              ),
            ),
            //speed dial "My Theme"
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
                  backgroundColor = isdarkTheme
                      ? Colors.white.value
                      : Colors.grey.shade800.value;
                  isdarkTheme = !isdarkTheme;
                  saveTheme();
                  print(isdarkTheme);
                });
              },
            ),
          ],
        ),
        //-------------End My SpeedDialChild---------------
//------------My bottomNavigationBar Icons--------
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
