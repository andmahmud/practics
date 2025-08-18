import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/common/widgets/custom_appbar.dart';
import 'package:practics/core/common/widgets/custom_button.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/common/widgets/custom_textformfield.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/core/utils/constants/image_path.dart';
import 'package:practics/features/profile/controller/church_community_select_controller.dart';
import 'package:practics/features/profile/presentation/screen/church_profile_screen.dart';


class ChurchCommunitySelect extends StatelessWidget {
  ChurchCommunitySelect({super.key});
  final controller = Get.put(ChurchCommunitySelectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackGround,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomAppbar(
                title: "Church Community",
                trailing: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                prefixIcon: Icon(Icons.search, color: AppColors.textSecondary),
                controller: controller.search,
                hintText: "Search",
              ),

              SizedBox(height: 10.h),

              Align(
                alignment: Alignment.centerLeft,

                child: CustomText(
                  text: "Suggestions",
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(height: 10.h),
              SingleChildScrollView(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,

                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => controller.toggleSelection(index),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    ImagePath.image,
                                    height: 48,
                                    width: 48,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Nieuwe Kerk",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    CustomText(
                                      text: "Delft",
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textSecondary,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Obx(
                              () => Checkbox(
                                value: controller.selected[index],
                                onChanged: (_) =>
                                    controller.toggleSelection(index),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              
              
              
              
              
              
              
              
              
              Spacer(),

              CustomButton(
                text: "Done",
                onTap: () {
                  Get.to(() => ChurchProfileScreen());
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
