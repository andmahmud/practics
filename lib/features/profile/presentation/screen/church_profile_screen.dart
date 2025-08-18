import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_appbar.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/core/utils/constants/image_path.dart';
import 'package:practics/features/profile/presentation/screen/community_members_screen.dart';

class ChurchProfileScreen extends StatelessWidget {
  const ChurchProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackGround,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomAppbar(
                title: "Profile",
                trailing: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back),
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
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "Church Name",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "Nieuwe Kerk",
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "Address",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "Groningen, Nederland",
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "City",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "Groningen",
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "Website",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "www.michael.com",
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "Community Members",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => CommunityMembersScreen());
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "See all members",
                    color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
