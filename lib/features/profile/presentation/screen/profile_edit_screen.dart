import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_appbar.dart';
import 'package:practics/core/common/widgets/custom_button.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/common/widgets/custom_textformfield.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/core/utils/constants/image_path.dart';
import 'package:practics/features/profile/controller/profile_edit_conroller.dart';


class ProfileEditScreen extends StatelessWidget {
  ProfileEditScreen({super.key});
  final controller = Get.put(ProfileEditConroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackGround,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomAppbar(
                  title: "Profile Edit",
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
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "First Name",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  controller: controller.firstName,
                  hintText: "Michael",
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "Last Name",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  controller: controller.lasttName,
                  hintText: "Chen",
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "Date of birth",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  controller: controller.birthdate,
                  hintText: "08-09-1952",
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "Gender",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                CustomTextField(controller: controller.gander, hintText: "Man"),
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
                CustomTextField(controller: controller.city, hintText: "USA"),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "Email",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  controller: controller.email,
                  hintText: "email@gmail.com",
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "Religion",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  controller: controller.religion,
                  hintText: "Christian",
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "Church",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  controller: controller.church,
                  hintText: "Grace Community Church",
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "About Me",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.h,
                    vertical: 12.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.containerBorder,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      CustomText(
                        color: AppColors.textSecondary,
                        fontSize: 14.sp,
                        text:
                            "I’m a person who values faith, personal growth, and the power of community. My journey in faith has been a continuous learning experience, and I believe every.....",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                CustomButton(text: "save", onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
