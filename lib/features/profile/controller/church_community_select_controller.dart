import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChurchCommunitySelectController extends GetxController {
  final search = TextEditingController();

  var selected = List.generate(10, (_) => false).obs;

  void toggleSelection(int index) {
    selected[index] = !selected[index];
  }
}
