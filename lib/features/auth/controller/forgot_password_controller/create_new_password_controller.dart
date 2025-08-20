import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_button.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/services/Auth_service.dart';
import 'package:practics/core/services/network_caller.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/core/utils/constants/app_urls.dart';
import 'package:practics/core/utils/constants/icon_path.dart';
import 'package:practics/routes/app_routes.dart';

class CreateNewPasswordController extends GetxController {
  final newPassText = TextEditingController();
  final confirmPassText = TextEditingController();

  final isNewPasswordHidden = true.obs;
  final isConPasswordHidden = true.obs;
  final RxBool obSecureText = true.obs;
  final RxBool obSecureText2 = true.obs;

  void togglePasswordVisibility() {
    isNewPasswordHidden.value = !isNewPasswordHidden.value;
  }

  void toggleConfirmPassVisibility() {
    isConPasswordHidden.value = !isConPasswordHidden.value;
  }

  Future<void> resetPassword() async {
    EasyLoading.show(status: "loading".tr);
    String newPassword = newPassText.text.trim();
    String canfirmpassword = confirmPassText.text.trim();

    if (newPassword.isEmpty) {
      EasyLoading.showToast("please_enter_a_new_password".tr);
      return;
    } else if (newPassword.length < 6) {
      EasyLoading.showToast("password_must_be_at_least_6_characters_long".tr);
      return;
    }

    if (newPassword != canfirmpassword) {
      EasyLoading.showToast("the_password_does_not_match.".tr);
      return;
    }

    try {
      final requestBody = {
        "reset_token": StorageService().getData("token"),
        "new_password": newPassText.text.trim(),
      };

      debugPrint("Request Body : $requestBody");

      final response = await NetworkCaller().postRequest(
        AppUrls.resetnewPassword,
        body: requestBody,
        token: StorageService().getData("token"),
      );

      if (response.isSuccess) {
        _verifySuccessPopUp();
      } else {
        EasyLoading.showError("failed_to_reset_password".tr);
      }
    } catch (e) {
      EasyLoading.showError("something_went_wrong".tr);
    } finally {
      EasyLoading.dismiss();
    }
  }

  void _verifySuccessPopUp() {
    showDialog(
      context: Get.context!, // Or pass context if you're not using GetX
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.scaffoldBGColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(IconPath.successIcon, height: 120.h),
              SizedBox(height: 24.h),
              CustomText(
                text: 'Password Changed',
                textAlign: TextAlign.center,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 8.h),
              CustomText(
                color: AppColors.textSecondary,
                text:
                    'Password changed successfully, you can login again with new password',
                textAlign: TextAlign.center,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 24.h),
              CustomButton(
                text: 'Back to Log in',
                onTap: () {
                  Get.toNamed(AppRoute.loginScreen);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
