import 'package:e_commerce/contactdatabase/contactdatabase.dart';
import 'package:e_commerce/message&notification/message.dart';
import 'package:e_commerce/message&notification/notification.dart';
import 'package:e_commerce/models/contactmodels.dart';
import 'package:e_commerce/provider/allProvider.dart';
import 'package:e_commerce/todoitem/todoitems.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//to handel total price for first categories
double total1 = 0;
//to handel total price for scond categories
double total2 = 0;
//to handel total price for third categories
double total3 = 0;
//condition to Handel plus& minus number Of categories
late int condition1;

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // price of categories &send to data base
  double price = 0;
  // title of categories &send to data base
  // image1 of categories &send to data base
  // titlecolor1 of categories &send to data base
  late String title, images1, titleColor1;
  //*********************************************** */
  //Start Copy of data base
  ContatcDataBaseHandler contatcDataBaseHandler = ContatcDataBaseHandler();
//end of data base
//***************************************************** */
//Start Function To Handler Insert DataBase
  Future<void> insertData(BuildContext context) async {
    await contatcDataBaseHandler
        .insertContactToDataBase(
      ContactModel(
        name: title,
        number: price.toString(),
        titleColorOfCatogries: titleColor1,
        img: images1,
        numberOfCatogries: numberOfcatogries1.toString(),
      ),
    )
        .then((value) {
      print('Data Saved');
      setState(() {});
    });
  }

//End Function To Handler Insert DataBase
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
            //MESSAGE&NOTIFICATION icons
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
            //TEXT "Cart"
            const Text(
              "Cart",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            //ROW OF DETAILS OF Categries
            Expanded(
              child: ListView.builder(
                itemCount: myToDoList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      // Start Handler Categories
                      packageCart(
                        //Title of categores
                        titleName: myToDoList[index]['tiltle'],
                        //Color of categores
                        titleColor: myToDoList[index]['titlecolor'],
                        //Salary of categores
                        titleSalary: myToDoList[index]['price'],
                        //onpressed to control of condition &plus Number of categories
                        onPressed: () {
                          setState(() {
                            condition1 = myToDoList[index]['condition'];
                            print("condition1: $condition1");
                          });
                          //condition to plus first categories(Ankle Boots)
                          // total1 = PriceOfcategories(Ankle Boots) * Numberof categories(Ankle Boots)
                          if (condition1 == 1) {
                            //provider to plus numberof Categories(Ankie Boots)
                            Provider.of<AllCounterProvider1>(context,
                                    listen: false)
                                .incrementcounter1();
                            price = myToDoList[index]['price'];
                            total1 = (price * numberOfcatogries1!);
                            print("total1 =***$total1");
                            print("price*******$price");
                          }
                          //condition to plus scond categories(Backpack)
                          // total2 = PriceOfcategories(Backpack) * Numberof categories(Backpack)
                          else if (condition1 == 2) {
                            //provider to plus numberof Categories(Backpack)
                            Provider.of<AllCounterProvider1>(context,
                                    listen: false)
                                .incrementcounter3();
                            price = myToDoList[index]['price'];
                            total2 = (price * numberOfcatogries2!);
                            print("total2 =***$total2");
                            print("peice2*******$price");
                          }
                          //condition to plus third categories(Scarf)
                          // total3= PriceOfcategories(Scarf) * Numberof categories(Scarf)
                          else if (condition1 == 3) {
                            //provider to plus numberof Categories(Scarf)
                            Provider.of<AllCounterProvider1>(context,
                                    listen: false)
                                .incrementcounter5();
                            price = myToDoList[index]['price'];
                            total3 = (price * numberOfcatogries3!);
                            print("total3 =***$total3");
                            print("peice3*******$price");
                          }
                        },
                        //start condition to control totalPrice&Price of categories
                        condition: myToDoList[index]['condition'],
                        //end condition to control totalPrice&Price of categories //CONDITION TO PLUS AND MUNIS NUMBER
                        //*************************************** */
                        //onpressed to control of condition &minus Number of categories
                        onPressed1: () {
                          setState(() {
                            condition1 = myToDoList[index]['condition'];
                            print("condition1: $condition1");
                          });
                          //condition to minus first categories(Ankle Boots)
                          // total1 = PriceOfcategories(Ankle Boots) * Numberof categories(Ankle Boots)
                          if (condition1 == 1) {
                            //provider to minus numberof Categories(Ankie Boots)
                            Provider.of<AllCounterProvider1>(context,
                                    listen: false)
                                .incrementcounter2();
                            price = myToDoList[index]['price'];
                            total1 = (price * numberOfcatogries1!);
                            print("total1 =***$total1");
                            print("peice1*******$price");
                          }
                          //condition to minus first categories(Backpack)
                          // total2 = PriceOfcategories(Backpack) * Numberof categories(Backpack)
                          else if (condition1 == 2) {
                            //provider to minus numberof Categories(Backpack)
                            Provider.of<AllCounterProvider1>(context,
                                    listen: false)
                                .incrementcounter4();
                            price = myToDoList[index]['price'];
                            total2 = (price * numberOfcatogries2!);
                            print("numberOfcatogries2 $numberOfcatogries2");
                            print("total2 =***$total2");
                            print("peice2*******$price");
                          }
                          //condition to plus first categories(Scarf)
                          // total3 = PriceOfcategories(Scarf) * Numberof categories(Scarf)
                          else if (condition1 == 3) {
                            //provider to minus numberof Categories(Scarf)
                            Provider.of<AllCounterProvider1>(context,
                                    listen: false)
                                .incrementcounter6();
                            price = myToDoList[index]['price'];
                            total3 = (price * numberOfcatogries3!);
                            print("total3 =***$total3");
                            print("peice3*******$price");
                          }
                        },
                        // Start image of categories(Ankie Boots & Backpack & Scarf)
                        image: myToDoList[index]['image'],
                        // End image of categories(Ankie Boots & Backpack & Scarf)
                      ),
                      // End Handler Categories
                      //************************************* */
                      //Start Handler Button to Add Shopping
                      Column(
                        children: [
                          Text(
                            "      Add To\n Shopping page",
                            style: TextStyle(fontSize: 8),
                          ),
                          custtomButtonToAddShopping(
                            onPressed: () {
                              print(
                                  'You selected Item Number ${myToDoList[index]['tiltle']}');
                              setState(() {
                                title = myToDoList[index]['tiltle'];
                                print("${title} ********************");
                                // price = myToDoList[index]['price'].toString();
                                print("price :$price");
                                images1 = myToDoList[index]['image'];
                                print("${images1} ********************");
                                titleColor1 = myToDoList[index]['titlecolor'];
                                print("${titleColor1} ********************");

                                print(
                                    "******* number1:  ${numberOfcatogries1} ********************");
                                print(
                                    "******* number2:  ${numberOfcatogries2} ********************");
                                print(
                                    "******* number3:  ${numberOfcatogries3} ********************");

                                insertData(context);
                              });
                            },
                          ),
                        ],
                      )
                      //End Handler Button to Add Shopping
                    ],
                  );
                },
              ),
            ),
            //Row Of Total price & Checkout
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //text "Total"
                    Text(
                      "Total Price",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text(
                      // total1 = PriceOfcategories(Ankle Boots) * Numberof categories(Ankle Boots)
                      // total2 = PriceOfcategories(Backpack) * Numberof categories(Backpack)
                      // total3 = PriceOfcategories(Scarf) * Numberof categories(Scarf)
                      (total1 + total2 + total3).toStringAsFixed(2),
                      style: TextStyle(fontSize: 30),
                    ),
                    //Text "Free Domestic Shipping"
                    Text(
                      "Free Domestic Shipping",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
                //button Of CheckOut
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
            ),
          ],
        ),
      ),
    );
  }

