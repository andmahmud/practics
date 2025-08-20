import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../core/services/Auth_service.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/utils/constants/app_urls.dart';
import '../../Presentation/screen/forgot_password_screen/create_new_password_screen.dart';

class ForgotVerifyCodeController extends GetxController {
  final otpText = TextEditingController();

  RxInt remainingSeconds = 30.obs;
  Timer? _timer;

  late final String email; // always non-null after init

  @override
  void onInit() {
    super.onInit();
    email = (Get.arguments ?? "") as String; // default empty string if null
    if (email.isNotEmpty) {
      startTimer(email: email);
    }
  }

  void startTimer({required String email}) {
    _timer?.cancel();
    remainingSeconds.value = 30;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
    if (email == null || email.isEmpty) {
      EasyLoading.showError("Email not provided");
      return;
    }

    final otp = otpText.text.trim();
    if (otp.isEmpty || otp.length < 6) {
      EasyLoading.showError("Invalid OTP. Please enter a valid number");
      return;
    }

    try {
      EasyLoading.show(status: "Verifying OTP...");

      final requestBody = {"email": email, "otp": otp};

      debugPrint("Request Body : $requestBody");

      final response = await NetworkCaller().postRequest(
        AppUrls.forgetverifyotp,
        body: requestBody,
        token: StorageService().getData('token'),
      );

      log("Response Status Code: ${response.statusCode}");
      log("Response Body: ${response.responseData}");

      if (response.isSuccess) {
        final token = response.responseData["data"]["reset_token"];
        log("Reset token : $token");
        StorageService().saveData('token', token);

        EasyLoading.showSuccess("OTP verified successfully.");
        _timer?.cancel();
        remainingSeconds.value = 0;
        Get.off(() => CreateNewPasswordScreen(), arguments: email);
      } else {
        EasyLoading.showError("Failed to verify OTP");
      }
    } catch (e) {
      log("Unexpected error: $e");
      EasyLoading.showError("Something went wrong");
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> resendOtp(String email) async {
    if (email.isEmpty) {
      EasyLoading.showError("Email not provided");
      return;
    }
    try {
      EasyLoading.show(status: "Resending OTP...");

      final requestBody = {"email": email};

      final response = await NetworkCaller().postRequest(
        AppUrls.forgetPassword,
        body: requestBody,
        token: StorageService().getData('token'),
      );

      if (response.statusCode == 200) {
        EasyLoading.showSuccess("New OTP sent to your email.");
        otpText.clear();
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
}
