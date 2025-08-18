import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/features/create_post/screen/create_post_screen.dart';
import 'package:practics/features/questions_answer/model/people_model.dart';


class CreatePostController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final selectedCategory = 'Philosophy'.obs;
  final selectedTags = <String>[].obs;
  final postAnonymously = false.obs;
  final postForFriendsOnly = false.obs;
  final selectedUsers = <User>[].obs;
  final tempSelectedUsers = <User>[].obs;

  var questionTitle = ''.obs;
  var questionDescription = ''.obs;

  var isCategoryExpanded = false.obs;

  void toggleCategoryExpansion() {
    isCategoryExpanded.value = !isCategoryExpanded.value;
  }

  final users = [
    User(
      name: 'Michael Chen',
      avatar: 'https://randomuser.me/api/portraits/men/70.jpg',
      role: 'Friend',
    ),
    User(
      name: 'Sarah Johnson',
      avatar: 'https://randomuser.me/api/portraits/men/71.jpg',
      role: 'Friend',
    ),
    User(
      name: 'David Smith',
      avatar: 'https://randomuser.me/api/portraits/men/72.jpg',
      role: 'Friend',
    ),
    User(
      name: 'Emma Wilson',
      avatar: 'https://randomuser.me/api/portraits/men/73.jpg',
      role: 'Friend',
    ),
    User(
      name: 'John Brown',
      avatar: 'https://randomuser.me/api/portraits/men/75.jpg',
      role: 'Friend',
    ),
    User(
      name: 'Lisa Davis',
      avatar: 'https://randomuser.me/api/portraits/men/76.jpg',
      role: 'Friend',
    ),
    User(
      name: 'Mark Taylor',
      avatar: 'https://randomuser.me/api/portraits/men/77.jpg',
      role: 'Friend',
    ),
    User(
      name: 'Anna Miller',
      avatar: 'https://randomuser.me/api/portraits/men/78.jpg',
      role: 'Friend',
    ),
  ];

  void addTag(String tag) {
    if (!selectedTags.contains(tag) && selectedTags.length < 5) {
      selectedTags.add(tag);
    }
  }

  void removeTag(String tag) {
    selectedTags.remove(tag);
  }

  void toggleUserSelection(User user) {
    if (selectedUsers.contains(user)) {
      selectedUsers.remove(user);
    } else {
      selectedUsers.add(user);
    }
  }

  void toggleTempUserSelection(User user) {
    if (tempSelectedUsers.contains(user)) {
      tempSelectedUsers.remove(user);
    } else {
      tempSelectedUsers.add(user);
    }
  }

  bool isUserSelected(User user) {
    return selectedUsers.contains(user);
  }

  bool isTempUserSelected(User user) {
    return tempSelectedUsers.contains(user);
  }

  void initTempSelection() {
    tempSelectedUsers.clear();
    tempSelectedUsers.addAll(
      selectedTags
          .map(
            (tag) => users.firstWhere(
              (user) => user.name == tag,
              orElse: () => users.first,
            ),
          )
          .toList(),
    );
  }

  void confirmTagSelection() {
    selectedTags.clear();
    for (var user in tempSelectedUsers) {
      if (selectedTags.length < 5) {
        selectedTags.add(user.name);
      }
    }
  }

  void showTagSelectionBottomSheet() {
    initTempSelection();
    Get.bottomSheet(
      TagpepoleBottomSheet(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
