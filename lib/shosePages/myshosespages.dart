import 'package:e_commerce/MyNavigationBar/home.dart';
import 'package:e_commerce/shosePages/details.dart';
import 'package:e_commerce/shosePages/product.dart';
import 'package:e_commerce/shosePages/reviews.dart';
import 'package:flutter/material.dart';

class MyShosePages extends StatefulWidget {
  const MyShosePages({super.key});

  @override
  State<MyShosePages> createState() => _MyShosePagesState();
}

class _MyShosePagesState extends State<MyShosePages> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                  Column(
                    children: [
                      const Text("Faux Sued Ankle Boots"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              "\$49.99 ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.red),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 13,
                                  ),
                                  Text(
                                    "4.9",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: const [
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.black54,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.black,
                            ),
                          ),
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.black54,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_cart_outlined),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16, left: 3),
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.red,
                          child: Text(
                            "7",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 300,
                width: 250,
                child: Image.asset("assests/booksimage/boots-removebg-preview.png"),
              ),
              // TAB BAR
              Container(
                height: 45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
                child: TabBar(
                  indicator: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(25.0)),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(
                      text: 'Product',
                    ),
                    Tab(
                      text: 'Details',
                    ),
                    Tab(
                      text: 'Reviews',
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    Product(),
                    Details(),
                    Reviews(),
                  ],
                ),
              ),
              //THE UNDER BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 170,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(25),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "share this".toUpperCase(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 120, top: 5),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: const Color.fromARGB(255, 113, 97, 96),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            iconSize: 20,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_upward,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: 170,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(25),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "add to card".toUpperCase(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 120, top: 5),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            iconSize: 20,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
