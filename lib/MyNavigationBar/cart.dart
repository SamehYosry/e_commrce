import 'package:e_commerce/message&notification/message.dart';
import 'package:e_commerce/message&notification/notification.dart';
import 'package:e_commerce/provider/allProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // int number = 0;
  // int number1 = 0;
  // int number2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(31, 195, 184, 184),
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //MESSAGE&NOTIFICATION
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
            //TEXT Cart
            const Text(
              "Cart",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            //ROW OF DETAILS OF AnkieBoots
            packageCart(
              titleName: "Faux Sued Ankle Boots",
              titleColor: "7,Hot Pink",
              titleSalary: "\$49.99",
              onPressed: () {
                Provider.of<AllCounterProvider1>(context, listen: false)
                    .incrementcounter1();
              },
              condition: 1, //CONDITION TO PLUS AND MUNIS NUMBER
              onPressed1: () {
                Provider.of<AllCounterProvider1>(context, listen: false)
                    .incrementcounter2();
              },
              image: 'assests/booksimage/boots-removebg-preview.png',
            ),
            const Divider(indent: 130),
            //ROW OF DETAILS OF Backpack
            packageCart(
              titleName: "Bottle Green Backpack",
              titleColor: "Medium,Green",
              titleSalary: "\$20.58",
              onPressed: () {
                Provider.of<AllCounterProvider1>(context, listen: false)
                    .incrementcounter3();
              },
              condition: 2,
              onPressed1: () {
                Provider.of<AllCounterProvider1>(context, listen: false)
                    .incrementcounter4();
              },
              image: 'assests/booksimage/backpack2-removebg-preview.png',
            ),
            const Divider(indent: 130),
            //ROW OF DETAILS OF Scarf
            packageCart(
              titleName: "Red Cotton Scarf",
              titleColor: "2ft,Dark Red",
              titleSalary: "\$11.00",
              onPressed: () {
                Provider.of<AllCounterProvider1>(context, listen: false)
                    .incrementcounter5();
              },
              condition: 3,
              onPressed1: () {
                Provider.of<AllCounterProvider1>(context, listen: false)
                    .incrementcounter6();
              },
              image: 'assests/booksimage/scarf-removebg-preview.png',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Total",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text(
                      "\$81.57",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      "Free Domestic Shipping",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(25),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "checkout".toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8, top: 6, bottom: 6),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Widget packageCart(
      {required String titleName,
      required String titleColor,
      required String titleSalary,
      required String image,
      required VoidCallback onPressed,
      required int condition,
      required VoidCallback onPressed1}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(26, 98, 70, 70),
            radius: 45,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(image),
            ),
          ),
          const SizedBox(
            width: 35,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                titleColor,
                style: const TextStyle(color: Colors.black54),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                titleSalary,
                style: const TextStyle(color: Colors.red),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                        shape: MaterialStateProperty.all(
                          const CircleBorder(),
                        ),
                      ),
                      onPressed: onPressed,
                      child: const Text(
                        "+",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    if (condition == 1)
                      Selector<AllCounterProvider1, int>(
                        builder: ((context, counter1, child) {
                          return Text(counter1.toString());
                        }),
                        selector: (context, mycounter) {
                          return mycounter.counter1;
                        },
                      )
                    // : Selector<AllCounterProvider1, int>(
                    //     builder: ((context, counter2, child) {
                    //       return Text(counter2.toString());
                    //     }),
                    //     selector: (context, mycounter) {
                    //       return mycounter.counter1;
                    //     },
                    //   )
                    else if (condition == 2)
                      Selector<AllCounterProvider1, int>(
                        builder: ((context, counter2, child) {
                          return Text(counter2.toString());
                        }),
                        selector: (context, mycounter) {
                          return mycounter.counter2;
                        },
                      )
                    // Text("$number1")
                    else if (condition == 3)
                      Selector<AllCounterProvider1, int>(
                        builder: ((context, counter3, child) {
                          return Text(counter3.toString());
                        }),
                        selector: (context, mycounter) {
                          return mycounter.counter3;
                        },
                      ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                        shape: MaterialStateProperty.all(
                          const CircleBorder(),
                        ),
                      ),
                      onPressed: onPressed1,
                      child: const Text(
                        "-",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
