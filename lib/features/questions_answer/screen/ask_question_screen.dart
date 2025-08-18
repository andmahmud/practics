import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_appbar.dart';
import 'package:practics/core/common/widgets/custom_button.dart';
import 'package:practics/core/style/global_text_style.dart';
import 'package:practics/features/questions_answer/controller/ask_question_controller.dart';

class AskQuestionScreen extends StatelessWidget {
  final QuestionController controller = Get.put(QuestionController());

  AskQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            CustomAppbar(
              trailing: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.black87),
              ),

              title: 'Ask Question',
              centerTitle: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Question Title
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Question Title',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            Text(' *', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: controller.titleController,
                            onChanged: (value) =>
                                controller.questionTitle.value = value,

                            decoration: InputDecoration(
                              hintText: "What's Your Question?",
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(12),
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Obx(
                            () => Text(
                              '${controller.questionTitle.value.length}/120',
                              style: globalTextStyle(
                                fontSize: 14,
                                color: const Color(0xFF9CA3AF),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),

                    // Question Description
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Question Description',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            Text(' *', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: controller.descriptionController,
                            onChanged: (value) =>
                                controller.questionDescription.value = value,
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

                        Align(
                          alignment: Alignment.centerRight,
                          child: Obx(
                            () => Text(
                              '${controller.questionDescription.value.length}/500',
                              style: globalTextStyle(
                                fontSize: 14,
                                color: const Color(0xFF9CA3AF),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),

                    // Question Category
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Question Category',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            Obx(
                              () => IconButton(
                                icon: Icon(
                                  controller.isCategoryExpanded.value
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                  color: Colors.black87,
                                ),
                                onPressed: () {
                                  controller.toggleCategoryExpansion();
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Obx(
                          () => AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            child: controller.isCategoryExpanded.value
                                ? Column(
                                    children: controller.categories.map((
                                      category,
                                    ) {
                                      return Row(
                                        children: [
                                          Radio<String>(
                                            value: category,
                                            groupValue: controller
                                                .selectedCategory
                                                .value,
                                            onChanged: (value) {
                                              controller
                                                      .selectedCategory
                                                      .value =
                                                  value!;
                                            },
                                            activeColor: Color(0xFFFFD700),
                                          ),
                                          Text(
                                            category,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                  )
                                : Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          controller
                                                  .selectedCategory
                                                  .value
                                                  .isNotEmpty
                                              ? controller
                                                    .selectedCategory
                                                    .value
                                              : 'Select a category',
                                          style: TextStyle(
                                            color:
                                                controller
                                                    .selectedCategory
                                                    .value
                                                    .isNotEmpty
                                                ? Colors.black87
                                                : Colors.grey.shade500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),

                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       'Question Category',
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w500,
                    //         color: Colors.black87,
                    //       ),
                    //     ),
                    //     SizedBox(height: 12),
                    //     Obx(
                    //       () => Column(
                    //         children: controller.categories.map((category) {
                    //           return Padding(
                    //             padding: EdgeInsets.only(bottom: 8),
                    //             child: Row(
                    //               children: [
                    //                 Radio<String>(
                    //                   value: category,
                    //                   groupValue:
                    //                       controller.selectedCategory.value,
                    //                   onChanged: (value) {
                    //                     controller.selectedCategory.value =
                    //                         value!;
                    //                   },
                    //                   activeColor: Color(0xFFFFD700),
                    //                 ),
                    //                 Text(
                    //                   category,
                    //                   style: TextStyle(
                    //                     fontSize: 14,
                    //                     color: Colors.black87,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           );
                    //         }).toList(),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 24),

                    // Tags
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tags (Optional)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                // height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Obx(
                                      () => controller.selectedTags.isNotEmpty
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                bottom: 12,
                                              ),
                                              child: Wrap(
                                                spacing: 8,
                                                runSpacing: 8,
                                                children: controller.selectedTags.map((
                                                  tag,
                                                ) {
                                                  return Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 12,
                                                          vertical: 6,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: Color(
                                                        0xFFFFD700,
                                                      ).withValues(alpha: 0.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            16,
                                                          ),
                                                      border: Border.all(
                                                        color: Color(
                                                          0xFFFFD700,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          tag,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                        ),
                                                        SizedBox(width: 4),
                                                        GestureDetector(
                                                          onTap: () =>
                                                              controller
                                                                  .removeTag(
                                                                    tag,
                                                                  ),
                                                          child: Icon(
                                                            Icons.close,
                                                            size: 14,
                                                            color:
                                                                Colors.black54,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            )
                                          : SizedBox(
                                              height: 40,
                                              child: Center(
                                                child: Text(
                                                  'Add A Tag (Faith, Hope, Prayer...)',
                                                  style: TextStyle(
                                                    color: Colors.grey.shade500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            GestureDetector(
                              onTap: () =>
                                  controller.showTagSelectionBottomSheet(),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFD700),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Obx(
                          () => Text(
                            'You Can Add Up To 5 Tags (${controller.selectedTags.length}/5)',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),

                    // Post Options
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Post Options',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 12),
                        Obx(
                          () => Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: controller.postAnonymously.value,
                                    onChanged: (value) {
                                      controller.postAnonymously.value = value!;
                                    },
                                    activeColor: Color(0xFFFFD700),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Post Anonymously',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        Text(
                                          'Your name won\'t be shown',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: controller.postForFriendsOnly.value,
                                    onChanged: (value) {
                                      controller.postForFriendsOnly.value =
                                          value!;
                                    },
                                    activeColor: Color(0xFFFFD700),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Post for Friends Only',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        Text(
                                          'Limit visibility to your friends',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: CustomButton(text: "Post", onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}

class TagSelectionBottomSheet extends StatelessWidget {
  final QuestionController controller = Get.find<QuestionController>();

  TagSelectionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: EdgeInsets.only(top: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.close, color: Colors.black87),
                  onPressed: () => Get.back(),
                ),
                Expanded(
                  child: Text(
                    'Select People for Tags',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 48), // Balance the close button
              ],
            ),
          ),

          // Search Bar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
                hintText: 'Search people',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),

          // Selected Section
          Obx(
            () => controller.tempSelectedUsers.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Selected (${controller.tempSelectedUsers.length}/5)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemCount: controller.tempSelectedUsers.length,
                          itemBuilder: (context, index) {
                            final user = controller.tempSelectedUsers[index];
                            return Container(
                              margin: EdgeInsets.only(right: 12),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.grey.shade300,
                                        backgroundImage: NetworkImage(
                                          user.avatar,
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.toggleTempUserSelection(
                                              user,
                                            );
                                          },
                                          child: Container(
                                            width: 16,
                                            height: 16,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    user.name,
                                    style: TextStyle(fontSize: 10),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  )
                : Container(),
          ),

          // Suggestions Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'All People',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),

          // User List
          Expanded(
            child: ListView.builder(
              itemCount: controller.users.length,
              itemBuilder: (context, index) {
                final user = controller.users[index];
                return Obx(
                  () => Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: InkWell(
                      onTap: () {
                        if (controller.tempSelectedUsers.length < 5 ||
                            controller.isTempUserSelected(user)) {
                          controller.toggleTempUserSelection(user);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade300,
                              backgroundImage: NetworkImage(user.avatar),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user.name,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    user.role,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: controller.isTempUserSelected(user)
                                    ? Color(0xFFFFD700)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: controller.isTempUserSelected(user)
                                      ? Color(0xFFFFD700)
                                      : Colors.grey.shade400,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: controller.isTempUserSelected(user)
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.black87,
                                      size: 14,
                                    )
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Done Button
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(16),
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                controller.confirmTagSelection();
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFD700),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'Done',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
