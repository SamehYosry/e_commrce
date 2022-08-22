
import 'package:e_commerce/pages/anonymous.dart';
import 'package:e_commerce/pages/logIn.dart';
import 'package:e_commerce/pages/signUp.dart';
import 'package:flutter/material.dart';

class TapbarLogIn extends StatefulWidget {
  const TapbarLogIn({super.key});

  @override
  State<TapbarLogIn> createState() => _TapbarLogInState();
}

class _TapbarLogInState extends State<TapbarLogIn> {
  List<Widget> mytabs = [
    const Tab(
      text: 'Log In',
    ),
    const Tab(
      text: ('Sign Up'),
    ),
    const Tab(
      text: 'LogIn With Anonymous',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: mytabs.length,
      child: SafeArea(
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              TabBar(
                  indicator: BoxDecoration(
                    color: const Color.fromARGB(255, 238, 215, 229),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  isScrollable: true,
                  unselectedLabelColor: const Color.fromARGB(153, 126, 59, 59),
                  labelColor: const Color.fromARGB(255, 109, 14, 87),
                  labelStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: mytabs),
              const Expanded(
                child: TabBarView(
                  children: [
                    //LOGIN PAGE
                    LogInPage(),
                    //  SizedBox(),
                    //SIGNUP PAGE
                    SignUpPages(),
                    // FORGET PASSWORD
                    Anonymous(),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
