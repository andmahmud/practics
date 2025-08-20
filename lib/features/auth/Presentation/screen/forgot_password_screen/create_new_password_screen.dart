import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import '../../../../../../core/common/widgets/custom_appbar.dart';
import '../../../../../../core/common/widgets/custom_text.dart';
import '../../../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/common/widgets/custom_button.dart';
import '../../../controller/forgot_password_controller/create_new_password_controller.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({super.key});
  final String? email = Get.arguments;

  final controller = Get.put(CreateNewPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppbar(
                centerTitle: true,
                trailing: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: 'Create New Password',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4.h),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  fontSize: 14,
                  text:
                      'Your password must be different from  \n         previous used password',
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 24.h),
              Obx(() {
                return CustomTextField(
                  hintText: 'New Password',
                  controller: controller.newPassText,
                  obscureText: controller.obSecureText.value,
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  suffixIcon: GestureDetector(
                    onTap: () => controller.obSecureText.value =
                        !controller.obSecureText.value,
                    child: controller.obSecureText.value
                        ? Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.grey,
                          )
                        : Icon(Icons.visibility_outlined, color: Colors.grey),
                  ),
                );
              }),
              SizedBox(height: 24.h),
              Obx(() {
                return CustomTextField(
                  hintText: 'Confirm password',
                  controller: controller.confirmPassText,
                  obscureText: controller.obSecureText2.value,
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  suffixIcon: GestureDetector(
                    onTap: () => controller.obSecureText2.value =
                        !controller.obSecureText2.value,
                    child: controller.obSecureText2.value
                        ? Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.grey,
                          )
                        : Icon(Icons.visibility_outlined, color: Colors.grey),
                  ),
                );
              }),

              SizedBox(height: 30.h),
              CustomButton(
                text: 'Reset Password',
                onTap: () {
                  controller.resetPassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
