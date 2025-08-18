import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_appbar.dart';
import 'package:practics/core/common/widgets/custom_button.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/common/widgets/custom_textformfield.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/features/profile/controller/create_group_controller.dart';


class CreateGroupScreen extends StatelessWidget {
  CreateGroupScreen({super.key});
  final controller = Get.put(CreateGroupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackGround,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomAppbar(
                trailing: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              SizedBox(height: 32.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "Create Your Group",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "Create account and enjoy all services",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 30.h),
              CustomTextField(
                prefixIcon: Icon(Icons.person, color: AppColors.textSecondary),
                controller: controller.groupNameController,
                hintText: "Group Name",
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                prefixIcon: Icon(
                  Icons.location_on,
                  color: AppColors.textSecondary,
                ),
                controller: controller.addressController,
                hintText: "Address",
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                prefixIcon: Icon(
                  Icons.location_city_outlined,
                  color: AppColors.textSecondary,
                ),
                controller: controller.cityController,
                hintText: "City",
              ),
              SizedBox(height: 30.h),
              CustomButton(text: "Done", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
