import 'package:analytics_ui/Model/analytics_category_model.dart';
import 'package:analytics_ui/ViewModel/analytics_view_model.dart';
import 'package:get/get.dart';

class AnalyticsController extends GetxController{

  ///Create the instance of [AnalyticsViewModel] class.
  final AnalyticsViewModel viewModel = AnalyticsViewModel();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    viewModel.addCategoryAllCategory();
    viewModel.addPaymentTransaction();
    viewModel.addTask();
    viewModel.addTopSellingCategory();
  }
}