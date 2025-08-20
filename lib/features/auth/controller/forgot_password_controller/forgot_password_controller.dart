import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:practics/core/services/Auth_service.dart';
import 'package:practics/core/services/network_caller.dart';
import 'package:practics/core/utils/constants/app_urls.dart';
import 'package:practics/routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  final emailText = TextEditingController();

  Future<void> forgetpassword() async {
    EasyLoading.show(status: "Loading".tr);
    String email = emailText.text.trim();
    if(kDebugMode){
      print("Email: $email");
    }
      if (email.isEmpty) {
      EasyLoading.showError("please_enter_your_email".tr);
      return;
    }
        try {
      final requestBody = {"email": emailText.text.trim()};

      final response = await NetworkCaller().postRequest(
        AppUrls.forgetPassword,
        body: requestBody,
        token: StorageService().getData('token'),
      );

      log("Response Status Code: ${response.statusCode}");

      if (response.isSuccess) {
        Get.toNamed(AppRoute.forgotVerifyCodeScreen, arguments: email);
      } else {
        if (kDebugMode) {
          print("Error: $requestBody");
        }

        EasyLoading.showError("failed_to_reset_password".tr);
      }
    } catch (e) {
      log("Unexpected error: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
