import 'package:analytics_ui/Routes/route_constant.dart';
import 'package:analytics_ui/Routes/route_manager.dart';
import 'package:analytics_ui/Screen/analytics/analytics_page.dart';
import 'package:analytics_ui/Theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      getPages: RoutesManager.getRoutePages,
      initialRoute: RouteConstants.analyticsScreen,
    );
  }
}
