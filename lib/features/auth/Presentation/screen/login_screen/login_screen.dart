import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../core/common/widgets/custom_rich_text.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/icon_path.dart';
import '../../../../../routes/app_routes.dart';
import '../../../controller/login_controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                CustomText(
                  text: 'Welcome Back',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 6.h),
                CustomText(text: 'Please enter your details'),

                SizedBox(height: 32.h),
                CustomText(
                  text: 'Email',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  controller: controller.emailText,
                  hintText: 'Enter your email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!GetUtils.isEmail(value.trim())) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                SizedBox(height: 20.h),
                CustomText(
                  text: 'Password',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 6.h),
                Obx(() {
                  return CustomTextField(
                    controller: controller.passText,
                    hintText: 'Enter your password',
                    obscureText: controller.obSecureText.value,
                    prefixIcon: Icon(Icons.lock_outline),
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
                SizedBox(height: 12.h),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.forgetPasswordScreen);
                    },
                    child: CustomText(
                      text: 'Forgot password?',
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                CustomButton(
                  text: 'Log in',
                  onTap: () {
                    controller.login();
                  },
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Divider(
                        thickness: 1,
                        color: Color(0xffE5E7EC),
                        height: 2,
                      ),
                    ),
                    CustomText(text: ' Or login with '),
                    Flexible(
                      child: Divider(
                        thickness: 1,
                        color: Color(0xffE5E7EC),
                        height: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: AppColors.containerBorder,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            IconPath.googleIcon,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.h),
                    Flexible(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: AppColors.containerBorder,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            IconPath.appleIcon,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60.h),
                CustomRichText(
                  normalText: 'Don’t have an account? ',
                  tappableText: ' Register',
                  onTap: () {
                    Get.toNamed(AppRoute.signUpScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
