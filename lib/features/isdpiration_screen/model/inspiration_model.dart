// class CommunityPost {
//   final String id;
//   final String userName;
//   final String content;
//   final String timeAgo;
//   int likes;
//   bool isLiked;
//   int replies;

//   CommunityPost({
//     required this.id,
//     required this.userName,
//     required this.content,
//     required this.timeAgo,
//     this.likes = 0,
//     this.isLiked = false,
//     this.replies = 0,
//   });
// }

class CommunityPost {
  final String id;
  final String userName;
  final String content;
  final String timeAgo;
  int likes;
  bool isLiked;
  int replies;
  bool showReplies;
  List<Reply> replyList;

  CommunityPost({
    required this.id,
    required this.userName,
    required this.content,
    required this.timeAgo,
    this.likes = 0,
    this.isLiked = false,
    this.replies = 0,
    this.showReplies = false,
    List<Reply>? replyList,
  }) : replyList = replyList ?? [];
}

// New Reply model
class Reply {
  final String id;
  final String userName;
  final String content;
  final String timeAgo;
  int likes;
  bool isLiked;

  Reply({
    required this.id,
    required this.userName,
    required this.content,
    required this.timeAgo,
    this.likes = 0,
    this.isLiked = false,
  });
}
