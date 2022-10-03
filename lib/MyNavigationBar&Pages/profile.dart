import 'dart:io';

import 'package:e_commerce/message&notification/message.dart';
import 'package:e_commerce/message&notification/notification.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// ignore: implementation_imports

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String imgUrl = "";

  final storage = FirebaseStorage.instance;

  final storageRef = FirebaseStorage.instance.ref();

  //FUNCTION CAMERA
  Future getimageFromCamera() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? xFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (xFile != null) {
      File file = File(xFile.path);
      // ignore: avoid_print
      print("PATH${xFile.path}");
      try {
        Reference reference = storageRef.child("image1");

        await reference.putFile(file);
        // ignore: avoid_print
        print("*******************Done");

        imgUrl = await reference.getDownloadURL();
        setState(() {});
      } catch (e) {
        // ignore: avoid_print
        print("ERROR********$e");
      }
    } else {
      // ignore: avoid_print
      print("No Image");
    }
  }

  //FUNCTION Galary
  Future getimageFromGalary() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? xFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      // ignore: avoid_print
      print("PATH${xFile.path}");
      File file = File(xFile.path);

      try {
        Reference reference = storageRef.child("image1");

        await reference.putFile(file);
        // ignore: avoid_print
        print("*******************Done");

        imgUrl = await reference.getDownloadURL();
        setState(() {});
      } catch (e) {
        // ignore: avoid_print
        print("ERROR********$e");
      }
    } else {
      // ignore: avoid_print
      print("No Image");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: Padding(
          padding: const EdgeInsets.only(top: 25, right: 6, left: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Message AND Notification
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
              //ROW OF ACOUNT
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //image
                  CircleAvatar(
                    radius: 50,
                    child: ClipOval(
                      child: Image.network((imgUrl.isEmpty)
                          ? "https://ithraa.io/profile_images/default.jpg"
                          : imgUrl),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     // name
                      const Text(
                        "Sameh Yosry",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      //email
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "anamohasameh@yahoo.com",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                     //button to edit profile
                      OutlinedButton(
                        onPressed: () {
                          showDialog(
                            barrierDismissible: false,
                              context: context,
                              builder: (BuildContext) {
                                return AlertDialog(
                                  scrollable: true,
                                  title:
                                      Text("Choose how want uppload picture"),
                                  actions: [
                                    Center(
                                      child: TextButton.icon(
                                        onPressed: () {
                                          getimageFromCamera();
                                        },
                                        icon: Icon(Icons.camera_alt_rounded),
                                        label: Text("camera"),
                                      ),
                                    ),
                                    Center(
                                      child: TextButton.icon(
                                        onPressed: () {
                                          getimageFromGalary();
                                        },
                                        icon: Icon(Icons.photo),
                                        label: Text("Galary"),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Close"),
                                    ),
                                  ],
                                );
                              });
                          // getimageFromGalary();
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.black45),
                          shape: const StadiumBorder(),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('EDIT PROFILE'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              //container of details
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      editContainerOfDetailsProfile(
                        tiltleRow: "All My Orders",
                        icons: const Icon(Icons.menu_sharp),
                      ),
                      const Divider(),
                      editContainerOfDetailsProfile(
                        tiltleRow: "Pending Shipments",
                        icons: const Icon(Icons.lightbulb_outline_sharp),
                      ),
                      const Divider(),
                      editContainerOfDetailsProfile(
                        tiltleRow: "Pending Payment",
                        icons: const Icon(Icons.abc_outlined),
                      ),
                      const Divider(),
                      editContainerOfDetailsProfile(
                        tiltleRow: "Finished Orders",
                        icons: const Icon(Icons.shop_rounded),
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
                      editContainerOfDetailsProfile(
                        tiltleRow: "Invinte Friends",
                        icons: const Icon(Icons.abc_outlined),
                      ),
                      const Divider(),
                      editContainerOfDetailsProfile(
                        tiltleRow: "Customer Support",
                        icons: const Icon(Icons.abc_outlined),
                      ),
                      const Divider(),
                      editContainerOfDetailsProfile(
                        tiltleRow: "Rate Our App",
                        icons: const Icon(Icons.abc_outlined),
                      ),
                      const Divider(),
                      editContainerOfDetailsProfile(
                        tiltleRow: "Make a Suggestion",
                        icons: const Icon(Icons.abc_outlined),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 65,
              )
            ],
          ),
        ));
  }

//EditContainerOfDetailsProfile
  Widget editContainerOfDetailsProfile(
      {required String tiltleRow, required Icon icons}) {
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
