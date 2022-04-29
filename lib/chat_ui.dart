import 'package:chat_composer/chat_composer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color_scheme.dart';

class ChatUi extends StatefulWidget {
  final String title,image;
  const ChatUi({Key? key, required this.title, required this.image}) : super(key: key);

  @override
  State<ChatUi> createState() => _ChatUiState();
}

class _ChatUiState extends State<ChatUi> {
  List<Widget> list = [];
  TextEditingController con = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: lightGreen,
          title: Text(widget.title),
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.navigate_before, size: 35, color: white)),
              actions: [
                Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: mediumGrey,
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/${widget.image}.png'),
              ),
            ),
          ),
        ),
              ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, pos) {
                    return list[pos];
                  }),
            ),
            ChatComposer(
              controller: con,
              onReceiveText: (str) {
                setState(() {
                  list.add(sentMessage(str.toString()));
                  list.add(recieveMessage(str.toString()));
                  con.text = '';
                });
              },
              onRecordEnd: (path) {
                setState(() {
                  //  list.add('AUDIO PATH : ' + path!);
                });
              },
              textPadding: EdgeInsets.zero,
              leading: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(
                  Icons.insert_emoticon_outlined,
                  size: 25,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
              actions: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    Icons.attach_file_rounded,
                    size: 25,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    size: 25,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  sentMessage(message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(width: 10,),
        Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 250),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            
          color: lightGreen,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              message,
              style: const TextStyle(color: white,fontSize: 17),
            ),
          ),
        ),
      ),
    )
      ],
    );
  }
  
  recieveMessage(message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 10,),
        Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 250),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            
          color: lightGrey,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              message,
              style: const TextStyle(color: darkGrey,fontSize: 17),
            ),
          ),
        ),
      ),
    )
      ],
    );
  }
}

