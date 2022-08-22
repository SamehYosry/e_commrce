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
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "SELECT COLOR",
            style: TextStyle(color: Colors.black54),
          ),
          //ROW OF COLOR
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Stack(children: [
          //       CircleAvatar(
          //         backgroundColor: Colors.blueGrey.shade600,
          //       ),
          //       const Padding(
          //         padding: EdgeInsets.all(8.0),
          //         child: Icon(
          //           Icons.check_outlined,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ]),
          //     CircleAvatar(
          //       backgroundColor: Colors.amber.shade300,
          //     ),
          //     CircleAvatar(
          //       backgroundColor: Colors.blueGrey.shade200,
          //     ),
          //     const CircleAvatar(
          //       backgroundColor: Color.fromARGB(137, 171, 143, 143),
          //     ),
          //     const CircleAvatar(
          //       backgroundColor: Color.fromARGB(255, 71, 152, 190),
          //     ),
          //     const CircleAvatar(
          //       backgroundColor: Color.fromARGB(255, 0, 3, 5),
          //     ),
          //   ],
          // ),
          Column(children: [
            //    ElevatedButton(
            //      onPressed: (){
            //          showDialog(
            //              context: context,
            //              builder: (BuildContext context){
            //                return AlertDialog(
            //                    title: Text('Pick a color!'),
            //                    content: SingleChildScrollView(
            //                      child: ColorPicker(
            //                        pickerColor: mycolor, //default color
            //                        onColorChanged: (Color color){ //on color picked
            //                            setState(() {
            //                              mycolor = color;
            //                            });
            //                        },
            //                      ),
            //                    ),
            //                    actions: <Widget>[
            //                      ElevatedButton(
            //                        child: const Text('DONE'),
            //                        onPressed: () {
            //                          Navigator.of(context).pop(); //dismiss the color picker
            //                        },
            //                      ),
            //                    ],
            //                );
            //            }
            //          );

            //      },
            //      child: Text("Default Color Picker"),
            //  ),

            //  ElevatedButton(
            //      onPressed: (){
            //        showDialog(
            //            context: context,
            //            builder: (BuildContext context){
            //              return AlertDialog(
            //                  title: Text('Pick a color!'),
            //                  content: SingleChildScrollView(
            //                    child: MaterialPicker(
            //                      pickerColor: mycolor, //default color
            //                      onColorChanged: (Color color){ //on color picked
            //                         setState(() {
            //                            mycolor = color;
            //                         });
            //                      },
            //                    ),
            //                  ),
            //                  actions: <Widget>[
            //                    ElevatedButton(
            //                      child: const Text('DONE'),
            //                      onPressed: () {
            //                        Navigator.of(context).pop(); //dismiss the color picker
            //                      },
            //                    ),
            //                  ],
            //              );
            //          }
            //        );

            //      },
            //      child: Text("Material Color Picker"),
            //  ),

             ElevatedButton(
                 onPressed: (){
                   showDialog(
                       context: context,
                       builder: (BuildContext context){
                         return AlertDialog(
                             title: const Text('Pick a color!'),
                             content: SingleChildScrollView(
                               child: BlockPicker(
                                 pickerColor: mycolor, //default color
                                 onColorChanged: (Color color){ //on color picked
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
                                   Navigator.of(context).pop(); //dismiss the color picker
                                 },
                                 
                               ),
                             ],
                         );
                     }
                   );

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
                 child:  const Text("Block Color Picker"),
             ),

            // ElevatedButton(
            //   onPressed: () {
            //     showDialog(
            //         context: context,
            //         builder: (BuildContext context) {
            //           return AlertDialog(
            //             title: Text('Pick a color!'),
            //             content: SingleChildScrollView(
            //               child: MultipleChoiceBlockPicker(
            //                 pickerColors: [
            //                   Colors.red,
            //                   Colors.orange
            //                 ], //default color
            //                 onColorsChanged: (List<Color> colors) {
            //                   //on colors picked
            //                   print(colors);
            //                 },
            //               ),
            //             ),
            //             actions: <Widget>[
            //               ElevatedButton(
            //                 child: const Text('DONE'),
            //                 onPressed: () {
            //                   Navigator.of(context)
            //                       .pop(); //dismiss the color picker
            //                 },
            //               ),
            //             ],
            //           );
            //         });
            //   },
            //   child: Text("Multiple Choice Color Picker"),
            //   style: ButtonStyle(
            //       fixedSize: MaterialStateProperty.all(
            //         Size.fromHeight(60),
            //       ),
            //       backgroundColor: MaterialStateProperty.all(
            //           Color.fromARGB(255, 97, 194, 100)),
            //       shape: MaterialStateProperty.all(
            //         RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(25),
            //         ),
            //       )),
            // ),
          
          ]),
          const Text(
            "SELECT SIZE (US)",
            style: TextStyle(color: Colors.black54),
          ),
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
