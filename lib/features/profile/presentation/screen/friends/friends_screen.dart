import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_appbar.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/features/profile/controller/tab_bar_controller.dart';
import 'package:practics/features/profile/presentation/screen/friends/connected_friend.dart';
import 'package:practics/features/profile/presentation/screen/friends/connection_through_church.dart';

class FriendsScreen extends StatelessWidget {
  FriendsScreen({super.key});
  final controller = Get.put(TabBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackGround,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppbar(
                      title: "Friends",
                      trailing: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                    ),
                    Obx(
                      () => Container(
                        height: 60.h,
                        width: double.infinity,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          children: List.generate(2, (index) {
                            final titles = [
                              'Connected friend',
                              'Connection through Church',
                            ];
                            final primaryColor = AppColors.primary;
                            const unselectedBgColor = Colors.white;
                            final isSelected =
                                controller.selectedTabIndex.value == index;

                            return Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  controller.tabController.animateTo(index);
                                  controller.selectedTabIndex.value = index;
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? primaryColor
                                        : unselectedBgColor,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: CustomText(
                                    textAlign: TextAlign.center,
                                    text: titles[index],
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Expanded(
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: controller.tabController,
                        children: [
                          ConnectedFriend(),
                          ConnectionThroughChurch(),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
