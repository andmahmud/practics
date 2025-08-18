import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_appbar.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/features/home/widget/post_card.dart';


class MypostScreen extends StatelessWidget {
  const MypostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackGround,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppbar(
                  title: "Post",
                  trailing: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                SizedBox(height: 10.h),
                _postSection(),
                SizedBox(height: 10.h),
                _postSection(),
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
          profileImage: 'https://randomuser.me/api/portraits/women/44.jpg',
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
}
