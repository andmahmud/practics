import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/core/utils/constants/icon_path.dart';
import 'package:practics/features/create_post/screen/create_post_screen.dart' show CreatePostScreen;
import 'package:practics/features/home/presentation/screen/home_screen.dart';
import 'package:practics/features/isdpiration_screen/screen/ispiration_screen.dart';
import 'package:practics/features/nav_bar/controller/nav_bar_controller.dart';
import 'package:practics/features/profile/presentation/screen/profile_screen.dart';
import 'package:practics/features/questions_answer/screen/question_answer_screen.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});
  final navController = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (navController.currentIndex.value) {
          case 0:
            return IspirationScreen();
          case 1:
            return HomeScreen();
          case 2:
            return QuestionAnswerScreen();
          case 3:
            return ProfileScreen();
          default:
            return const ProfileScreen();
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        shape: const CircleBorder(),
        onPressed: () {
          Get.to(() => CreatePostScreen());
        },
        child: Icon(Icons.add, color: Colors.black, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Color(0xfffefefe),
          notchMargin: 8.0,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                navItem(IconPath.sunIcon, IconPath.sunIcon2, "Inspiration", 0),
                navItem(IconPath.homeIcon, IconPath.homeIcon2, "Home", 1),
                SizedBox(width: 45.w), // space for FAB
                navItem(IconPath.helpIcon, IconPath.helpIcon2, "Q&A", 2),
                navItem(
                  IconPath.profileIcon,
                  IconPath.profileIcon2,
                  "Profile",
                  3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navItem(String icon, String colorIcon, String label, int index) {
    bool isSelected = navController.currentIndex.value == index;
    return GestureDetector(
      onTap: () => navController.changeTab(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            isSelected ? colorIcon : icon,
            height: 24.h,
            width: 20.w,
            color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
          ),
          CustomText(
            text: label,
            color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
