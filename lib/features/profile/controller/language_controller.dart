import 'package:get/get.dart';
import 'package:practics/core/utils/constants/icon_path.dart';


class LanguageController extends GetxController {
  final languages = [
    {"name": "English", "image": IconPath.english},
    {"name": "Dutch", "image": IconPath.dutch},
  ].obs;


  var selectedLanguage = 0.obs;

  void selectLanguage(int index) {
    selectedLanguage.value = index;
  }
}
