import 'package:flutter/material.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    //Start Handel To Get First And Scond char
    String s = "Jane Doe";
    List words = s.split(" ");
    // ignore: avoid_print
    print(words.isEmpty);
    String getFirstTowCharFromString(String str) {
      List words = str.split(" ");
      // ignore: avoid_print
      print(words);
      String outPut = "";
      if (str.isEmpty) {
        return "";
      } else if (words.length == 1) {
        return words[0][0];
      } else if (words.length >= 2) {
        for (int i = 0; i < 2; i++) {
          outPut += words[i][0];
        }
        return outPut;
      }
      return "";
    }

    // ignore: avoid_print
    print(getFirstTowCharFromString(s));
    //End Handel To Get First And Scond char
    return Scaffold(
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: const Color.fromARGB(137, 147, 143, 143),
                child: Text(
                  getFirstTowCharFromString(s),
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //ROW OF STAR
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.red,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.red,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.red,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.red,
                        ),
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 159, 152, 152),
                        ),
                        Expanded(child: SizedBox()),
                        Text("10 Oct,2018"),
                      ],
                    ),

                    const Text(
                      "Jane Doe",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                        "Lorem ipsum dolor sit amet,\nconsectur adipiscing elit,sed"),
                    //ROW OF PICTURE
                    Row(
                      children: [
                        SizedBox(
                          width: 45,
                          height: 45,
                          child: Image.asset("assests/booksimage/shose1.jpg"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 45,
                            height: 45,
                            child:
                                Image.asset("assests/booksimage/shoes2.webp"),
                          ),
                        ),
                        SizedBox(
                          width: 45,
                          height: 45,
                          child: Image.asset("assests/booksimage/shoes3.jpg"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 45,
                            height: 45,
                            child: Image.asset("assests/booksimage/shoes4.jpg"),
                          ),
                        ),
                        SizedBox(
                          width: 45,
                          height: 45,
                          child: Image.asset("assests/booksimage/shoes6.jpg"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
