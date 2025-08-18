import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import '../../../../../../core/common/widgets/custom_appbar.dart';
import '../../../../../../core/common/widgets/custom_text.dart';
import '../../../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../routes/app_routes.dart';
import '../../../controller/forgot_password_controller/forgot_password_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

   final controller = Get.put(ForgotPasswordController());

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
                title: "Forgot Password?",
                centerTitle: true,
                trailing: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: 'Forgot Password?',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 4.h),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text:
                  'Enter your email, we will send a verification \n                     code to your email',
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 32.h),
              CustomTextField(
                prefixIcon: Icon(Icons.email_outlined),
                controller: controller.emailText,
                hintText: 'hello@rafiislam',
              ),
              SizedBox(height: 32.h),
              CustomButton(
                text: 'Send Code',
                onTap: () {
                  Get.toNamed(AppRoute.forgotVerifyCodeScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
