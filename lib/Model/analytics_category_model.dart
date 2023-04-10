import 'package:get/get.dart';

class AnalyticsCategoryModel{
  final String menuTitle;
  RxBool isSelected = false.obs;
  AnalyticsCategoryModel({required this.menuTitle});
}