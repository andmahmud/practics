import 'package:flutter/material.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/core/utils/constants/icon_path.dart';
import 'package:practics/routes/app_routes.dart';
import '../../widget/post_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(IconPath.logoIcon,height: 48.h,width: 40.w),
                    Spacer(),
                    GestureDetector(
                        onTap: ()=> Get.toNamed(AppRoute.searchScreen),
                        child: Image.asset(IconPath.searchIcon,height: 36.h,width: 36.w)),
                    SizedBox(width: 12),
                    GestureDetector(
                        onTap: ()=> Get.toNamed(AppRoute.friendRequestScreen),
                        child: Image.asset(IconPath.friendsIcon,height: 36.h,width: 36.w)),
                    SizedBox(width: 12),
                    GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoute.messageScreen);
                        },
                        child: Image.asset(IconPath.inboxIcon,height: 36.h,width: 36.w)),
                    SizedBox(width: 12),
                    GestureDetector(
                        onTap: ()=> Get.toNamed(AppRoute.notificationScreen),
                        child: Image.asset(IconPath.notificationIcon,height: 36.h,width: 36.w)),
                  ],
                ),
                SizedBox(height: 35.h),
                _postSection(),
               // SizedBox(height: 24.h),
                _postedQAsection(),
                _todayInspirationSection(),
                 SizedBox(height: 24.h),
                _popularReflectionSection()
              ],
            ),
          )
        ),
      ),
    );
  }

  Widget _postSection(){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context,index){
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

  Widget _postedQAsection(){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context,index){
        return GestureDetector(
          onTap: ()=> Get.toNamed(AppRoute.viewFullPostScreen),
          child: Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: Color(0xffFFF9EE),
                border: Border.all(color: Color(0xffFFECC8)),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(IconPath.message_question,height: 16.h,width: 16.w),
                    SizedBox(width: 8.w),
                    CustomText(text: 'Your friend posted in Q&A',color: Color(0xffEF4444),fontSize: 12.sp,fontWeight: FontWeight.w500),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://randomuser.me/api/portraits/men/46.jpg"),
                    ),
                    SizedBox(width: 12.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Michael Chen',fontSize: 16.sp,fontWeight: FontWeight.w600),
                        CustomText(text: '45 minutes ago',fontSize: 12.sp,color: AppColors.textSecondary)
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                CustomText(text: 'How do you deal with spiritual dryness during difficult seasons?',fontWeight: FontWeight.w500),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: '12 responses',fontSize: 12.sp,color: AppColors.textSecondary),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 9),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: CustomText(text: 'View Full Post',fontSize: 12.sp,fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _todayInspirationSection(){
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.containerBorder),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.thumb_up,color: Color(0xffC9A100)),
              SizedBox(width: 8.h),
              CustomText(text: "Thomas liked today's inspiration",fontSize: 12.sp),
            ],
          ),
          SizedBox(height: 16.h),
          CustomText(text: "The Lord is near to the brokenhearted and saves the crushed in spirit."),
          SizedBox(height: 8.h),
          CustomText(text: "- Psalm 34:18",color: AppColors.textSecondary),
          SizedBox(height: 16.h),
          TextButton(
              onPressed: (){}, 
              child: CustomText(text: 'See Full Inspiration',color: Color(0xffC9A100),fontWeight: FontWeight.w500),
          
          )
        ],
      ),
    );
  }

  Widget _popularReflectionSection(){
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.containerBorder),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(IconPath.bulbIcon,height: 16.h,width: 16.w),
              SizedBox(width: 8.h),
              CustomText(text: "Popular Reflections",fontSize: 12.sp,fontWeight: FontWeight.w500),
              Spacer(),
              Icon(Icons.more_horiz),
            ],
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: " A Soul's Longing and Humility",fontWeight: FontWeight.w600),
                SizedBox(height: 8.h),
                CustomText(text: "The Lord is near to the brokenhearted and saves the crushed in spirit."),
                SizedBox(height: 8.h),
                CustomText(text: "- Psalm 34:18",color: AppColors.textSecondary),
                Row(
                  children: [
                    CustomText(text: '- Mahatma Gandhi',fontSize: 12.sp,color: AppColors.textSecondary),
                    Spacer(),
                    Icon(Icons.favorite,color: Color(0xffC9A100),size: 20),
                    CustomText(text: ' 120',fontSize: 12.sp)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
