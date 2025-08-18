// controllers/tab_controller.dart
import 'package:get/get.dart';

class QuestionAnswerController extends GetxController {
  final RxInt selectedTabIndex = 0.obs;
  final List<String> tabs = ["Theology", "Philosophy", "Thought", "Requests"];

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }
  // final RxInt selectedTabIndex = 0.obs;
  // final List<String> tabs = ["Theology", "Philosophy", "Thought", "Requests"];

  // void changeTab(int index) {
  //   selectedTabIndex.value = index;
  // }
}
