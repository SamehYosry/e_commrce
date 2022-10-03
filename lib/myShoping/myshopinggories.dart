
import 'package:e_commerce/contactdatabase/contactdatabase.dart';
import 'package:e_commerce/models/contactmodels.dart';
import 'package:flutter/material.dart';

class MyFavouriteCategories extends StatefulWidget {
  const MyFavouriteCategories({super.key});

  @override
  State<MyFavouriteCategories> createState() => _MyFavouriteCategoriesState();
}

class _MyFavouriteCategoriesState extends State<MyFavouriteCategories> {
//to confirm delete or no
  bool confirmDelete = false;
  //to deleteall or no
  bool isDeleteAll = false;
  //copy contatcDataBaseHandler
  ContatcDataBaseHandler contatcDataBaseHandler = ContatcDataBaseHandler();

  // getAllData
  //to get all categories
  Future<List<ContactModel>> getAllData() async {
    List<ContactModel> allData = [];
    await contatcDataBaseHandler.getAllContactsFromDataBase().then((value) {
      allData = value;
    });
    return allData;
  }

// delet All Data
//to delete all categories
  deleteAllContatcs() async {
    await contatcDataBaseHandler.deleteAllContactsFromDataBase();
    setState(() {});
  }

// Delete contatc By Id
  deleteContact(int id) async {
    await contatcDataBaseHandler.deleteContactFromDataBaseByID(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Categoris'),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        actions: [
          //icons of delet All
          TextButton.icon(
            onPressed: () {
              //handler show dialog
              deleteMessageDialog1(context: context);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            label: const Text(
              'Delete All',
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
          future: getAllData(),
          builder: (BuildContext context,
              AsyncSnapshot<List<ContactModel>> snapshot) {
            if (snapshot.data != null && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  //handler widget
                  return customContactTile(
                    context,
                    id: snapshot.data![index].id!,
                    titleofCatogries: snapshot.data![index].name,
                    price: snapshot.data![index].number,
                    titlecolor: snapshot.data![index].titleColorOfCatogries,
                    image3: snapshot.data![index].img,
                    numberOfcatogries1: snapshot.data![index].numberOfCatogries,
                  );
                },
              );
            } else {
              return const Center(
                  child: Text(
                ' No Categories',
                style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ));
            }
          },
        ),
      ),
    );
  }

// Custom Contact Card
  Widget customContactTile(
    BuildContext context, {
    required String titleofCatogries,
    required String titlecolor,
    required String image3,
    required String numberOfcatogries1,
    required String price,
    required int id,
  }) {
    return Card(
      elevation: 15,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.red, width: 3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Dismissible(
        confirmDismiss: (vlaue) async {
          await deleteMessageDialog(context: context, id: id);
          return confirmDelete;
        },
        direction: DismissDirection.endToStart,
        key: UniqueKey(),
        background: Container(
          padding: const EdgeInsets.only(right: 10),
          color: Colors.red,
          child: const Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.delete, color: Colors.white, size: 50),
          ),
        ),
        child: Column(
          children: [
            //image
            Image.asset(
              image3,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(0.3),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //title of caregories
                  Text(
                    titleofCatogries,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 8, 66, 114),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(height: 5),
                  //price
                  Text(
                    'Price: ${price}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  const SizedBox(height: 5),
                  //color
                  Text(
                    'Colors: ${titlecolor}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

// // handler show dialog of delete categories
  Future deleteMessageDialog(
      {required BuildContext context, required int id}) async {
    await showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => AlertDialog(
        content: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Container(
            height: MediaQuery.of(context).size.height / 8.5,
            child: Column(
              children: [
                const Text(
                  'Delete Categories',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  (isDeleteAll)
                      ? 'Are you sure you want to delete All categories'
                      : 'Are you sure you want to delete this category',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // TODO : delete just a contact
              deleteContact(id);
              confirmDelete = true;
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              // don't delete
              confirmDelete = false;
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
        ],
      ),
    );
    isDeleteAll = false;
  }

// handler show dialog of delete all
  Future deleteMessageDialog1({required BuildContext context}) async {
    await showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => AlertDialog(
        content: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Container(
            height: MediaQuery.of(context).size.height / 8.5,
            child: Column(
              children: [
                const Text(
                  'Delete Categories',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  "Are you sure you want to delete All Categories",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // TODO : delete All notes
              deleteAllContatcs();
              confirmDelete = true;
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              // don't delete
              confirmDelete = false;
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
        ],
      ),
    );
    isDeleteAll = false;
  }
}
