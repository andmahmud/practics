import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/core/utils/constants/icon_path.dart';
import 'package:practics/features/home/controller/home_controller.dart';
import 'package:practics/routes/app_routes.dart';

import 'comment_bottom_sheet.dart';

class PostCard extends StatelessWidget {
  final String profileImage;
  final String name;
  final String timeAgo;
  final String title;
  final String content;
  final List<String> tags;

  PostCard({super.key, 
    required this.profileImage,
    required this.name,
    required this.timeAgo,
    required this.title,
    required this.content,
    required this.tags,
  });

  final  controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header Row
          GestureDetector(
            onTap: ()=> Get.toNamed(AppRoute.profileViewScreen),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileImage),
                  radius: 30,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: name,fontWeight: FontWeight.w600,fontSize: 16.sp),
                      CustomText(text: timeAgo,fontSize: 12.sp),
            
                    ],
                  ),
                ),
                Icon(Icons.more_horiz),
              ],
            ),
          ),
          SizedBox(height: 10),

          /// Title
          CustomText(text: title,fontWeight: FontWeight.w600),
          SizedBox(height: 8.h),

          /// Content
          CustomText(text: content,color: AppColors.textSecondary),
          SizedBox(height: 16.h),

          /// Tags
          Wrap(
            spacing: 8,
            children: tags
                .map((tag) => Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              decoration: BoxDecoration(
                color: Color(0xffFFF5E5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomText(text: tag,color: Color(0xffC9A100))
            ))
                .toList(),
          ),
          SizedBox(height: 14.h),

          /// Like, Comment, Share Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => GestureDetector(
                onTap: controller.toggleLike,
                child: Row(
                  children: [
                    Icon(
                      controller.isLiked.value
                          ? Icons.thumb_up
                          : Icons.thumb_up_outlined,
                      color: controller.isLiked.value
                          ? Colors.blue
                          : Colors.grey,
                      size: 24,
                    ),
                    SizedBox(width: 4),
                    CustomText(text: "${controller.likeCount.value}",fontWeight: FontWeight.w500)
                  ],
                ),
              )),

              /// Comment
              Obx(() => Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        CommentBottomSheet(),
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(IconPath.messageIcon,height: 24.h,width: 24.w),
                        SizedBox(width: 6),
                        Text("${controller.comments.length}",
                            style: TextStyle(fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
              )),


              /// Share
              Row(
                children: [
                  Image.asset(IconPath.shareIcon,height: 24.h,width: 24.w),
                  SizedBox(width: 6.w),
                  CustomText(text: 'Share',fontWeight: FontWeight.w500),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
