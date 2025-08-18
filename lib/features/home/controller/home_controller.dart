import 'package:get/get.dart';

class HomeController extends GetxController{


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


  var comments = <Comment>[].obs;
  void addComment(String userName, String role, String message) {
    comments.add(Comment(userName: userName, role: role, message: message));
  }

  void toggleReplyLike(Comment comment) {
    if (comment.isLiked.value) {
      comment.likes.value--;
      comment.isLiked.value = false;
    } else {
      comment.likes.value++;
      comment.isLiked.value = true;
    }
  }

  var replyingTo = Rx<Comment?>(null);

  void startReply(Comment comment) {
    replyingTo.value = comment;
  }

  void cancelReply() {
    replyingTo.value = null;
  }

  void addReply(Comment parent, String userName, String role, String message) {
    parent.replies.add(Comment(userName: userName, role: role, message: message));
  }
}

class Comment {
  String userName;
  String role;
  String message;
  RxInt likes;
  RxBool isLiked;
  RxList<Comment> replies;

  Comment({
    required this.userName,
    required this.role,
    required this.message,
    int initialLikes = 0,
    bool liked = false,
    List<Comment>? initialReplies,
  })  : likes = initialLikes.obs,
        isLiked = liked.obs,
        replies = (initialReplies ?? []).obs;
}