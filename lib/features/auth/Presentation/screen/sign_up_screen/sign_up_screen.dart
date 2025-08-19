import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/core/utils/constants/icon_path.dart';
import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../core/common/widgets/custom_rich_text.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../routes/app_routes.dart';
import '../../../controller/sign_up_controller/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final controller = Get.put(SignUPController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Create Your Account',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: "Create account and enjoy all services",
                  fontSize: 16.sp,
                  color: AppColors.textSecondary,
                ),
                SizedBox(height: 32.h),
                CustomText(
                  text: "Full Name",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),

                SizedBox(height: 6.h),
                CustomTextField(
                  prefixIcon: Icon(Icons.person_2_outlined),
                  controller: controller.nameText,
                  hintText: 'Enter your full name',
                ),
                SizedBox(height: 15.h),

                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "Family Name",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  prefixIcon: Icon(Icons.person_outline),
                  controller: controller.familyNameText,
                  hintText: 'Enter your family name',
                ),
                SizedBox(height: 15.h),
                CustomText(
                  text: "Email Address",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),

                SizedBox(height: 6.h),
                CustomTextField(
                  prefixIcon: Icon(Icons.email_outlined),
                  controller: controller.emailText,
                  hintText: 'Enter your email address',
                ),
                SizedBox(height: 15.h),
                CustomText(
                  text: " User Name",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),

                SizedBox(height: 6.h),
                CustomTextField(
                  prefixIcon: Icon(Icons.person),
                  controller: controller.userNameText,
                  hintText: 'Enter your User Name',
                ),

                SizedBox(height: 15.h),

                CustomText(
                  text: " Password",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),

                SizedBox(height: 6.h),
                Obx(() {
                  return CustomTextField(
                    hintText: ' Password',
                    controller: controller.passText,
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
                CustomButton(
                  text: 'Register',
                  onTap: () {
                    controller.register();
                  },
                ),
                SizedBox(height: 30.h),
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
                    CustomText(text: ' Or Register with '),
                    Flexible(
                      child: Divider(
                        thickness: 1,
                        color: Color(0xffE5E7EC),
                        height: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
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
                SizedBox(height: 30.h),
                CustomRichText(
                  normalText: 'Don’t have an account? ',
                  tappableText: ' Log in',
                  onTap: () {
                    Get.toNamed(AppRoute.loginScreen);
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
