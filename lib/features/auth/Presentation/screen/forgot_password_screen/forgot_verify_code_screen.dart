import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import '../../../../../core/common/widgets/custom_appbar.dart';
import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../core/common/widgets/custom_rich_text.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';

import '../../../controller/forgot_password_controller/forgot_verify_code_controller.dart';

class ForgotVerifyCodeScreen extends StatelessWidget {
  ForgotVerifyCodeScreen({super.key});
  final String? email = Get.arguments;

  final controller = Get.put(ForgotVerifyCodeController());

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
                      'Enter the verification code that we have sent \n                         to your email',
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 24.h),
              Align(
                alignment: Alignment.center,
                child: Pinput(
                  length: 6,
                  controller: controller.otpText,
                  defaultPinTheme: PinTheme(
                    width: 48.w,
                    height: 48.h,
                    textStyle: TextStyle(
                      fontSize: 24,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(
                        color: AppColors.containerBorder,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  submittedPinTheme: PinTheme(
                    width: 48.w,
                    height: 48.h,
                    textStyle: TextStyle(
                      fontSize: 24,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  separatorBuilder: (index) => SizedBox(width: 24),
                ),
              ),
              SizedBox(height: 40.h),
              CustomButton(
                text: 'Continue',
                onTap: () {
                    controller.verifyOtp(email ?? '');
                },
              ),
              SizedBox(height: 24.h),
              Obx(() {
                final canResend = controller.remainingSeconds.value == 0;

                return CustomRichText(
                  normalText: canResend
                      ? "Didn't get code? "
                      : "Re-send code in: ",
                  tappableText: canResend ? "Resend" : controller.formattedTime,
                  onTap: canResend
                      ? () {
                          controller.resendOtp(email ?? "");
                        }
                      : null, // Disable tap when countdown running
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
