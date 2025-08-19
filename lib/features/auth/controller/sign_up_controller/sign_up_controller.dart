import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:practics/core/services/Auth_service.dart';
import 'package:practics/core/services/network_caller.dart';
import 'package:practics/core/utils/constants/app_urls.dart';
import 'package:practics/routes/app_routes.dart';

class SignUPController extends GetxController {
  final isNewPasswordHidden = true.obs;
  final RxBool obSecureText = true.obs;
  RxBool isChecked = false.obs;

  final emailText = TextEditingController();
  final passText = TextEditingController();
  final nameText = TextEditingController();
  final familyNameText = TextEditingController();
  final userNameText = TextEditingController();

  void togglePasswordVisibility() {
    isNewPasswordHidden.value = !isNewPasswordHidden.value;
  }

  void toggleCheckBox(bool? value) {
    isChecked.value = value ?? false;
  }

  Future<void> register() async {
    if (nameText.text.trim().isEmpty ||
        familyNameText.text.trim().isEmpty ||
        userNameText.text.trim().isEmpty ||
        emailText.text.trim().isEmpty ||
        passText.text.trim().isEmpty) {
      EasyLoading.showError("All fields are required");
      return;
    }

    EasyLoading.show(status: 'Creating account...');

    try {
      final requestBody = {
        "first_name": nameText.text.trim(),
        "last_name": familyNameText.text.trim(),
        "username": userNameText.text.trim(),
        "email": emailText.text.trim(),
        "password": passText.text.trim(),
      };

      final response = await NetworkCaller().postRequest(
        AppUrls.register,
        body: requestBody,
        token: StorageService().getData("token"),
      );
      if (response.isSuccess) {
        EasyLoading.showSuccess("Account created successfully!");
        Get.toNamed(AppRoute.verifyCodeScreen, arguments: emailText.text);
        nameText.clear();
        familyNameText.clear();
        emailText.clear();
        userNameText.clear();
        passText.clear();
      } else if (response.statusCode == 400) {
      } else {
        EasyLoading.showError(response.errorMessage);
      }
    } catch (e) {
      EasyLoading.showError("Registration failed. Try again.");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
