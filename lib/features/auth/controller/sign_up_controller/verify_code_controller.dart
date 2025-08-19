import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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

class VerifyCodeController extends GetxController {
  final otpText = TextEditingController();

  RxInt remainingSeconds = 60.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    final emailArg = Get.arguments;
    startTimer(email: emailArg);
  }

  void startTimer({required String email}) {
    _timer?.cancel();
    remainingSeconds.value = 43;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
      } else {
        timer.cancel();
      }
    });
  }

  String get formattedTime {
    final minutes = (remainingSeconds ~/ 60).toString().padLeft(1, '0');
    final seconds = (remainingSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  Future<void> verifyOtp(String? email) async {
    if (kDebugMode) {
      print("Sending OTP verification for email: '$email'");
    }
    int otp = int.tryParse(otpText.text.trim()) ?? -1;

    if (otp < 0) {
      EasyLoading.showError("invalid otp please enter a valid number");

      return;
    }

    try {
      EasyLoading.show(status: "loading".tr);
      final responseBody = {"email": email, "otp": otpText.text.trim()};

      final response = await NetworkCaller().postRequest(
        AppUrls.verifyotp,
        body: responseBody,
        token: StorageService().getData("toker"),
      );
      if (kDebugMode) {
        print("API Request Data: $responseBody");
      }
      if (response.statusCode == 200) {
        EasyLoading.showSuccess("OTP verified successfully.");
        _timer?.cancel();
        _verifySuccessPopUp();
      } else {
        EasyLoading.showError("failed to verify otp");
      }
    } catch (e) {
      log("Unexpected error: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> resentOtp(String email) async {
    try {
      EasyLoading.show(status: "Resent OTP.............");

      final requestBody = {"email": email};

      final response = await NetworkCaller().postRequest(
        AppUrls.resentotp,
        body: requestBody,
        token: StorageService().getData("token"),
      );

      if (response.statusCode == 200) {
        otpText.clear();
        EasyLoading.showSuccess("New OTP sent to your email.");
        startTimer(email: email);
      } else {
        EasyLoading.showError("Failed to resend OTP.");
      }
    } catch (e) {
      log("Resend OTP error: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }

  void _verifySuccessPopUp() {
    showDialog(
      context: Get.context!, // Or pass context if you're not using GetX
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.primaryBackGround,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(IconPath.successIcon, height: 120.h),
              SizedBox(height: 24.h),
              CustomText(
                text: 'Account  verified Successfully',
                textAlign: TextAlign.center,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 24.h),
              CustomButton(
                text: 'Go to Login',
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
