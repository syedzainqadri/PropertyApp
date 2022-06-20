import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/chat_controller.dart';

import '../Utils/color_scheme.dart';
import 'chat_ui.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({Key? key}) : super(key: key);

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: chatController.allChats.length,
        itemBuilder: (context, index) {
          return chat(
              chatController.allChats.value[index].listing!.images![0].src
                  .toString(),
              chatController.allChats.value[index].listing!.title.toString(),
              chatController.allChats.value[index].lastMessage.toString(),
              chatController.allChats.value[index].listingId.toString());
        },
      );
    });
  }

  chat(image, name, message, listingId) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, bottom: 16),
      child: GestureDetector(
        onTap: () {
          Get.to(ChatUi(
            title: name,
            listingId: int.parse(listingId),
          ));
          chatController.getAllMessages(listingId);
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
                    image: NetworkImage(image),
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
}
