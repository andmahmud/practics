import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/core/utils/constants/image_path.dart';
import 'package:practics/features/profile/presentation/screen/create_group_screen.dart';


class YourGroupsScreen extends StatelessWidget {
  const YourGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryBackGround,
        title: CustomText(
          text: "Your Groups",
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => CreateGroupScreen());
                },
                child: CustomText(
                  color: AppColors.primary,
                  text: "Create Group",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.primaryBackGround,
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.h),
        itemCount: 20,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          ImagePath.image,
                          height: 48,
                          width: 48,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Catholic Believers",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomText(
                            text: "25+ new posts",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textSecondary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
