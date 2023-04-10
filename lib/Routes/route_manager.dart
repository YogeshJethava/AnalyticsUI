import 'package:analytics_ui/Controllers/analytics/analytics_binding.dart';
import 'package:analytics_ui/Routes/route_constant.dart';
import 'package:analytics_ui/Screen/analytics/analytics_page.dart';
import 'package:get/get.dart';


abstract class RoutesManager {
  static List<GetPage<dynamic>> get getRoutePages => [
    //Analytics screen
    GetPage(
        name: RouteConstants.analyticsScreen,
        page: () => AnalyticsPage(),
        binding: AnalyticsBinding()),

  ];
}