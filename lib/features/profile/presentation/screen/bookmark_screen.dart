import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_appbar.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/core/utils/constants/icon_path.dart';
import 'package:practics/features/profile/controller/bookmark_controller.dart';


class BookmarkScreen extends StatelessWidget {
  BookmarkScreen({super.key});
  final controller = Get.put(BookmarkController());
  final RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackGround,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppbar(
                  title: "Bookmark",
                  trailing: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                SizedBox(height: 10.h),
                _postCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _postCard() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,

      physics: NeverScrollableScrollPhysics(),

      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.containerBorder, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              // Date
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "Monday, August 4",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 8.h),
              // Title
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text:
                      "When You Feel like you're falling apart, God is holding the pieces.",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 4.h),

              Align(
                alignment: Alignment.centerLeft,
                child: Obx(
                  () => CustomText(
                    text: isExpanded.value
                        ? "This message reminds us that God doesn't always fix situations, but often strengthens us through them. It's about inner resilience and grace." // full text
                        : "",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "— Anonymous",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Obx(
                      () => GestureDetector(
                        onTap: () => isExpanded.value = !isExpanded.value,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomText(
                              text: isExpanded.value
                                  ? "Read Less"
                                  : "Read More",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                            SizedBox(width: 4.w),
                            Icon(
                              isExpanded.value
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: AppColors.primary,
                              size: 18.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),
              Divider(color: AppColors.secondary),
              SizedBox(height: 12.h),
              // Footer actions: Save, Like, Share
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(IconPath.bookmark, height: 24.h, width: 24.w),
                      SizedBox(width: 6),
                      CustomText(text: "Save"),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => GestureDetector(
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
                              CustomText(
                                text: "Like",
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        IconPath.shareIcon,
                        height: 24.h,
                        width: 24.w,
                      ),
                      SizedBox(width: 6),
                      CustomText(text: "Share"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.h),
            ],
          ),
        );
      },
    );
  }
}
