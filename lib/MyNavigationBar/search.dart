import 'package:e_commerce/message&notification/message.dart';
import 'package:e_commerce/message&notification/notification.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(31, 195, 184, 184),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //ROW OF MESSAGE &NOTIFICATION
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
            const Text(
              "Search",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            //TEXT FIELD SEARCH
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 5),
              child: SizedBox(
                height: 45,
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.black45),
                    hintText: 'Search Something',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(25)
                    ),
                    filled: true,
                  
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //colum of RECENTLY VIEWED
                Column(
                  children: [
                    const Text("RECENTLY VIEWED"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: const Color.fromARGB(255, 201, 200, 200),
                        child: Row(
                          children: [
                            const Icon(Icons.ac_unit_outlined),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Red Coton Scraf'),
                                Text('\$ 11.00')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //colum of clear
                Column(
                  children: [
                    const Text("CLEAR"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: const Color.fromARGB(255, 201, 200, 200),
                        child: Row(
                          children: [
                            const Icon(Icons.ac_unit_outlined),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Bottle Green B'),
                                Text('\$ 20.85')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "RECOMMENDAED",
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text(
                    "REFRESH",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: const Text("Denim Jeans"),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: const Text("Mini Skirt"),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: const Text("Jackets"),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: const Text("Accessories"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: const Text("Sports Accessories"),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: const Text("Yogo Pants"),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: const Text("Eye Shadow"),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 50,
              child: const TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  hintText: 'Tab & Hold To Search With Voice',
                  prefixIcon: Icon(Icons.keyboard_voice_sharp),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
