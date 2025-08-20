import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/services/Auth_service.dart';
import 'package:practics/core/services/network_caller.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/core/utils/constants/app_urls.dart';
import 'package:practics/core/utils/constants/icon_path.dart';
import 'package:practics/routes/app_routes.dart';

class LoginController extends GetxController {
  RxBool isChecked = false.obs;
  final isNewPasswordHidden = true.obs;
  final RxBool obSecureText = true.obs;

  final emailText = TextEditingController();
  final passText = TextEditingController();
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  void togglePasswordVisibility() {
    isNewPasswordHidden.value = !isNewPasswordHidden.value;
  }

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }

  Future<void> login() async {
    String email = emailText.text.trim();
    String password = passText.text.trim();

    // Clear previous errors
    emailError.value = '';
    passwordError.value = '';

    // Validation
    if (email.isEmpty) {
      emailError.value = "Please enter your email address";
      EasyLoading.showToast("Please enter your email address");
      return;
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      emailError.value = "Please enter a valid email address";
      EasyLoading.showToast("Please enter a valid email address");
      return;
    }

    if (password.isEmpty) {
      passwordError.value = "Please enter your password";
      EasyLoading.showToast("Please enter your password");
      return;
    } else if (password.length < 6) {
      passwordError.value = "Password must be at least 6 characters";
      EasyLoading.showToast("Password must be at least 6 characters");
      return;
    }

    try {
      EasyLoading.show(status: "Loading..");
      final requestBody = {"identifier": email, "password": password};

      final response = await NetworkCaller().postRequest(
        AppUrls.login,
        body: requestBody,
      );

      EasyLoading.dismiss();

      if (response.statusCode == 200) {
        // Check if response data contains the token
        if (response.responseData != null &&
            response.responseData['data'] != null &&
            response.responseData['data']['access'] != null) {
          String token = response.responseData['data']['access'];
          StorageService().saveData('token', token);
          // await AuthService.saveToken(token);

          // EasyLoading.showSuccess("Login Successful!");

          // Use offAllNamed to remove all previous routes
          // Get.offAllNamed(AppRoute.navBar);
          _verifySuccessPopUp();
        } else {
          EasyLoading.showError("Invalid response format");
        }
      } else if (response.statusCode == 404) {
        EasyLoading.showError("User not found. Please check your email.");
      } else if (response.statusCode == 308) {
        EasyLoading.showError("Your account is not verified yet");
        Get.offAllNamed(AppRoute.verifyCodeScreen, arguments: email);
      } else {
        EasyLoading.showError("Login Failed");
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError("An error occurred. Please try again.");
      debugPrint("Login error: $e");
    } finally {}
  }

  void _verifySuccessPopUp() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        Future.delayed(Duration(seconds: 2), () {
          Get.offAllNamed(AppRoute.navBar);
        });
        return AlertDialog(
          backgroundColor: AppColors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(IconPath.successIcon, height: 120.h, width: 120.w),
              SizedBox(height: 24.h),
              CustomText(
                text: 'Congratulations!',
                textAlign: TextAlign.center,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 8.h),
              CustomText(
                text: 'You have successfully logged in.',
                textAlign: TextAlign.center,
                color: AppColors.textSecondary,
              ),
              SizedBox(height: 24.h),
              SpinKitFadingCircle(color: AppColors.primary),
            ],
          ),
        );
      },
    );
  }
}
