import 'package:flutter/material.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import '../../../../core/common/widgets/custom_appbar.dart';
import '../../widget/post_card.dart';

class ViewFullPostScreen extends StatelessWidget {
  const ViewFullPostScreen({super.key});

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
                  CustomAppbar(
                    title: 'Michael Chen Post',
                    trailing: IconButton(
                        onPressed: (){
                          Get.back();
                        }, icon: Icon(Icons.arrow_back)),
                  ),
                  SizedBox(height: 35.h),
                  _postSection(),

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
      itemCount: 1,
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




}
