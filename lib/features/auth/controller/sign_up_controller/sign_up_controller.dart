import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUPController extends GetxController{

  final isNewPasswordHidden = true.obs;
  final RxBool obSecureText = true.obs;
  RxBool isChecked = false.obs;


  final emailText = TextEditingController();
  final passText = TextEditingController();
  final nameText = TextEditingController();
  final familyNameText = TextEditingController();


  void togglePasswordVisibility() {
    isNewPasswordHidden.value = !isNewPasswordHidden.value;
  }

  void toggleCheckBox(bool? value){
    isChecked.value = value ?? false;
  }

}