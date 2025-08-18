import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/style/global_text_style.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/features/home/widget/post_card.dart';
import 'package:practics/features/questions_answer/controller/question_answer_controller.dart';
import 'package:practics/features/questions_answer/screen/ask_question_screen.dart';

class QuestionAnswerScreen extends StatelessWidget {
  QuestionAnswerScreen({super.key});

  final QuestionAnswerController tabController = Get.put(
    QuestionAnswerController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                // Header with Tabs
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300, width: 1.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: tabController.tabs
                          .asMap()
                          .entries
                          .map(
                            (entry) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4.0,
                              ),
                              child: _buildTab(entry.key, entry.value),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),

                // Search Bar
                Container(
                  height: 55,
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                    border: Border.all(color: Colors.grey.shade300, width: 1.0),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search questions and topics....",
                            border: InputBorder.none,
                          ),

                          style: globalTextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Ask a Question Button
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => AskQuestionScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD700),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      minimumSize: const Size(double.infinity, 48.0),
                    ),
                    child: Text(
                      "Ask a Question",
                      style: globalTextStyle(
                        fontSize: 16.0,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                // Post Section
                _postSection(),

                // Container(
                //   margin: const EdgeInsets.all(16.0),
                //   padding: const EdgeInsets.all(16.0),
                //   decoration: BoxDecoration(
                //     color: Colors.grey[100],
                //     borderRadius: BorderRadius.circular(12.0),
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Row(
                //         children: [
                //           const CircleAvatar(
                //             radius: 20.0,
                //             backgroundImage: NetworkImage(
                //               "https://via.placeholder.com/40",
                //             ),
                //           ),
                //           const SizedBox(width: 8.0),
                //           Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               const Text(
                //                 "Michael Chen",
                //                 style: TextStyle(fontWeight: FontWeight.bold),
                //               ),
                //               Text(
                //                 "45 minutes ago",
                //                 style: TextStyle(color: Colors.grey[600]),
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //       const SizedBox(height: 8.0),
                //       const Text(
                //         "How do I find peace during difficult times?",
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 16.0,
                //         ),
                //       ),
                //       const SizedBox(height: 8.0),
                //       const Text(
                //         "I've been struggling with anxiety and stress lately. What are some ways to find inner peace and trust in God's plan during challenging moments? I often find myself overwhelmed by daily pressures and would love to hear how others have found comfort in their faith.",
                //         style: TextStyle(fontSize: 14.0),
                //       ),
                //       const SizedBox(height: 8.0),
                //       Wrap(
                //         spacing: 8.0,
                //         children: [
                //           Chip(
                //             label: Text(
                //               "#peace",
                //               style: TextStyle(color: Colors.grey[600]),
                //             ),
                //           ),
                //           Chip(
                //             label: Text(
                //               "#anxiety",
                //               style: TextStyle(color: Colors.grey[600]),
                //             ),
                //           ),
                //           Chip(
                //             label: Text(
                //               "#faith",
                //               style: TextStyle(color: Colors.grey[600]),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _postSection() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return PostCard(
          profileImage: 'https://randomuser.me/api/portraits/men/78.jpg',
          name: 'Sarah Mitchell',
          timeAgo: '45 minutes ago',
          title: "God's Timing is Perfect",
          content:
              "God's timing is perfect, even when I don't understand it. Sometimes the waiting seasons teach us more than the answered prayers.",
          tags: ['#Faith', '#Trust', '#Prayer'],
        );
      },
    );
  }

  Widget _buildTab(int index, String text) {
    return Obx(() {
      final isSelected = tabController.selectedTabIndex.value == index;

      return GestureDetector(
        onTap: () => tabController.changeTab(index),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFFD700) : Colors.transparent,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            text,
            style: globalTextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ),
      );
    });
  }
}
