import 'package:flutter/material.dart';
import 'package:practics/core/common/widgets/custom_text.dart';
import 'package:practics/core/utils/constants/app_colors.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import 'package:practics/core/utils/constants/image_path.dart';


class ConnectionThroughChurch extends StatelessWidget {
  const ConnectionThroughChurch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackGround,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 15,

                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 5.h),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
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
                                    text: "Michael Chen",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CustomText(
                                    text: "Nieuwe Kerk",
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textSecondary,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
