import 'package:get/get.dart';
import 'package:practics/features/questions_answer/controller/ask_question_controller.dart';
import '../../features/splash/controller/splash_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController(), permanent: true);
    Get.lazyPut<QuestionController>(() => QuestionController(), fenix: true);
  }
}
