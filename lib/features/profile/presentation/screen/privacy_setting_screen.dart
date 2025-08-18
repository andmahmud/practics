import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_appbar.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/core/utils/constants/icon_path.dart';
import 'package:practics/features/profile/controller/privacy_setting_controller.dart';


class PrivacySettingScreen extends StatelessWidget {
  PrivacySettingScreen({super.key});
  final controller = Get.put(PrivacySettingController());
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
                title: 'Privacy Settings',
                trailing: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),

              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        IconPath.church,
                        height: 24.h,
                        width: 24.w,
                        color: AppColors.textPrimary,
                      ),
                      SizedBox(width: 10.w),
                      CustomText(
                        text: "Findable Via Church Community",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Obx(
                    () => SizedBox(
                      height: 80.h,
                      width: 70.w,
                      child: IconButton(
                        iconSize: 60.sp,
                        icon: Icon(
                          controller.isOne.value
                              ? Icons.toggle_on
                              : Icons.toggle_off,
                          color: controller.isOne.value
                              ? AppColors.primary
                              : Colors.grey,
                        ),
                        onPressed: controller.toggleSwitchtan,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
