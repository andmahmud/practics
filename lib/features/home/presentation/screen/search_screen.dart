import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/common/widgets/custom_textformfield.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/core/utils/constants/icon_path.dart';
import 'package:practics/features/home/controller/search_controller.dart';
import '../../../../core/common/widgets/custom_appbar.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final controller = Get.put(SearchingController());

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
                  title: 'Search',
                  trailing: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: CustomTextField(
                        controller: controller.searchText,
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Flexible(
                      flex: 1,
                      child: PopupMenuButton<String>(
                        icon: Image.asset(
                          IconPath.filterIcon,
                          height: 20.h,
                          width: 20.w,
                        ),
                        onSelected: controller.setCategory,
                        itemBuilder: (BuildContext context) {
                          return controller.categoryType.map((String category) {
                            return PopupMenuItem<String>(
                              value: category,
                              child: CustomText(text: category),
                            );
                          }).toList();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                _peopleSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _peopleSection() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  "https://randomuser.me/api/portraits/men/46.jpg",
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Michael Chen',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: 'Friend',
                    fontSize: 12.sp,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
