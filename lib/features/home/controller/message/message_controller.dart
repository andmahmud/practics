import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  final search = TextEditingController();
  var messageThreads = [
    {
      "name": "John Smith",
      "avatar": "https://randomuser.me/api/portraits/men/1.jpg",
      "myAvatar": "https://randomuser.me/api/portraits/men/99.jpg",
      "lastMessage": "Great job in today’s lesson! Keep...",
      "time": "2 min ago",
      "unread": 2,
    },
    {
      "name": "Sam Johnson",
      "avatar": "https://randomuser.me/api/portraits/men/2.jpg",
      "myAvatar": "https://randomuser.me/api/portraits/men/99.jpg",
      "lastMessage": "Don’t forget to bring your learner...",
      "time": "1 hour ago",
      "unread": 0,
    },
    {
      "name": "Mike Wilson",
      "avatar": "https://randomuser.me/api/portraits/men/3.jpg",
      "myAvatar": "https://randomuser.me/api/portraits/men/99.jpg",
      "lastMessage": "The highway driving lesson went...",
      "time": "Yesterday",
      "unread": 1,
    },
  ].obs;
}
