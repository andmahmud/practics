import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  RxBool isChecked = false.obs;
  final isNewPasswordHidden = true.obs;
  final RxBool obSecureText = true.obs;

  final emailText = TextEditingController();
  final passText = TextEditingController();

  void togglePasswordVisibility() {
    isNewPasswordHidden.value = !isNewPasswordHidden.value;
  }

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }

}