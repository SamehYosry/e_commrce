import 'package:e_commerce/MyNavigationBar/home.dart';
import 'package:flutter/material.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(right: 35)),
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  color: Colors.red,
                  onPressed: () {
                    Navigator.of(context).pop(
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              const Padding(
                 padding:  EdgeInsets.only(left: 10),
                 child: Text(
                  "All Categories",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
              ),
               ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      backColorGradient(
                        circleAvatar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKU5imAg01IisyWWJTt0fzRbnMzZje93JieNjfZF6xY8_paDwJwGQhaXhvNER1hfgd3yw&usqp=CAU",
                        tiltle: "Apparel",
                      ),
                      backColorGradient(
                          circleAvatar: "https://www.hiamag.com/sites/default/files/article/06/09/2020/9682681-1557037188.jpg",
                          tiltle: "Beauty"),
                      backColorGradient(
                        circleAvatar: "https://assets.adidas.com/images/w_600,f_auto,q_auto/ce8a6f3aa6294de988d7abce00c4e459_9366/Breaknet_Shoes_White_FX8707_01_standard.jpg",
                        tiltle: "Shoes",
                      ),
                      backColorGradient(
                        circleAvatar: "https://www.industriall-union.org/sites/default/files/styles/large/public/uploads/images/Sector-Generic-Images/chiptest.jpg?itok=nlnWB_ys",
                        tiltle: "Electronics",
                      ),
                      backColorGradient(
                        circleAvatar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShpjpJN6mqHSeC1B2s6X0thQ-epR1Lx6gGEq5NX-6_PL_gjDW3dB7feZG-jmQH5XeYESM&usqp=CAU",
                        tiltle: "furnture",
                      ),
                      backColorGradient(
                        circleAvatar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt9fZqDmhhJnIG8RLkQRPpp7NzzricfpM1hbZVhtKmWdVgQLexBUK0GctywfrMc9XhGNw&usqp=CAU",
                        tiltle: "Home",
                      ),
                      backColorGradient(
                        circleAvatar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYzHKmP4gkOXLQM0ezJn0-joUA16wuKa4sYIfaBcOtL5OE1khd9nQg0vI0C5UYRhs_SRA&usqp=CAU",
                        tiltle: "stationary",
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                    height: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // LIST MAN APPAREL
                        const Text(
                          "MEN'S APPAREL",
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              RowFromMensAndWomansApparel(
                                  tiltleRow: "T_Shirts"),
                              const Divider(),
                              RowFromMensAndWomansApparel(tiltleRow: "Shirts"),
                              const Divider(),
                              RowFromMensAndWomansApparel(
                                  tiltleRow: "Pantes&Jeans"),
                              const Divider(),
                              RowFromMensAndWomansApparel(
                                  tiltleRow: "Socks&Ties"),
                              const Divider(),
                              RowFromMensAndWomansApparel(
                                  tiltleRow: "UnderWear"),
                              const Divider(),
                              RowFromMensAndWomansApparel(tiltleRow: "Jackets"),
                              const Divider(),
                              RowFromMensAndWomansApparel(tiltleRow: "Coats"),
                              const Divider(),
                              RowFromMensAndWomansApparel(
                                  tiltleRow: "Sweaters"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(),
                        // LIST WOMAN APPAREL
                        const Text(
                          "WOMAN APPAREL",
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              RowFromMensAndWomansApparel(
                                  tiltleRow: "OfficeWear"),
                              const Divider(),
                              RowFromMensAndWomansApparel(
                                  tiltleRow: "Blouse&T_Shirt"),
                              const Divider(),
                              RowFromMensAndWomansApparel(
                                  tiltleRow: "Pantes&Jeans"),
                              const Divider(),
                              RowFromMensAndWomansApparel(tiltleRow: "Dresses"),
                              const Divider(),
                              RowFromMensAndWomansApparel(
                                  tiltleRow: "Lingerie"),
                              const Divider(),
                              RowFromMensAndWomansApparel(
                                  tiltleRow: "Jaackets"),
                              const Divider(),
                              RowFromMensAndWomansApparel(tiltleRow: "Coats"),
                              const Divider(),
                              RowFromMensAndWomansApparel(
                                  tiltleRow: "Sweaters"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget backColorGradient(
      {required String circleAvatar, required String tiltle}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(backgroundColor: Colors.white,
                    radius: 30,
                    child: ClipOval(
                        child: Image.network(
                            circleAvatar))),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          tiltle,
          style: const TextStyle(color: Colors.black54),
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget RowFromMensAndWomansApparel({required String tiltleRow}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(tiltleRow),
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
        ),
        //Divider(),
      ],
    );
  }
}
