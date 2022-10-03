import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  Color mycolor = Colors.lightBlue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "SELECT COLOR",
            style: TextStyle(color: Colors.black54),
          ),
          Column(
            children: [
             //button To Select Color
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Pick a color!'),
                          content: SingleChildScrollView(
                            child: BlockPicker(
                              pickerColor: mycolor, //default color
                              onColorChanged: (Color color) {
                                //on color picked
                                setState(() {
                                  mycolor = color;
                                });
                              },
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('DONE'),
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); //dismiss the color picker
                              },
                            ),
                          ],
                        );
                      });
                },
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      const Size.fromHeight(60),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 119, 146, 235)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    )),
                child: const Text("Block Color Picker"),
              ),
            ],
          ),
          const Text(
            "SELECT SIZE (US)",
            style: TextStyle(color: Colors.black54),
          ),
         //Row Of Size
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(95, 224, 219, 219),
                  ),
                  width: 80,
                  height: 45,
                  child: const Center(
                    child: Text("4.5"),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(95, 224, 219, 219),
                  ),
                  width: 80,
                  height: 45,
                  child: const Center(
                    child: Text("5.0"),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(95, 224, 219, 219),
                  ),
                  width: 80,
                  height: 45,
                  child: const Center(
                    child: Text("6.5"),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(95, 224, 219, 219),
                  ),
                  width: 80,
                  height: 45,
                  child: const Center(
                    child: Text("7.0"),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(95, 224, 219, 219),
                  ),
                  width: 80,
                  height: 45,
                  child: const Center(
                    child: Text("7.5"),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(95, 224, 219, 219),
                  ),
                  width: 80,
                  height: 45,
                  child: const Center(
                    child: Text("8"),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(95, 224, 219, 219),
                  ),
                  width: 80,
                  height: 45,
                  child: const Center(
                    child: Text("9.5"),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