//Handler Widget Of Categories
  Widget packageCart(
      {required String titleName,
      required String titleColor,
      required double titleSalary,
      required String image,
      required VoidCallback onPressed,
      required int condition,
      required VoidCallback onPressed1}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //image of categories
          CircleAvatar(
            backgroundColor: const Color.fromARGB(26, 98, 70, 70),
            radius: 45,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(images1 = image),
            ),
          ),
          //space
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title of categories
              Text(
                title = titleName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              //titlecolor of categories
              Text(
                titleColor1 = titleColor,
                style: const TextStyle(color: Colors.black54),
              ),
              //space
              const SizedBox(
                height: 10,
              ),
              //titlesalary of categories
              Text(
                titleSalary.toString(),
                style: const TextStyle(color: Colors.red),
              ),
              //counter &plus and minus
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    //text button to plus
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
                      Selector<AllCounterProvider1, double>(
                        builder: ((context, counter1, child) {
                          return Text(counter1.toString());
                        }),
                        selector: (context, mycounter) {
                          return mycounter.counter1;
                        },
                      )
                    else if (condition == 2)
                      Selector<AllCounterProvider1, double>(
                        builder: ((context, counter2, child) {
                          return Text(counter2.toString());
                        }),
                        selector: (context, mycounter) {
                          return mycounter.counter2;
                        },
                      )
                    else if (condition == 3)
                      Selector<AllCounterProvider1, double>(
                        builder: ((context, counter3, child) {
                          return Text(counter3.toString());
                        }),
                        selector: (context, mycounter) {
                          return mycounter.counter3;
                        },
                      ),

                    //text button to minus
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
        ],
      ),
    );
  }

//Handler Widget To Add Categries in Shopping
  Widget custtomButtonToAddShopping({required VoidCallback onPressed}) {
    return TextButton(
      onPressed: onPressed,
      child: Icon(Icons.shop),
    );
  }
}
