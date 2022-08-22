import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/MyNavigationBar/mynavigationbar.dart';
import 'package:e_commerce/provider/allProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  String email = '', password = '';
  bool isShow = true;
  //Function LogIn
  Future logIn() async {
    if (formKey.currentState!.validate()) {
      // ignore: avoid_print
      print("Valid");
      formKey.currentState!.save();
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        // ignore: avoid_print
        print("**********************UserId:${credential.user!.uid}");
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MyNavigationBar(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          // ignore: avoid_print
          print('No user found for that email.');
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.SCALE,
            title: 'Error',
            desc: 'No user found for that email.',
            //btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        } else if (e.code == 'wrong-password') {
          // ignore: avoid_print
          print('Wrong password provided for that user.');
          AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Error',
            desc: 'No user found for that Password.',
            //btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        }
      }
    } else {
      // ignore: avoid_print
      print("InValid");
    }
  }

//Function Google
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
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
              customPassWord(
                onsave: (val) {
                  password = val;
                },
                validator: (val) {
                  // ignore: avoid_print
                  print(val);
                  if (val!.isEmpty) {
                    return 'Password Can\'t be Empty';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              customButton("log in"),
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Don't have an account? Switch night to",
                    style: TextStyle(color: Colors.black),
                  ),
                  
                  ),
              GestureDetector(
                onTap: () {
                  print("Start sign In With Google");
                  signInWithGoogle().then((value) {
                    print("User Id : ${value.user!.uid}");
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const MyNavigationBar(),
                      ),
                    );
                  });
                },
                child: Text(
                  "Log In With Google",
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
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

//TEXT FIELD PASSWORD
  Widget customPassWord({
    required Function validator,
    required Function onsave,
  }) {
    return SizedBox(
      height: 50,
      child: Selector<ProviderOfSeePassword, bool>(
        builder: ((context, isSee, child) {
          return TextFormField(
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
              hintText: "password",
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
          logIn();
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
