import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchingController extends GetxController {
  final selectCategory = ''.obs;
  final searchText = TextEditingController();

  final List<String> categoryType = ['Church', 'Person', 'Post'];

  void setCategory(String category) {
    selectCategory.value = category;
  }
}
