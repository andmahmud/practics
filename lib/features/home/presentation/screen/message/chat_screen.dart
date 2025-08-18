import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_chat_appbar.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/common/widgets/custom_textformfield.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/features/home/controller/message/chat_controller.dart';


class ChatScreen extends StatelessWidget {
  final String name;
  final String avatar;
  final String myAvatar;

  final textController = TextEditingController();
  final controller = Get.put(ChatController());
  ChatScreen({
    super.key,
    required this.name,
    required this.avatar,
    required this.myAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackGround,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              CustomChatAppbar(
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                centerTitle: false,
                customTitleWidget: Row(
                  children: [
                    CircleAvatar(backgroundImage: NetworkImage(avatar)),
                    SizedBox(width: 10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: name,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                        CustomText(
                          text: "Online",
                          fontSize: 12,
                          color: Colors.greenAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: controller.chatMessages.length,
                    itemBuilder: (context, index) {
                      var msg = controller.chatMessages[index];
                      bool isMe = msg["isMe"] as bool;

                      return Align(
                        alignment: isMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (!isMe)
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundImage: NetworkImage(avatar),
                                ),
                              ),
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 14,
                                ),
                                decoration: BoxDecoration(
                                  color: isMe
                                      ? AppColors.secondary
                                      : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CustomText(
                                      text: msg["message"] as String,
                                      color: isMe ? Colors.black : Colors.black,
                                    ),
                                    SizedBox(height: 4.h),
                                    CustomText(
                                      text: msg["time"] as String,
                                      fontSize: 10,
                                      color: isMe ? Colors.black : Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (isMe)
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundImage: NetworkImage(myAvatar),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
              Container(
                padding: EdgeInsets.all(8),

                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: controller.textController,
                        hintText: "Type here...",
                      ),
                    ),
                    SizedBox(width: 8.w),
                    IconButton(
                      icon: Icon(Icons.send, color: AppColors.primary),
                      onPressed: () {
                        if (textController.text.trim().isNotEmpty) {
                          controller.chatMessages.add({
                            "isMe": true,
                            "message": textController.text.trim(),
                            "time": "Now",
                          });
                          textController.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
