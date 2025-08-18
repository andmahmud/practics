import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final TextEditingController textController = TextEditingController();
  var chatMessages = [
    {
      "isMe": true,
      "message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "time": "09:21 am",
    },
    {
      "isMe": false,
      "message":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
      "time": "09:22 am",
    },
    {
      "isMe": true,
      "message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "time": "09:24 am",
    },
    {
      "isMe": false,
      "message": "Exercitation veniam consequat sunt nostrud amet.",
      "time": "09:25 am",
    },
  ].obs;
}
