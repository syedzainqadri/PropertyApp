import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/color_scheme.dart';
import 'chat_ui.dart';

class ConversationPage extends StatefulWidget{
  const ConversationPage({Key? key}) : super(key: key);

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 15,),
          chat('1', 'Donald Trump', 'I am interested 😍 in your property'),
          chat('9', 'Muhammad Ali', 'The Land looks good 😍😍😍'),
          chat('7', 'Marilyn Monroe', 'I am near by 😇😇'),
          chat('6', 'Abraham Lincoln', 'Kindly text me your email😎😎'),
          chat('8', 'John Kenedy', 'We will arive soon'),
          chat('2', 'Nelson Mandela', 'I have seen your property😄'),
          chat('4', 'Dwayne Johnson', 'We may visit tomorrow 😄😄'),
          chat('3', 'Einstein', 'Your garage is not available🤓🤓'),
          chat('5', 'Newton', 'We are outside 😬😬'),
          chat('7', 'Elon Musk', 'Pick up the phone😡😡'),
          chat('6', 'Jeff Bezos', 'It looks expensive, Whats final price'),
          chat('8', 'Bill Gates', 'I will let you in Shortly🥺'),
          chat('2', 'MBS', 'Park the car behind the tree🤡'),
      ],),
    );
  }
}
chat(image, name, message) {
  return Padding(
    padding: const EdgeInsets.only(left:12.0,bottom: 16),
    child: GestureDetector(
      onTap: () {
        //Get.to(ChatUi(title: name,image: image));
      },
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/$image.png'),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                const SizedBox(
                  height: 6,
                ),
                Text(
                  name,
                  style: const TextStyle(fontSize: 18, color: darkGrey),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: SizedBox(
                    width: 270,
                    child: Text(
                      message,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 16,
                          color: mediumGrey,
                          overflow: TextOverflow.clip),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
