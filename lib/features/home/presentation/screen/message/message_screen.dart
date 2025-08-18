import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_appbar.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/common/widgets/custom_textformfield.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/features/home/controller/message/message_controller.dart';
import 'package:practics/features/home/presentation/screen/message/chat_screen.dart';


class MessagesScreen extends StatelessWidget {
  MessagesScreen({super.key});

  final String myAvatarUrl = "https://randomuser.me/api/portraits/men/99.jpg";
  final controller = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackGround,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomAppbar(
                title: "Messages",
                trailing: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),

              CustomTextField(
                controller: controller.search,
                hintText: "Search",
                prefixIcon: Icon(Icons.search, color: AppColors.textSecondary),
              ),
              SizedBox(height: 10.h),
              SingleChildScrollView(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: controller.messageThreads.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var thread = controller.messageThreads[index];
                      return Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 4,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(
                                  thread["avatar"] as String,
                                ),
                              ),
                              if ((thread["unread"] as int) > 0)
                                Positioned(
                                  right: -2,
                                  top: -2,
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: CustomText(
                                      text: "${thread["unread"]}",
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: thread["name"] as String,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                              CustomText(
                                text: thread["time"] as String,
                                fontSize: 12,
                                color: Colors.grey[500],
                              ),
                            ],
                          ),
                          subtitle: CustomText(
                            text: thread["lastMessage"] as String,
                            color: Colors.grey[600],
                            fontSize: 14.sp,
                            maxLines: 1,
                          ),

                          onTap: () {
                            Get.to(
                              () => ChatScreen(
                                name: (thread["name"] as String?) ?? "Unknown",
                                avatar:
                                    (thread["avatar"] as String?) ??
                                    "https://example.com/default_avatar.png",
                                myAvatar: myAvatarUrl,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
