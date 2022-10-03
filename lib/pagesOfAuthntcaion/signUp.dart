import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/MyNavigationBar&Pages/mynavigationbar.dart';
import 'package:e_commerce/provider/allProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SignUpPages extends StatefulWidget {
  const SignUpPages({super.key});

  @override
  State<SignUpPages> createState() => _SignUpPagesState();
}

class _SignUpPagesState extends State<SignUpPages> {
  final formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  String email = '', password = '', confirmPassWord = '', userName = '';

//Function signUp by firebase
  Future signUp() async {
    if (formKey.currentState!.validate()) {
      // ignore: avoid_print
      print("Valied");
      formKey.currentState!.save();
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // ignore: avoid_print
        print("************USERID:${credential.user!.uid}");
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MyNavigationBar(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          // ignore: avoid_print
          print('The password provided is too weak.');
          AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.SCALE,
            title: 'Info',
            desc: 'The password provided is too weak.',
            //btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        } else if (e.code == 'email-already-in-use') {
          // ignore: avoid_print
          print('The account already exists for that email.');
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.SCALE,
            title: 'ERROR',
            desc: 'The account already exists for that email.',
            //btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        } else if (e.code == 'username-already-in-use') {
          print('The account already exists for that username.');
        }
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    } else {
      print("inValed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                //text field Of email
                customEmail(
                  title: "Email",
                  controller: loginController,
                  keyBoardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Email Can\'t be Empty';
                    } else {
                      return null;
                    }
                  },
                  onsave: (val) {
                    email = val;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
               //text field Of Username
                customUserName(
                  title: "USER NAME",
                  keyBoardType: TextInputType.name,
                  controller: userNameController,
                  onsave: (val) {
                    userName = val;
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'User Name Can\'t be Empty';
                    } else if (val.length > 100) {
                      return 'Too Long User Name';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
               //text field Of Password
                customPassWord(
                  onsave: (val) {
                    password = val;
                  },
                  validator: (val) {
                    print(val);
                    if (val!.isEmpty) {
                      return 'Password Can\'t be Empty';
                    } else {
                      return null;
                    }
                  },
                  controller: passWordController,
                ),
                const SizedBox(
                  height: 20,
                ),
                //text field Of ConfirmPassword
                customConfirmPassWord(
                  controller: confirmPasswordController,
                  onsave: (val) {
                    confirmPassWord = val;
                  },
                  validator: (val) {
                    if (passWordController.text !=
                        confirmPasswordController.text) {
                      return 'Password must be the same in the two Fields';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                //Button Sign Up
                customButtonSignUp("sign up"),
               //Text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "By creating an account, you agree to our\n",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                            text: "Terms of Service",
                            style: TextStyle(color: Colors.red)),
                        TextSpan(
                            text: " and ",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(color: Colors.red))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // CUSTOM EMAIL
  Widget customEmail({
    required String title,
    required TextInputType keyBoardType,
    required Function validator,
    required Function onsave,
    required TextEditingController controller,
  }) {
    return TextFormField(
      validator: (val) => validator(val),
      onSaved: (val) => onsave(val),
      decoration: InputDecoration(
        hintText: title,
        prefixIcon: const Icon(Icons.mail),
        filled: true,
        label: Text(title),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(25)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.amber, width: 2),
            borderRadius: BorderRadius.circular(25)),
      ),
    );
  }

  // CUSTOM USER NAME
  Widget customUserName({
    required String title,
    required TextInputType keyBoardType,
    required TextEditingController controller,
    required Function onsave,
    required Function validator,
  }) {
    return TextFormField(
      controller: controller,
      onSaved: (val) => onsave(val),
      validator: (val) => validator(val),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person_sharp),
        filled: true,
        hintText: title,
        label: Text(title),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(25)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.amber, width: 2),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

//TEXT FIELD PASSWORD
  Widget customPassWord({
    required Function validator,
    required Function onsave,
    required TextEditingController controller,
  }) {
    return SizedBox(
      height: 50,
      child: Selector<ProviderOfSeePassword, bool>(
        builder: ((context, isSee, child) {
          return TextFormField(
            controller: controller,
            onSaved: (val) => onsave(val),
            validator: (val) => validator(val),
            decoration: InputDecoration(
              suffix: IconButton(
                onPressed: () {
                  Provider.of<ProviderOfSeePassword>(context, listen: false)
                      .incrementSeePassword();
                },
                icon: isSee
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.remove_red_eye),
              ),
              prefixIcon: const Icon(Icons.password),
              filled: true,
              // hintText: "password",
              labelText: "password",
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.amber, width: 2),
                  borderRadius: BorderRadius.circular(25)),
            ),
            obscureText: isSee,
            obscuringCharacter: "*",
            enableSuggestions: false,
          );
        }),
        selector: (context, mycounter) {
          return mycounter.isSee;
        },
      ),
    );
  }

//TEXTDIELD CONFIRM PASSWORD
  Widget customConfirmPassWord({
    required Function validator,
    required TextEditingController controller,
    required Function onsave,
  }) {
    return SizedBox(
      height: 50,
      child: Selector<ProviderOfSeePassword, bool>(
        builder: ((context, isSee, child) {
          return TextFormField(
            controller: controller,
            onSaved: (val) => onsave(val),
            validator: (val) => validator(val),
            decoration: InputDecoration(
              suffix: IconButton(
                onPressed: () {
                  Provider.of<ProviderOfSeePassword>(context, listen: false)
                      .incrementSeePassword();
                },
                icon: const Icon(Icons.remove_red_eye),
              ),
              prefixIcon: const Icon(Icons.password),
              filled: true,
              // hintText: "Confermpassword",
              labelText: "Confermpassword",
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.amber, width: 2),
                  borderRadius: BorderRadius.circular(25)),
            ),
            obscureText: isSee,
            obscuringCharacter: "*",
            enableSuggestions: false,
          );
        }),
        selector: (context, mycounter) {
          return mycounter.isSee;
        },
      ),
    );
  }

  // CUSTOM BUTTON
  Widget customButtonSignUp(String title) {
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
          signUp();
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
