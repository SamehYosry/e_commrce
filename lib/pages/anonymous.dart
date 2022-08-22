import 'package:e_commerce/MyNavigationBar/mynavigationbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Anonymous extends StatefulWidget {
  const Anonymous({super.key});

  @override
  State<Anonymous> createState() => _AnonymousState();
}

class _AnonymousState extends State<Anonymous> {
   final formKey = GlobalKey<FormState>();
  // Function AnonymousAuth
  Future anonymousAuth() async {
    try {
      // ignore: avoid_print
      print("Signed in with temporary account.");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MyNavigationBar(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          // ignore: avoid_print
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          // ignore: avoid_print
          print("Unknown error.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: customButton("LogIn With Anonymous"),
        )),
      ),
    );
  }

  // CUSTOM BUTTON
  Widget customButton(String title) {
    return SizedBox(
      height: 55,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        onPressed: () {
          anonymousAuth();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Text(
              title.toUpperCase(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
