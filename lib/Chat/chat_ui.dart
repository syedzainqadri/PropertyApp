// ignore_for_file: invalid_use_of_protected_member

import 'package:chat_composer/chat_composer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lagosabuja/Controllers/chat_controller.dart';
import 'package:lagosabuja/Controllers/user_controller.dart';
import '../Utils/color_scheme.dart';

class ChatUi extends StatefulWidget {
  final int listingId;
  final String title;

  const ChatUi({Key? key, required this.listingId, required this.title})
      : super(key: key);

  @override
  State<ChatUi> createState() => _ChatUiState();
}

class _ChatUiState extends State<ChatUi> {
  var box = GetStorage();
  var list = [].obs;
  TextEditingController con = TextEditingController();
  final ChatController chatController = Get.put(ChatController());
  final UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    box.write('listingId', widget.listingId);
    chatController.getAllMessages();
  }

  @override
  Widget build(BuildContext context) {
    var _chatController = Get.find<ChatController>();
    return Obx(() => Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: kGreen,
            title: Text(widget.title),
            leading: GestureDetector(
                onTap: () {
                  Get.back();
                  box.remove('listingId');
                },
                child:
                    const Icon(Icons.navigate_before, size: 35, color: white)),
          ),
          body: Column(
            children: [
              chatController.messagesList.value.messages != null
                  ? Expanded(
                      child: Obx(() {
                        return ListView.builder(
                            itemCount: _chatController
                                .messagesList.value.messages!.length,
                            itemBuilder: (_, pos) {
                              var sourceId = _chatController
                                  .messagesList.value.messages![pos].sourceId;
                              var userId = userController.userModel.value.id;
                              return int.parse(sourceId!) == userId
                                  ? sentMessage(_chatController.messagesList
                                      .value.messages![pos].message)
                                  : recieveMessage(_chatController.messagesList
                                      .value.messages![pos].message);
                            });
                      }),
                    )
                  : const Expanded(child: Center(child: Text('No Messages'))),
              ChatComposer(
                recordIcon: Icons.send,
                controller: con,
                onReceiveText: (str) {
                  Get.find<ChatController>().messagesList.value.conId != null
                      ? Get.find<ChatController>().sendChatConversation(
                          widget.listingId,
                          str,
                          Get.find<ChatController>().messagesList.value.conId)
                      : Get.find<ChatController>()
                          .startChatConversation(widget.listingId, str);
                  list.value.add(sentMessage(str.toString()));
                  list.value.add(recieveMessage(str.toString()));
                  list.refresh();
                  con.text = '';
                },
                onRecordEnd: (path) {
                  setState(() {});
                },
                textPadding: const EdgeInsets.only(left: 15, right: 15),
              ),
            ],
          ),
        ));
  }

  sentMessage(message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kGreen,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  message,
                  style: const TextStyle(color: white, fontSize: 17),
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
        const SizedBox(
          width: 10,
        ),
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
                  style: const TextStyle(color: darkGrey, fontSize: 17),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
