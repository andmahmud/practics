import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_appbar.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/features/profile/controller/language_controller.dart';


class LanguageScreen extends StatelessWidget {
  LanguageScreen({super.key});

  final controller = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackGround,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomAppbar(
                title: "Language",
                trailing: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: Obx(() {
                  return ListView.separated(
                    itemCount: controller.languages.length,
                    separatorBuilder: (_, __) => SizedBox(height: 10.h),
                    itemBuilder: (context, index) {
                      final lang = controller.languages[index];
                      final isSelected =
                          controller.selectedLanguage.value == index;

                      return GestureDetector(
                        onTap: () => controller.selectLanguage(index),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.h,
                            vertical: 12.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBackGround,
                            border: Border.all(
                              color:
                                 AppColors.containerBorder,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    lang["image"]!,
                                    height: 28,
                                    width: 28,
                                  ),
                                  SizedBox(width: 10.w),
                                  CustomText(
                                    text: lang["name"]!,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              if (isSelected)
                                Icon(Icons.done, color: AppColors.textPrimary),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
