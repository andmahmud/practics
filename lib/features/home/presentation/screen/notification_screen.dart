import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/core/utils/constants/icon_path.dart';

import '../../../../core/common/widgets/custom_appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomAppbar(
                  title: 'Notification',
                  trailing: IconButton(
                      onPressed: (){
                        Get.back();
                      }, icon: Icon(Icons.arrow_back)),
                ),
                SizedBox(height: 24.h),
                _notificationSection()

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _notificationSection() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  IconPath.notificationIcon,
                  height: 50.h,
                  width: 50.w,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'New Inspiration',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 4.h),
                    CustomText(
                      text:
                      "When You Feel like you're falling apart, God is holding the pieces.",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
