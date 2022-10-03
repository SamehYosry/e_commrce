import 'package:e_commerce/message&notification/message.dart';
import 'package:e_commerce/message&notification/notification.dart';
import 'package:e_commerce/pagesOfAuthntcaion/tapBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: Padding(
          padding: const EdgeInsets.only(left: 6, right: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MESSAGE & NOTIFICATION
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Message(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.messenger_outline),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 17, left: 5),
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.red,
                        ),
                      )
                    ],
                  ),
                  Stack(children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Notifications(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.access_alarm_sharp),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 17, left: 5),
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red,
                      ),
                    )
                  ]),
                ],
              ),
              //text "More"
              const Text(
                "More",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              //space
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      handelOfSetting(
                        tiltleRow: "Shipping Address",
                        icons: const Icon(Icons.abc_outlined),
                      ),
                      const Divider(),
                      handelOfSetting(
                        tiltleRow: "Payment Method",
                        icons: const Icon(Icons.abc_outlined),
                      ),
                      const Divider(),
                      handelOfSetting(
                        tiltleRow: "Currency",
                        icons: const Icon(Icons.abc_outlined),
                      ),
                      const Divider(),
                      handelOfSetting(
                        tiltleRow: "Language",
                        icons: const Icon(Icons.abc_outlined),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      handelOfSetting(
                        tiltleRow: "Notification Settings",
                        icons: const Icon(Icons.abc_outlined),
                      ),
                      const Divider(),
                      handelOfSetting(
                        tiltleRow: "Privacy Policy",
                        icons: const Icon(Icons.abc_outlined),
                      ),
                      const Divider(),
                      handelOfSetting(
                        tiltleRow: "Frequently Asked Questions",
                        icons: const Icon(Icons.abc_outlined),
                      ),
                      const Divider(),
                      handelOfSetting(
                        tiltleRow: "Legal Information",
                        icons: const Icon(Icons.abc_outlined),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //Button Log Out
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                onPressed: () async {
                  // ignore: avoid_print
                  print("Start LogOut");

                  await FirebaseAuth.instance.signOut();
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const TapbarLogIn(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Text(
                      " log out".toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 5),
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
              const SizedBox(
                height: 70,
              ),
              
                 
            ],
          ),
        ));
  }

// HANDLE OF CONTAINER SETTING
  Widget handelOfSetting({required String tiltleRow, required Icon icons}) {
    return Row(
      children: [
        Icon(icons.icon),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              tiltleRow,
              style: const TextStyle(
                  color: Color.fromARGB(255, 111, 98, 94),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        CircleAvatar(
          radius: 10,
          backgroundColor: const Color.fromARGB(255, 214, 190, 181),
          child: IconButton(
            padding: EdgeInsets.zero,
            iconSize: 10,
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
            ),
          ),
        ),
      ],
    );
  }
}
