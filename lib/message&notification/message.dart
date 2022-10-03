import 'package:e_commerce/MyNavigationBar&Pages/home.dart';
import 'package:e_commerce/widgets/todolist.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(
            145,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //ICONBUTTON TO CLOSE PAGE
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
             //text "Message"
             Container(
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding:  EdgeInsets.only(left: 15),
                  child:  Text(
                    "Message",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
             //TEXT FIELD OF SEARCH
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(179, 215, 210, 210),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      hintText: 'Search Something',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: ListView.separated(
          itemCount: myToDoListMessages.length,
          itemBuilder: (_, item) {
            return toDoItem(
              title: myToDoListMessages[item]['tiltle'],
              textDetails: myToDoListMessages[item]['textDetails'],
              time: myToDoListMessages[item]['time'],
              condtionOfColorCircleAvatar: myToDoListMessages[item]['condtionOfColorCircleAvatar'],
              condtionOfColorCircleAvatar2: myToDoListMessages[item]['condtionOfColorCircleAvatar2'],
              avatarRed: myToDoListMessages[item]['avatarRed'],
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
    );
  }

  Widget toDoItem(
      {required String title,
      required String textDetails,
      required String time,
      required bool condtionOfColorCircleAvatar,
      required bool condtionOfColorCircleAvatar2,
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
    print(getFirstTowCharFromString(textDetails));
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          if (condtionOfColorCircleAvatar)
            CircleAvatar(
              backgroundColor: (condtionOfColorCircleAvatar)
                  ? Colors.grey
                  : const Color.fromARGB(255, 231, 174, 90),
              foregroundColor: Colors.white,
              radius: 30,
              child: Text(
                getFirstTowCharFromString(title),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          else
            CircleAvatar(
              backgroundColor: (condtionOfColorCircleAvatar2)
                  ? const Color.fromARGB(255, 98, 85, 85)
                  : const Color.fromARGB(255, 173, 173, 27),
              foregroundColor: Colors.white,
              radius: 30,
              child: Text(
                getFirstTowCharFromString(title),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  textDetails,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              if (avatarRed)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      "5",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
