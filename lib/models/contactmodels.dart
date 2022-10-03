import 'package:e_commerce/consts/consts.dart';

class ContactModel {
  late String name, number, img, titleColorOfCatogries,numberOfCatogries;
  int? id;

  ContactModel({
    required this.name,
    required this.number,
    required this.titleColorOfCatogries,
    required this.img,
    required this.numberOfCatogries,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      idColumn: id,
      nameColumn: name,
      titleColors: titleColorOfCatogries,
      numberColumn: number,
      images: img,
      NUMBEROFCATOGRIES: numberOfCatogries
    };
  }

  ContactModel.fromJson(Map<String, dynamic> map) {
    id = map[idColumn];
    name = map[nameColumn];
    titleColorOfCatogries = map[titleColors];
    number = map[numberColumn];
    img = map[images];
    numberOfCatogries = map[NUMBEROFCATOGRIES];
  }
}
