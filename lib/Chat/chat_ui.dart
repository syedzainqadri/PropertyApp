import 'package:chat_composer/chat_composer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:realestapp/Controllers/chat_controller.dart';
import 'package:realestapp/Controllers/user_controller.dart';
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
  // Rx<List<Widget>> list = Rx<List<Widget>>[].obs;
  TextEditingController con = TextEditingController();
  final ChatController chatController = Get.put(ChatController());
  final UserController userController = Get.put(UserController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    box.write('listingId', widget.listingId);
    chatController.getAllMessages();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: no need reload the state
    var _chatController = Get.find<ChatController>();
    return Obx(() => chatController.isLoading.value != true
        ? Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              backgroundColor: lightGreen,
              title: Text(widget.title),
              leading: GestureDetector(
                  onTap: () {
                    Get.back();
                    box.remove('listingId');
                  },
                  child: const Icon(Icons.navigate_before,
                      size: 35, color: white)),
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
                                    : recieveMessage(_chatController
                                        .messagesList
                                        .value
                                        .messages![pos]
                                        .message);
                              });
                        }),
                      )
                    : const Expanded(child: Center(child: Text('No Messages'))),
                ChatComposer(
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
          )
        : const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
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
                color: lightGreen,
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
