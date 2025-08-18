import 'package:get/get.dart';

class BookmarkController extends GetxController {
  var likeCount = 0.obs;
  var commentCount = 210.obs;
  var isLiked = false.obs;

  void toggleLike() {
    if (isLiked.value) {
      likeCount.value--;
      isLiked.value = false;
    } else {
      likeCount.value++;
      isLiked.value = true;
    }
  }
  final RxBool isExpanded = false.obs;
}
