import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/features/home/controller/home_controller.dart';


class CommentBottomSheet extends StatelessWidget {
  final controller = Get.put(HomeController());
  final TextEditingController commentText = TextEditingController();

  CommentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.8,
      builder: (_, scrollController) {
        return Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Text("Comments", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),

              /// Comment List
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    controller: scrollController,
                    itemCount: controller.comments.length,
                    itemBuilder: (_, index) {
                      final comment = controller.comments[index];
                      return _buildCommentTile(comment);
                    },
                  ),
                ),
              ),

              /// Add Comment Field
              Obx(() {
                final replyingTo = controller.replyingTo.value;
                return Column(
                  children: [
                    if (replyingTo != null)
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Replying to ${replyingTo.userName}",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, size: 18),
                            onPressed: controller.cancelReply,
                          ),
                        ],
                      ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/men/75.jpg",
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: commentText,
                            decoration: InputDecoration(
                              hintText: replyingTo != null
                                  ? "Write a reply..."
                                  : "Add a comment...",
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            if (commentText.text.trim().isNotEmpty) {
                              if (replyingTo != null) {
                                controller.addReply(
                                  replyingTo,
                                  "You",
                                  "Member",
                                  commentText.text.trim(),
                                );
                                controller.cancelReply();
                              } else {
                                controller.addComment(
                                  "You",
                                  "Member",
                                  commentText.text.trim(),
                                );
                              }
                              commentText.clear();
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ],
          ),
        );
      },
    );
  }

  /// Single Comment Tile with Replies
  Widget _buildCommentTile(Comment comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://randomuser.me/api/portraits/women/45.jpg",
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment.userName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      comment.role,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Text("2d", style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Text(comment.message),
          ),

          /// Like & Reply Row
          Padding(
            padding: const EdgeInsets.only(left: 48.0, top: 4),
            child: Row(
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () => controller.toggleReplyLike(comment),
                    child: Text(
                      "Like ${comment.likes.value}",
                      style: TextStyle(
                        color: comment.isLiked.value
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    controller.startReply(comment);
                  },
                  child: Text("Reply", style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ),

          /// Replies
          Obx(
            () => Column(
              children: comment.replies
                  .map(
                    (reply) => Padding(
                      padding: const EdgeInsets.only(left: 48.0, top: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://randomuser.me/api/portraits/men/46.jpg",
                            ),
                            radius: 14,
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  reply.userName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(reply.message),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
