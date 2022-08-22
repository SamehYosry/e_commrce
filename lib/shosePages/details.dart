import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "BRAND",
                  style: TextStyle(color: Colors.black54),
                ),
                Text("lily'Ankie Boots"),
                SizedBox(
                  height: 25,
                ),
                Text("CONDSTION",style: TextStyle(color: Colors.black54),),
                Text("Brand New,With Box"),
                SizedBox(
                  height: 25,
                ),
                Text("CATEGORY",style: TextStyle(color: Colors.black54),),
                Text("Women Shoes")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text("SKU",style: TextStyle(color: Colors.black54),),
                Text("0590458902809"),
                SizedBox(
                  height: 25,
                ),
                Text("MATERIAL",style: TextStyle(color: Colors.black54),),
                Text("FauxSued,Velvet"),
                SizedBox(
                  height: 25,
                ),
                Text("FITING",style: TextStyle(color: Colors.black54),),
                Text("True To Size")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
