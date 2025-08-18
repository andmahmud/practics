import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_appbar.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackGround,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomAppbar(
                  title: "About Me",
                  trailing: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                SizedBox(height: 10.h),
                CustomText(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,

                  text:
                      "I’m a person who values faith, personal growth, and the power of community. My journey in faith has been a continuous learning experience, and I believe every day is an opportunity to deepen our connection with God and those around us. I find strength in prayer and reflection, and I’m always seeking to grow spiritually, emotionally, and intellectually.",
                ),
                SizedBox(height: 10.h),
                CustomText(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,

                  text:
                      "I’m passionate about learning more about theology and philosophy, exploring how they shape our understanding of life, purpose, and faith. I enjoy being part of a supportive community where we can share our experiences, lift each other up, and help each other grow stronger in our beliefs.",
                ),
                SizedBox(height: 10.h),
                CustomText(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,

                  text:
                      "Through this platform, I hope to connect with others who are also on their spiritual journeys, exchange insights, and create a space for open, meaningful conversations about faith, life, and the world around us. Let’s walk this path together, supporting each other in our growth and in our love for God.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
