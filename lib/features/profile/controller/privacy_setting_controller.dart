import 'package:get/get.dart';

class PrivacySettingController extends GetxController{


    var isOne = false.obs;

       void toggleSwitchtan() {
    isOne.value = !isOne.value;
  }
}