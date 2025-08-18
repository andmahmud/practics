import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_appbar.dart';
import 'package:practics/core/common/widgets/custom_button.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';


class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(
                  title: 'Profile',
                  trailing: IconButton(
                  onPressed: (){
                    Get.back();
                  }, icon: Icon(Icons.arrow_back)),
                ),
                SizedBox(height: 32.h),
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/men/46.jpg"),
                  ),
                ),
                SizedBox(height: 32.h),
                CustomText(
                  text: 'User Name',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: 'sarah98',
                  color: AppColors.textSecondary,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: 'First Name',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: 'Sarah',
                  color: AppColors.textSecondary,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: 'Last Name',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: 'Mitchel',
                  color: AppColors.textSecondary,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: 'Church Name',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: 'Nieuwe Kerk',
                  color: AppColors.textSecondary,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: 'Religion',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: 'Christian',
                  color: AppColors.textSecondary,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: 'About',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: 'I’m a person who values faith, personal growth, and the power of community. My journey in faith has been a continuous learning experience, and I believe every day is an opportunity to deepen our connection with God and those around us. I find strength in prayer and reflection, and I’m always seeking to grow spiritually, emotionally, and intellectually.',
                  color: AppColors.textSecondary,
                ),
                SizedBox(height: 24.h),
                CustomButton(
                    text: 'Ask To Connect',
                    onTap: (){

                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
