import 'package:analytics_ui/Constants/color_constant.dart';
import 'package:analytics_ui/Constants/strings_constatns.dart';
import 'package:analytics_ui/Controllers/analytics/analytics_controller.dart';
import 'package:analytics_ui/Routes/route_constant.dart';
import 'package:analytics_ui/Screen/analytics/menu_widget.dart';
import 'package:analytics_ui/Screen/analytics/orders_widget.dart';
import 'package:analytics_ui/Screen/analytics/payment_widget.dart';
import 'package:analytics_ui/Screen/analytics/sales_widget.dart';
import 'package:analytics_ui/Screen/analytics/waiter_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:analytics_ui/Constants/strings_constatns.dart';

class AnalyticsPage extends StatelessWidget {
  AnalyticsPage({Key? key}) : super(key: key);

  ///Create the instance of [AnalyticsController] class.
  final AnalyticsController _controller =
      Get.find(tag: RouteConstants.analyticsScreen);

  late ThemeData _themeData;
  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(child: buildBody()),
    );
  }

  ///Build the body.
  Widget buildBody() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SizedBox(height: 420,child: SalesWidget()),
        SizedBox(height: 32,),
        SizedBox(height: 600,child: OrdersWidget()),
        SizedBox(height: 32,),
        SizedBox(height: 550,child: PaymentWidget()),
        SizedBox(height: 670,child: MenuWidget()),
        SizedBox(height: 1000,child: WaiterWidget())
      ],
    );
  }

  ///Build the [AppBar]
  AppBar buildAppBar() {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      title: Text(
        StringsConstants.analytics,
        style: _themeData.textTheme.displayMedium!.merge(const TextStyle(
            color: ColorConstants.primaryColorDark,
            fontSize: 16,
            fontWeight: FontWeight.w700)),
      ),
      leading: IconButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        icon: Icon(
          Icons.menu,
          color: _themeData.primaryColor,
        ),
        iconSize: 24,
      ),
      bottom: buildCategoryListMenu(),
    );
  }

  ///Build the category List Menu.
  PreferredSize buildCategoryListMenu() {
    return PreferredSize(
      preferredSize: const Size(
        double.infinity,
        60,
      ),
      child: SizedBox(
        height: 60,
        child: Obx(() => ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (builder, index) {
              final obj = _controller.viewModel.categoryList[index];
              return Obx(() => Row(
                    children: [
                      ActionChip(
                        padding: const EdgeInsets.all(8),
                        onPressed: () {
                          _controller.viewModel.selectCategory(index);
                        },
                        label: Text(obj.menuTitle),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                                color: _themeData.primaryColor, width: 1)),
                        backgroundColor: obj.isSelected.value
                            ? _themeData.primaryColor
                            : Colors.white,
                        labelStyle: _themeData.textTheme.titleMedium!.merge(
                            TextStyle(
                                color: obj.isSelected.value
                                    ? Colors.white
                                    : _themeData.primaryColor,
                                fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(
                        width: 16,
                      )
                    ],
                  ));
            },
            scrollDirection: Axis.horizontal,
            itemCount: _controller.viewModel.categoryList.length,
            shrinkWrap: true)),
      ),
    );
  }
}
