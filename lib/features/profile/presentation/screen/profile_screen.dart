import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_button.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/core/utils/constants/icon_path.dart';
import 'package:practics/core/utils/constants/image_path.dart';
import 'package:practics/features/profile/presentation/screen/about_screen.dart';
import 'package:practics/features/profile/presentation/screen/bookmark_screen.dart';
import 'package:practics/features/profile/presentation/screen/church_community_select.dart';
import 'package:practics/features/profile/presentation/screen/friends/friends_screen.dart';
import 'package:practics/features/profile/presentation/screen/language_screen.dart';
import 'package:practics/features/profile/presentation/screen/mypost_screen.dart';
import 'package:practics/features/profile/presentation/screen/privacy_setting_screen.dart';
import 'package:practics/features/profile/presentation/screen/profile_edit_screen.dart';
import 'package:practics/features/profile/presentation/screen/your_groups_screen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackGround,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 5.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.containerBorder,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(ImagePath.image),
                          ),
                          CustomText(
                            text: "Michael Chen",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            IconPath.switchicon,
                            height: 32.h,
                            width: 32.w,
                          ),
                          SizedBox(width: 10.w),
                          Image.asset(
                            IconPath.arrowdown,
                            height: 32.h,
                            width: 32.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(ImagePath.image),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                CustomText(
                  text: "Michael Chen",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 20.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => MypostScreen());
                      },
                      child: Column(
                        children: [
                          CustomText(
                            text: "Posts",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary,
                          ),
                          SizedBox(height: 8.h), // height, not width
                          CustomText(
                            text: "10",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),

                    // Vertical Divider
                    Container(width: 1, height: 50.h, color: Colors.grey),

                    GestureDetector(
                      onTap: () {
                        Get.to(() => BookmarkScreen());
                      },
                      child: Column(
                        children: [
                          CustomText(
                            text: "Bookmarks",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary,
                          ),
                          SizedBox(height: 8.h),
                          CustomText(
                            text: "20",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                    // Vertical Divider
                    Container(width: 1, height: 50.h, color: Colors.grey),

                    GestureDetector(
                      onTap: () {
                        Get.to(() => FriendsScreen());
                      },
                      child: Column(
                        children: [
                          CustomText(
                            text: "Friends",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary,
                          ),
                          SizedBox(height: 8.h),
                          CustomText(
                            text: "210",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Divider(),
                SizedBox(height: 20.h),

                GestureDetector(
                  onTap: () {
                    Get.to(() => ProfileEditScreen());
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        color: AppColors.textPrimary,
                        IconPath.profileIcon,
                        height: 24.h,
                        width: 24.w,
                      ),
                      SizedBox(width: 10.w),
                      CustomText(
                        text: "Edit profile",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    Get.to(() => ChurchCommunitySelect());
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        IconPath.church,
                        height: 24.h,
                        width: 24.w,
                        color: AppColors.textPrimary,
                      ),
                      SizedBox(width: 10.w),
                      CustomText(
                        text: "Church Community",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    Get.to(() => YourGroupsScreen());
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        IconPath.group,
                        height: 24.h,
                        width: 24.w,
                        color: AppColors.textPrimary,
                      ),
                      SizedBox(width: 10.w),
                      CustomText(
                        text: "Group",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    Get.to(() => ChurchCommunitySelect());
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        IconPath.church,
                        height: 24.h,
                        width: 24.w,
                        color: AppColors.textPrimary,
                      ),
                      SizedBox(width: 10.w),
                      CustomText(
                        text: "Create Church",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    Get.to(() => PrivacySettingScreen());
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        IconPath.privacy,
                        height: 24.h,
                        width: 24.w,
                        color: AppColors.textPrimary,
                      ),
                      SizedBox(width: 10.w),
                      CustomText(
                        text: "Privacy Settings",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    Get.to(() => LanguageScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            IconPath.document,
                            height: 24.h,
                            width: 24.w,
                            color: AppColors.textPrimary,
                          ),
                          SizedBox(width: 10.w),
                          CustomText(
                            text: "Language",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          CustomText(
                            text: "English (US)",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => LanguageScreen());
                            },
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    Get.to(() => AboutScreen());
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        IconPath.profileIcon,
                        height: 24.h,
                        width: 24.w,
                        color: AppColors.textPrimary,
                      ),
                      SizedBox(width: 10.w),
                      CustomText(
                        text: "About Me",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    showLogoutBottomSheet(context);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        IconPath.logout,
                        height: 24.h,
                        width: 24.w,
                        color: AppColors.textPrimary,
                      ),
                      SizedBox(width: 10.w),
                      CustomText(
                        text: "Logout",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.primaryBackGround,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.h),
              CustomText(
                text: "Logout",
                fontSize: 25,
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 15.h),
              CustomText(
                text: "Are you sure you want to log out?",
                textAlign: TextAlign.center,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      onTap: () => Get.back(),
                      color: Color(0xffFFF9EE),
                      text: "Cancel",
                      textColor: Color(0xffC9A100),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomButton(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      onTap: () {},
                      text: "Yes, Logout",
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25.h),
            ],
          ),
        );
      },
    );
  }
}
