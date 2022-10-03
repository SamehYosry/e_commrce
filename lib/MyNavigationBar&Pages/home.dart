import 'package:e_commerce/catagories/allcategories.dart';
import 'package:e_commerce/message&notification/message.dart';
import 'package:e_commerce/message&notification/notification.dart';
import 'package:e_commerce/provider/allProvider.dart';
import 'package:e_commerce/shosePages/myshosespages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(31, 195, 184, 184),
      body: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //MESSAGE AND NOTIFICATION ICON
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
            //TEXT CATEGORIES
            const Text(
              "Categories",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            //ROW OF CATEGORIES
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKU5imAg01IisyWWJTt0fzRbnMzZje93JieNjfZF6xY8_paDwJwGQhaXhvNER1hfgd3yw&usqp=CAU"),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzN26OsfxZACycnDfY4XYCbvfN4C9oH5A5PuXwDyyVS-M-xHBT6I_iKIyhgw-KgTc74qE&usqp=CAU"),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://assets.adidas.com/images/w_600,f_auto,q_auto/ce8a6f3aa6294de988d7abce00c4e459_9366/Breaknet_Shoes_White_FX8707_01_standard.jpg"),
                  child: ClipOval(),
                ),
                //ICON BUTTON OF SEE ALL
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: IconButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AllCategories(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_sharp,
                    ),
                  ),
                ),
              ],
            ),
            //ROW OF TEXT
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text("Apparel"),
                Text("Beauty"),
                Text("Shose"),
                Text("SeeAll"),
              ],
            ),
            const Text(
              "Latest",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
           //CONTAINER have text and picture
            Container(
              padding: const EdgeInsets.only(left: 15, top: 15),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 134, 93, 209),
                    Color.fromARGB(255, 144, 141, 167),
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //TEXT
                      const Text(
                        "For all your\nsummer clothing\nneeds",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 249, 233, 233),
                        ),
                      ),
                      //BUTTON OF SEE MORE
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SizedBox(
                          height: 40,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  'see more'.toUpperCase(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //IMAGE OF GIRL
                  SizedBox(
                    height: 150,
                    width: 140,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Expanded(
                        child: Image.asset(
                            fit: BoxFit.fill,
                            'assests/booksimage/banner-transparent-bg-removebg-preview.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
           //row of categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //CATEGORIES OF ANKIEBOOTS
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MyShosePages(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 100,
                    height: 195,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey[200],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                            "assests/booksimage/boots-removebg-preview.png"),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text("Ankie Boots"),
                        const Text(" \$49.99"),
                        Selector<ProviderOfFavorite, bool>(
                          builder: ((context, isFav, child) {
                            return IconButton(
                              onPressed: () {
                                Provider.of<ProviderOfFavorite>(context,
                                        listen: false)
                                    .incrementFavorite();
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: isFav ? Colors.red : Colors.white,
                              ),
                            );
                          }),
                          selector: (context, mycounter) {
                            return mycounter.isFav;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                //CATEGORIES OF BACK PACK
                Container(
                  padding: const EdgeInsets.all(2),
                  width: 100,
                  //height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey[200]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                          "assests/booksimage/backpack2-removebg-preview.png"),
                      const Text("BackPack"),
                      const Text(" \$20.58"),
                      Selector<ProviderOfFavorite, bool>(
                        builder: ((context, isFav1, child) {
                          return IconButton(
                            onPressed: () {
                              Provider.of<ProviderOfFavorite>(context,
                                      listen: false)
                                  .incrementFavorite1();
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: isFav1 ? Colors.red : Colors.white,
                            ),
                          );
                        }),
                        selector: (context, mycounter) {
                          return mycounter.isFav1;
                        },
                      ),
                    ],
                  ),
                ),

                //CATEGORIES OF RED SCARF
                Container(
                  padding: const EdgeInsets.all(5),
                  width: 100,
                  height: 195,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey[200]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                          "assests/booksimage/scarf-removebg-preview.png"),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Red Scarf"),
                      const Text(" \$11.00"),
                      Selector<ProviderOfFavorite, bool>(
                        builder: ((context, isFav2, child) {
                          return IconButton(
                            onPressed: () {
                              Provider.of<ProviderOfFavorite>(context,
                                      listen: false)
                                  .incrementFavorite2();
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: isFav2 ? Colors.red : Colors.white,
                            ),
                          );
                        }),
                        selector: (context, mycounter) {
                          return mycounter.isFav2;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
