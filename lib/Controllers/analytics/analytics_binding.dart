import 'package:analytics_ui/Controllers/analytics/analytics_controller.dart';
import 'package:analytics_ui/Routes/route_constant.dart';
import 'package:get/get.dart';

class AnalyticsBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AnalyticsController(),tag: RouteConstants.analyticsScreen);
  }
}