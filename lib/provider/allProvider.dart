import 'package:flutter/cupertino.dart';
 double? numberOfcatogries1=0;
  double? numberOfcatogries2=0;
   double? numberOfcatogries3=0;
class AllCounterProvider1 with ChangeNotifier {
  double counter1 = 0;
  double counter2=0;
  double counter3=0;
  //plus and muns frist row
  void incrementcounter1() {
    counter1++;
    numberOfcatogries1=counter1;
    // ignore: avoid_print
    print("Counter1 : $counter1");
    print("numberOfcatogries1 : $numberOfcatogries1");
    notifyListeners();
  }
   void incrementcounter2() {
    counter1--;
    // ignore: avoid_print
    numberOfcatogries1=counter1;
    print("Counter1 : $counter1");
        print("numberOfcatogries1 : $numberOfcatogries1");

    notifyListeners();
  }
   //plus and muns second row
 void incrementcounter3() {
  
    counter2++;
    numberOfcatogries2=counter2;
    // ignore: avoid_print
    print("Counter2 : $counter2");
        print("numberOfcatogries2 : $numberOfcatogries2");

    notifyListeners();
  }
   void incrementcounter4() {
    counter2--;
      numberOfcatogries2=counter2;
    // ignore: avoid_print
    print("Counter2 : $counter2");
        print("numberOfcatogries2 : $numberOfcatogries2");

    notifyListeners();
  }
   //plus and muns third row
void incrementcounter5() {
   
    counter3++;
     numberOfcatogries3=counter3;
    // ignore: avoid_print
    print("Counter3 : $counter3");
        print("numberOfcatogries3 : $numberOfcatogries3");

    notifyListeners();
  }
   void incrementcounter6() {
      
    counter3--;
    numberOfcatogries3=counter3;
    // ignore: avoid_print
    print("Counter3 : $counter3");
        print("numberOfcatogries3 : $numberOfcatogries3");

    notifyListeners();
  }
}
//PROVIDER OF Favourite
class ProviderOfFavorite with ChangeNotifier {
 bool isFav =false;
 bool isFav1=false;
 bool isFav2=false;
  //plus and muns frist row
  void incrementFavorite() {
   isFav=!isFav;
    // ignore: avoid_print
    print("Favourite : $isFav");
    notifyListeners();
  }
  void incrementFavorite1() {
   isFav1=!isFav1;
    // ignore: avoid_print
    print("Favourite1 : $isFav1");
    notifyListeners();
  }
  void incrementFavorite2() {
   isFav2=!isFav2;
    // ignore: avoid_print
    print("Favourite2 : $isFav2");
    notifyListeners();
  }
}
//PROVIDER OF LOVE
class ProviderOfSeePassword with ChangeNotifier {

 bool isSee =true;
  //plus and muns frist row
  void incrementSeePassword() {
   isSee=!isSee;
    // ignore: avoid_print
    print("Favourite : $isSee");
    notifyListeners();
  }
 

}