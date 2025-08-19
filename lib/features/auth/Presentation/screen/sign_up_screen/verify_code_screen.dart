import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
import 'package:practics/core/common/widgets/custom_appbar.dart';
import 'package:practics/core/common/widgets/custom_button.dart';
import 'package:practics/core/common/widgets/custom_rich_text.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/features/auth/controller/sign_up_controller/verify_code_controller.dart';

class VerifyCodeScreen extends StatelessWidget {
  VerifyCodeScreen({super.key});

  final controller = Get.put(VerifyCodeController());
  final String? email = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackGround,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppbar(
                centerTitle: true,
                trailing: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back),
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: 'Verification Code',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4.h),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text:
                      'Enter the verification code that we have sent \n to your email',
                  color: AppColors.textSecondary,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24.h),

              // 🔑 OTP Input
              Align(
                alignment: Alignment.center,
                child: Pinput(
                  length: 6,
                  controller: controller.otpText,
                  defaultPinTheme: PinTheme(
                    width: 48.w,
                    height: 48.h,
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.containerBorder),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  submittedPinTheme: PinTheme(
                    width: 48.w,
                    height: 48.h,
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  separatorBuilder: (index) => SizedBox(width: 24.w),
                ),
              ),
              SizedBox(height: 40.h),

              // Continue button
              CustomButton(
                text: 'Continue',
                onTap: () {
                  controller.verifyOtp(email ?? "");
                },
              ),

              SizedBox(height: 24.h),

              // 🔑 Resend OTP text
              Obx(() {
                final canResend = controller.remainingSeconds.value == 0;
                return CustomRichText(
                  normalText: canResend
                      ? "Didn't get the code? "
                      : "Re-send code in: ",
                  tappableText: canResend ? "Resend" : controller.formattedTime,
                  onTap: canResend
                      ? () => controller.resentOtp(email ?? "")
                      : null,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
