import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TabBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final selectedTabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);

    tabController.addListener(() {
      selectedTabIndex.value = tabController.index;
    });

    // AuthService.init();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}