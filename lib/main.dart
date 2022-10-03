
import 'package:e_commerce/MyNavigationBar&Pages/mynavigationbar.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/pagesOfAuthntcaion/tapBar.dart';
import 'package:e_commerce/provider/allProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

bool isLogged = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (FirebaseAuth.instance.currentUser != null) {
    // ignore: avoid_print
    print("USERID:${FirebaseAuth.instance.currentUser!.uid}");
    isLogged = true;
  } else {
    isLogged = false;
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AllCounterProvider1>(
          create: (context) => AllCounterProvider1(),
        ),
        ChangeNotifierProvider<ProviderOfFavorite>(
          create: (context) => ProviderOfFavorite(),
        ),
        ChangeNotifierProvider<ProviderOfSeePassword>(
          create: (context) => ProviderOfSeePassword(),
        ),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isLogged ?  const MyNavigationBar():const TapbarLogIn(),
      ),
    );
  }
}
