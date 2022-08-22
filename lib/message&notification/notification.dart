import 'package:e_commerce/MyNavigationBar/home.dart';
import 'package:e_commerce/widgets/todolist.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(
            95,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop(
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.close),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Notification",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 3, left: 3),
          child: ListView.separated(
            itemCount: myToDoListNotification.length,
            itemBuilder: (_, item) {
              return toDoItem(
                textDetials1: myToDoListNotification[item]['textDetials1'],
                time: myToDoListNotification[item]['time'],
                textDetials2: myToDoListNotification[item]['textDetials2'],
                condtionOfCircleAvatar: myToDoListNotification[item]['isread1'],
                avatarRed: myToDoListNotification[item]['avatarRed'],
                textDetials3: myToDoListNotification[item]['textDetials3'],
                conditionToMakeTextHint: myToDoListNotification[item]['tiltle'],
              );
            },
            separatorBuilder: (_, item) {
              return const Divider(
                endIndent: 8,
                indent: 70,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget toDoItem(
      {required bool conditionToMakeTextHint,
      required String textDetials1,
      required String textDetials2,
      required String textDetials3,
      required String time,
      required int condtionOfCircleAvatar,
      required bool avatarRed}) {
  
    String getFirstTowCharFromString(String str) {
      List words = str.split(" ");
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
    print(getFirstTowCharFromString(textDetials1));

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          if (condtionOfCircleAvatar == 1)
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 92, 101, 202),
              foregroundColor: Colors.white,
              radius: 30,
              child: Text(
                getFirstTowCharFromString(textDetials1),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          else if (condtionOfCircleAvatar == 2)
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 37, 165, 165),
              foregroundColor: Colors.white,
              radius: 30,
              child: Text(
                getFirstTowCharFromString(textDetials1),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          else if (condtionOfCircleAvatar == 3)
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 158, 181, 53),
              foregroundColor: Colors.white,
              radius: 30,
              child: Text(
                getFirstTowCharFromString(textDetials1),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          else
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 185, 33, 99),
              foregroundColor: Colors.white,
              radius: 30,
              child: Text(
                getFirstTowCharFromString(textDetials1),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: textDetials1,
                    style: (conditionToMakeTextHint)
                        ? const TextStyle(fontSize: 17, color: Colors.black)
                        : const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: textDetials2,
                    style: (conditionToMakeTextHint)
                        ? const TextStyle(fontSize: 17, color: Colors.black54)
                        : const TextStyle(
                            fontSize: 17,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: textDetials3,
                    style: (conditionToMakeTextHint)
                        ? const TextStyle(fontSize: 17, color: Colors.black)
                        : const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: const TextStyle(fontSize: 15, color: Colors.black54),
              ),
              const SizedBox(
                height: 10,
              ),
              if (avatarRed)
                const CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.red,
                )
            ],
          ),
        ],
      ),
    );
  }
}
