import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:practics/features/isdpiration_screen/model/inspiration_model.dart';


class InspirationController extends GetxController {
  var isSaved = false.obs;
  var isLiked = false.obs;
  var likeCount = 21.obs;
  var isShareExpanded = false.obs;
  var showReplyField = false.obs;
  var replyText = ''.obs;

  // Individual reply text controllers for each post
  var replyControllers = <String, TextEditingController>{}.obs;
  var replyTexts = <String, String>{}.obs;

  final RxList<CommunityPost> posts = <CommunityPost>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadPosts();
  }

  @override
  void onClose() {
    // Dispose of text controllers
    for (var controller in replyControllers.values) {
      controller.dispose();
    }
    super.onClose();
  }

  void loadPosts() {
    posts.assignAll([
      CommunityPost(
        id: '1',
        userName: 'Sarah M',
        content:
            'Letting go of perfectionism has been my journey. God loves us as we are.',
        timeAgo: '2 hours ago',
        likes: 12,
        replies: 3,
        replyList: [
          Reply(
            id: 'r1',
            userName: 'John D',
            content: 'This really resonates with me. Thank you for sharing!',
            timeAgo: '1 hour ago',
            likes: 2,
          ),
          Reply(
            id: 'r2',
            userName: 'Lisa K',
            content:
                'Perfectionism is such a struggle. Your words give me hope.',
            timeAgo: '45 minutes ago',
            likes: 4,
          ),
          Reply(
            id: 'r3',
            userName: 'Michael R',
            content: 'Beautifully said. God\'s love is unconditional.',
            timeAgo: '30 minutes ago',
            likes: 1,
          ),
        ],
      ),
      CommunityPost(
        id: '2',
        userName: 'Maria R.',
        content:
            'Today I\'m releasing my need to control everything. Trusting in His plan brings such peace.',
        timeAgo: '4 hours ago',
        likes: 8,
        replies: 1,
        replyList: [
          Reply(
            id: 'r4',
            userName: 'Anna S',
            content:
                'I needed to hear this today. Letting go is so hard but so freeing.',
            timeAgo: '2 hours ago',
            likes: 3,
          ),
        ],
      ),
      CommunityPost(
        id: '3',
        userName: 'David K',
        content:
            'Finding strength in vulnerability. Sharing our struggles makes us stronger together.',
        timeAgo: '6 hours ago',
        likes: 15,
        replies: 5,
        replyList: [
          Reply(
            id: 'r5',
            userName: 'Rachel M',
            content:
                'Vulnerability takes so much courage. Thank you for leading by example.',
            timeAgo: '3 hours ago',
            likes: 6,
          ),
          Reply(
            id: 'r6',
            userName: 'Thomas W',
            content: 'Community support makes all the difference.',
            timeAgo: '2 hours ago',
            likes: 2,
          ),
        ],
      ),
      CommunityPost(
        id: '4',
        userName: 'Jennifer L',
        content:
            'Grateful for this community and the safe space it provides to grow spiritually.',
        timeAgo: '8 hours ago',
        likes: 20,
        replies: 7,
        replyList: [
          Reply(
            id: 'r7',
            userName: 'Peter J',
            content: 'This community has been a blessing in my life too.',
            timeAgo: '5 hours ago',
            likes: 8,
          ),
        ],
      ),
    ]);

    // Initialize text controllers for each post
    for (var post in posts) {
      replyControllers[post.id] = TextEditingController();
      replyTexts[post.id] = '';
    }
  }

  void toggleLike(String postId) {
    final postIndex = posts.indexWhere((post) => post.id == postId);
    if (postIndex != -1) {
      final post = posts[postIndex];
      if (post.isLiked) {
        post.likes--;
        post.isLiked = false;
      } else {
        post.likes++;
        post.isLiked = true;
      }
      posts.refresh();
    }
  }

  void toggleReplyLike(String postId, String replyId) {
    final postIndex = posts.indexWhere((post) => post.id == postId);
    if (postIndex != -1) {
      final replyIndex = posts[postIndex].replyList.indexWhere(
        (reply) => reply.id == replyId,
      );
      if (replyIndex != -1) {
        final reply = posts[postIndex].replyList[replyIndex];
        if (reply.isLiked) {
          reply.likes--;
          reply.isLiked = false;
        } else {
          reply.likes++;
          reply.isLiked = true;
        }
        posts.refresh();
      }
    }
  }

  void toggleReplies(String postId) {
    final postIndex = posts.indexWhere((post) => post.id == postId);
    if (postIndex != -1) {
      posts[postIndex].showReplies = !posts[postIndex].showReplies;
      posts.refresh();
    }
  }

  void updateReplyText(String postId, String text) {
    replyTexts[postId] = text;
  }

  void submitReply(String postId) {
    final replyText = replyTexts[postId] ?? '';
    if (replyText.trim().isEmpty) return;

    final postIndex = posts.indexWhere((post) => post.id == postId);
    if (postIndex != -1) {
      final newReply = Reply(
        id: 'new_${DateTime.now().millisecondsSinceEpoch}',
        userName: 'You', // In real app, this would be the current user's name
        content: replyText.trim(),
        timeAgo: 'Just now',
        likes: 0,
      );

      posts[postIndex].replyList.add(newReply);
      posts[postIndex].replies++;

      // Clear the text field
      replyControllers[postId]?.clear();
      replyTexts[postId] = '';

      posts.refresh();
    }
  }

  void toggleSave() {
    isSaved.value = !isSaved.value;
  }

  void toggleLikes() {
    if (isLiked.value) {
      likeCount.value--;
    } else {
      likeCount.value++;
    }
    isLiked.value = !isLiked.value;
  }

  void toggleShare() {
    isShareExpanded.value = !isShareExpanded.value;
  }

  void showReply() {
    showReplyField.value = true;
  }

  void hideReply() {
    showReplyField.value = false;
    replyText.value = '';
  }
  // var isSaved = false.obs;
  // var isLiked = false.obs;
  // var likeCount = 21.obs;
  // var isShareExpanded = false.obs;
  // var showReplyField = false.obs;
  // var replyText = ''.obs;
  // // var comments = <Comment>[].obs;

  // final RxList<CommunityPost> posts = <CommunityPost>[].obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   loadPosts();
  // }

  // void loadPosts() {
  //   posts.assignAll([
  //     CommunityPost(
  //       id: '1',
  //       userName: 'Sarah M',
  //       content:
  //           'Letting go of perfectionism has been my journey. God loves us as we are.',
  //       timeAgo: '2 hours ago',
  //       likes: 12,
  //       replies: 3,
  //     ),
  //     CommunityPost(
  //       id: '2',
  //       userName: 'Maria R.',
  //       content:
  //           'Today I\'m releasing my need to control everything. Trusting in His plan brings such peace.',
  //       timeAgo: '4 hours ago',
  //       likes: 8,
  //       replies: 1,
  //     ),
  //     CommunityPost(
  //       id: '3',
  //       userName: 'David K',
  //       content:
  //           'Finding strength in vulnerability. Sharing our struggles makes us stronger together.',
  //       timeAgo: '6 hours ago',
  //       likes: 15,
  //       replies: 5,
  //     ),
  //     CommunityPost(
  //       id: '4',
  //       userName: 'Jennifer L',
  //       content:
  //           'Grateful for this community and the safe space it provides to grow spiritually.',
  //       timeAgo: '8 hours ago',
  //       likes: 20,
  //       replies: 7,
  //     ),
  //   ]);
  // }

  // void toggleLike(String postId) {
  //   final postIndex = posts.indexWhere((post) => post.id == postId);
  //   if (postIndex != -1) {
  //     final post = posts[postIndex];
  //     if (post.isLiked) {
  //       post.likes--;
  //       post.isLiked = false;
  //     } else {
  //       post.likes++;
  //       post.isLiked = true;
  //     }
  //     posts.refresh();
  //   }
  // }

  // void addReply(String postId) {
  //   final postIndex = posts.indexWhere((post) => post.id == postId);
  //   if (postIndex != -1) {
  //     posts[postIndex].replies++;
  //     posts.refresh();
  //   }
  // }

  // void toggleSave() {
  //   isSaved.value = !isSaved.value;
  // }

  // void toggleLikes() {
  //   if (isLiked.value) {
  //     likeCount.value--;
  //   } else {
  //     likeCount.value++;
  //   }
  //   isLiked.value = !isLiked.value;
  // }

  // void toggleShare() {
  //   isShareExpanded.value = !isShareExpanded.value;
  // }

  // void showReply() {
  //   showReplyField.value = true;
  // }

  // void hideReply() {
  //   showReplyField.value = false;
  //   replyText.value = '';
  // }
}
