import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/style/global_text_style.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/icon_path.dart';
import 'package:practics/features/isdpiration_screen/model/inspiration_model.dart';


import '../controller/inspiration_controller.dart';

class IspirationScreen extends StatelessWidget {
  final InspirationController controller = Get.put(InspirationController());

  IspirationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(IconPath.logoIcon, height: 48, width: 48),
                SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFFFCFCF6),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Monday, August 4, 2025',
                        style: globalTextStyle(
                          fontSize: 14,
                          color: Color(0xFF636F85),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      // Date
                      const SizedBox(height: 16),

                      // Title
                      Text(
                        'When You Feel Like You\'re Falling Apart, God Is Holding The Pieces.',
                        style: globalTextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1A1A),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),

                      // Bible verse
                      Text(
                        'I John 4:16',
                        style: globalTextStyle(
                          fontSize: 16,
                          color: Color(0xFF636F85),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Read Less',
                              style: globalTextStyle(
                                fontSize: 14,
                                color: Color(0xFFC9A100),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xFFC9A100),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Content
                      Text(
                        'This Message Reminds Us That God Doesn\'t Always Fix Situations, But Often Strengthens Us Through Them. It\'s About Inner Resilience And Grace. This Message Reminds Us That God Doesn\'t Always Fix Situations, But Often Strengthens Us Through Them. It\'s About Inner Resilience And Grace.',
                        style: globalTextStyle(
                          fontSize: 16,
                          color: Color(0xFF636F85),

                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Divider(),

                      Row(
                        children: [
                          // Save button
                          Obx(
                            () => GestureDetector(
                              onTap: controller.toggleSave,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      controller.isSaved.value
                                          ? Icons.bookmark
                                          : Icons.bookmark_border,
                                      size: 20,
                                      color: controller.isSaved.value
                                          ? const Color(0xFFE67E22)
                                          : Color(0xFF636F85),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Save',
                                      style: globalTextStyle(
                                        fontSize: 14,
                                        color: controller.isSaved.value
                                            ? Color(0xFFE67E22)
                                            : Color(0xFF636F85),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 16),

                          // Like button
                          Obx(
                            () => GestureDetector(
                              onTap: controller.toggleLikes,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      controller.isLiked.value
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      size: 20,
                                      color: controller.isLiked.value
                                          ? Colors.red
                                          : Colors.grey[600],
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      '${controller.likeCount.value} Like',
                                      style: globalTextStyle(
                                        fontSize: 14,
                                        color: controller.isLiked.value
                                            ? Colors.red
                                            : Color(0xFF636F85),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 16),

                          // Share button
                          GestureDetector(
                            onTap: controller.toggleShare,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.share_outlined,
                                    size: 20,
                                    color: Color(0xFF636F85),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Share',
                                    style: globalTextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF636F85),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 22),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Share Thoughts section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFE5E7EB),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFF9EE),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              IconPath.shareThoughIcon,
                              height: 28,
                              width: 28,
                              // color: const Color(0xFFD4AF37),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Share Thoughts',
                            style: globalTextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1F2937),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Text(
                        'What is one thing you can let go of today to feel more peaceful?',
                        style: globalTextStyle(
                          fontSize: 16,
                          color: Color(0xFF636F85),

                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFFE5E7EB),
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          onChanged: (value) =>
                              controller.replyText.value = value,
                          decoration: InputDecoration(
                            hintText: 'Share your thoughts....',
                            hintStyle: globalTextStyle(
                              color: const Color(0xFF9CA3AF),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(20),
                          ),
                          style: globalTextStyle(
                            fontSize: 16,
                            color: Color(0xFF374151),
                          ),
                          maxLines: 6,
                          minLines: 6,
                        ),
                      ),

                      const SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Text(
                              '${controller.replyText.value.length}/500',
                              style: globalTextStyle(
                                fontSize: 14,
                                color: const Color(0xFF9CA3AF),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFD87B),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Text(
                              'Share Reflection',
                              style: globalTextStyle(
                                color: Color(0xFF1A1A1A),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Community Reflections
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                              // width: 34,
                              // height: 34,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF9EE),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                  IconPath.communityIcon,
                                  height: 28,
                                  width: 28,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Community Reflections',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Obx(() {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(16),
                          itemCount: controller.posts.length,
                          itemBuilder: (context, index) {
                            final post = controller.posts[index];
                            return Column(
                              children: [
                                CommunityPostCard(
                                  post: post,
                                  controller: controller, // Add this line
                                  onLike: () => controller.toggleLike(post.id),
                                  onReply: () => controller.toggleReplies(
                                    post.id,
                                  ), // Updated this line
                                ),
                                if (index != controller.posts.length - 1)
                                  const Divider(),
                              ],
                            );
                          },
                        );
                      }),

                      // Obx(() {
                      //   return ListView.builder(
                      //     shrinkWrap: true,
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     padding: const EdgeInsets.all(16),
                      //     itemCount: controller.posts.length,
                      //     itemBuilder: (context, index) {
                      //       final post = controller.posts[index];
                      //       return Column(
                      //         children: [
                      //           CommunityPostCard(
                      //             post: post,
                      //             onLike: () => controller.toggleLike(post.id),
                      //             onReply: () => controller.addReply(post.id),
                      //           ),
                      //           if (index != controller.posts.length - 1)
                      //             Divider(),
                      //         ],
                      //       );
                      //     },
                      //   );
                      // }),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommunityPostCard extends StatelessWidget {
  final CommunityPost post;
  final VoidCallback onLike;
  final VoidCallback onReply;
  final InspirationController controller;

  const CommunityPostCard({
    super.key,
    required this.post,
    required this.onLike,
    required this.onReply,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with name and time
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              post.userName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            Text(
              post.timeAgo,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Post content
        Text(
          post.content,
          style: TextStyle(fontSize: 15, color: Colors.grey[700], height: 1.4),
        ),
        const SizedBox(height: 16),

        // Action buttons
        Row(
          children: [
            // Like button
            InkWell(
              onTap: onLike,
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      post.isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                      size: 20,
                      color: post.isLiked ? Colors.blue[600] : Colors.grey[600],
                    ),
                    const SizedBox(width: 6),
                    Text(
                      post.likes > 0 ? 'Like (${post.likes})' : 'Like',
                      style: TextStyle(
                        fontSize: 14,
                        color: post.isLiked
                            ? Colors.blue[600]
                            : Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Reply button
            InkWell(
              onTap: () => controller.toggleReplies(post.id),
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(IconPath.commentIcon, height: 24, width: 24),
                    const SizedBox(width: 6),
                    Text(
                      post.replies > 0 ? 'Reply (${post.replies})' : 'Reply',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // Replies section
        if (post.showReplies) ...[
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.only(left: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Replies (${post.replies})',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 12),

                // Existing replies
                ...post.replyList.map(
                  (reply) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                reply.userName,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                reply.timeAgo,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            reply.content,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 8),
                          InkWell(
                            onTap: () =>
                                controller.toggleReplyLike(post.id, reply.id),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  reply.isLiked
                                      ? Icons.thumb_up
                                      : Icons.thumb_up_outlined,
                                  size: 16,
                                  color: reply.isLiked
                                      ? Colors.blue[600]
                                      : Colors.grey[600],
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  reply.likes > 0 ? '${reply.likes}' : '',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: reply.isLiked
                                        ? Colors.blue[600]
                                        : Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Add reply text field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: TextField(
                    controller: controller.replyControllers[post.id],
                    onChanged: (value) =>
                        controller.updateReplyText(post.id, value),
                    decoration: InputDecoration(
                      hintText: 'Write a reply...',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(12),
                      suffixIcon: Obx(() {
                        final hasText = (controller.replyTexts[post.id] ?? '')
                            .trim()
                            .isNotEmpty;
                        return hasText
                            ? IconButton(
                                icon: const Icon(
                                  Icons.send,
                                  color: Color(0xFFE67E22),
                                  size: 20,
                                ),
                                onPressed: () =>
                                    controller.submitReply(post.id),
                              )
                            : const SizedBox.shrink();
                      }),
                    ),
                    style: const TextStyle(fontSize: 14),
                    maxLines: 3,
                    minLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

// class CommunityPostCard extends StatelessWidget {
//   final CommunityPost post;
//   final VoidCallback onLike;
//   final VoidCallback onReply;

//   const CommunityPostCard({
//     super.key,
//     required this.post,
//     required this.onLike,
//     required this.onReply,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Header with name and time
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               post.userName,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black87,
//               ),
//             ),
//             Text(
//               post.timeAgo,
//               style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//             ),
//           ],
//         ),
//         const SizedBox(height: 12),

//         // Post content
//         Text(
//           post.content,
//           style: TextStyle(fontSize: 15, color: Colors.grey[700], height: 1.4),
//         ),
//         const SizedBox(height: 16),

//         // Action buttons
//         Row(
//           children: [
//             // Like button
//             InkWell(
//               onTap: onLike,
//               borderRadius: BorderRadius.circular(20),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 8,
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(
//                       post.isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
//                       size: 20,
//                       color: post.isLiked ? Colors.blue[600] : Colors.grey[600],
//                     ),
//                     const SizedBox(width: 6),
//                     Text(
//                       post.likes > 0 ? 'Like (${post.likes})' : 'Like',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: post.isLiked
//                             ? Colors.blue[600]
//                             : Colors.grey[600],
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16),

//             // Reply button
//             InkWell(
//               onTap: onReply,
//               borderRadius: BorderRadius.circular(20),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 8,
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Image.asset(IconPath.commentIcon, height: 24, width: 24),
//                     const SizedBox(width: 6),
//                     Text(
//                       post.replies > 0 ? 'Reply (${post.replies})' : 'Reply',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey[600],
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
