import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';

import '../../../../core/common/widgets/custom_appbar.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';

class FriendRequestScreen extends StatelessWidget {
  const FriendRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomAppbar(
                  title: 'Friend Requests',
                  trailing: IconButton(
                      onPressed: (){
                        Get.back();
                      }, icon: Icon(Icons.arrow_back)),
                ),
                SizedBox(height: 24.h),
                _friendRequestSection()

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _friendRequestSection(){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/men/46.jpg"),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'Michael Chen',fontSize: 16.sp,fontWeight: FontWeight.w600),
                    CustomText(text: '12 mutual friends',fontSize: 12.sp,color: AppColors.textSecondary),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child:  MaterialButton(
                            height: 28.h,
                            color: AppColors.primary,
                            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),// t color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            onPressed: () {

                            },
                            child: CustomText(
                              text: "Confirm",
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Flexible(
                          flex: 1,
                          child: MaterialButton(
                            height: 28.h,
                            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),// t color
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: AppColors.primary),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            onPressed: () {

                            },
                            child: CustomText(
                              text: "Confirm",
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )
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
