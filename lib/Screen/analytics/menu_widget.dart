import 'package:analytics_ui/Controllers/analytics/analytics_controller.dart';
import 'package:analytics_ui/Model/radial_chart_data_model.dart';
import 'package:analytics_ui/Screen/analytics/section_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart' as g;

import '../../Constants/color_constant.dart';
import '../../Routes/route_constant.dart';

class MenuWidget extends StatelessWidget {
  MenuWidget({Key? key}) : super(key: key);
  final AnalyticsController _controller =
      Get.find(tag: RouteConstants.analyticsScreen);
  late ThemeData _themeData;
  late BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    _context = context;
    return Scaffold(
      body: buildBody(),
    );
  }

  ///Build the body.
  Widget buildBody() {
    return Column(
      children: [
        SectionTitleWidget(sectionTitle: "Menu", viewMoreTap: () {}),
        const SizedBox(
          height: 20,
        ),
        buildMenuCard(),
        const SizedBox(
          height: 20,
        ),
        buildSellingCategory()
      ],
    );
  }

  Widget buildMenuCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: ColorConstants.shadowColor.withOpacity(0.1),
                offset: const Offset(0, 1),
                blurRadius: 2,
                spreadRadius: -1),
            BoxShadow(
                color: ColorConstants.shadowColor.withOpacity(0.1),
                offset: const Offset(0, 1),
                blurRadius: 3,
                spreadRadius: 0)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCategoryName(),
          buildMenuData(),
          const Divider(
            height: 0.5,
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
            color: ColorConstants.dividerColor,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 180,
                height: 180,
                alignment: Alignment.centerLeft,
                child: SfCircularChart(
                    series: <RadialBarSeries<RadialChartDataModel, int>>[
                      RadialBarSeries<RadialChartDataModel, int>(
                          useSeriesColor: false,
                          trackOpacity: 0.3,
                          cornerStyle: CornerStyle.bothCurve,
                          dataSource: _controller.viewModel.chartData,
                          pointRadiusMapper: (RadialChartDataModel data, _) =>
                              data.title,
                          pointColorMapper: (RadialChartDataModel data, _) =>
                              data.color,
                          xValueMapper: (RadialChartDataModel sales, _) => 0,
                          yValueMapper: (RadialChartDataModel sales, _) =>
                              sales.percentage.toInt(),
                          trackColor: ColorConstants.dividerColor,
                          radius: "70%",
                          gap: "12%",
                          maximumValue: 100,
                          enableTooltip: true)
                    ]),
              ),
              Expanded(
                  child: SizedBox(height: 120, child: buildSalesCategoryList()))
            ],
          )
        ],
      ),
    );
  }

  Widget buildSalesCategoryList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (builder, index) {
        final obj = _controller.viewModel.chartData[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: obj.color),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    obj.title,
                    style: _themeData.textTheme.titleMedium!.merge(
                        const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: ColorConstants.textColor02)),
                  )
                ],
              ),
              Text(
                "${obj.percentage.toInt()}%",
                style: _themeData.textTheme.titleMedium!.merge(const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorConstants.textColor02)),
              )
            ],
          ),
        );
      },
      itemCount: _controller.viewModel.chartData.length,
      shrinkWrap: true,
      reverse: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  Widget buildTopSellingCategoryList() {
    return Obx(() => ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (builder, index) {
            final obj = _controller.viewModel.topSellingCategory[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: obj.color),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        obj.category,
                        style: _themeData.textTheme.titleMedium!.merge(
                            const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: ColorConstants.textColor02)),
                      )
                    ],
                  ),
                  Text(
                    "${obj.amount}",
                    style: _themeData.textTheme.titleMedium!.merge(
                        const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: ColorConstants.textColor02)),
                  )
                ],
              ),
            );
          },
          itemCount: _controller.viewModel.topSellingCategory.length,
          shrinkWrap: true,
          reverse: false,
          physics: const NeverScrollableScrollPhysics(),
        ));
  }

  Widget buildCategoryName() {
    return Container(
      height: 20,
      width: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: const BoxDecoration(color: ColorConstants.yellow),
      child: Text(
        "TODAY",
        style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
            color: ColorConstants.textColor01,
            fontWeight: FontWeight.w400,
            fontSize: 10)),
      ),
    );
  }

  Widget buildMenuData() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        "Super Categories Sales",
        style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
            color: ColorConstants.textColor02,
            fontSize: 16,
            fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget buildTopSellingCategoryData() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        "Top Selling 5 Categories",
        style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
            color: ColorConstants.textColor02,
            fontSize: 16,
            fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget buildSellingCategory() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: ColorConstants.shadowColor.withOpacity(0.1),
                offset: const Offset(0, 1),
                blurRadius: 2,
                spreadRadius: -1),
            BoxShadow(
                color: ColorConstants.shadowColor.withOpacity(0.1),
                offset: const Offset(0, 1),
                blurRadius: 3,
                spreadRadius: 0)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCategoryName(),
          buildTopSellingCategoryData(),
          const Divider(
            height: 0.5,
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
            color: ColorConstants.dividerColor,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 180,
                height: 180,
                alignment: Alignment.centerLeft,
                child: g.SfRadialGauge(
                  axes: <g.RadialAxis>[
                    g.RadialAxis(
                      showLabels: false,
                      showAxisLine: false,
                      showTicks: false,
                      minimum: 0,
                      maximum: 99,
                      radiusFactor: 1,
                      startAngle: 180,
                      endAngle: 360,
                      ranges: <g.GaugeRange>[
                        g.GaugeRange(
                            startValue: 0,
                            endValue: 60,
                            color: ColorConstants.paymentMode01,
                            label: '',
                            sizeUnit: g.GaugeSizeUnit.factor,
                            startWidth: 0.65,
                            endWidth: 0.65),
                        g.GaugeRange(
                          startValue: 60,
                          endValue: 70,
                          color: ColorConstants.paymentMode08,
                          label: '',
                          startWidth: 0.65,
                          endWidth: 0.65,
                          sizeUnit: g.GaugeSizeUnit.factor,
                        ),
                        g.GaugeRange(
                          startValue: 70,
                          endValue: 80,
                          color: ColorConstants.paymentMode03,
                          label: '',
                          sizeUnit: g.GaugeSizeUnit.factor,
                          startWidth: 0.65,
                          endWidth: 0.65,
                        ),
                        g.GaugeRange(
                          startValue: 80,
                          endValue: 90,
                          color: ColorConstants.primaryColor,
                          label: '',
                          sizeUnit: g.GaugeSizeUnit.factor,
                          startWidth: 0.65,
                          endWidth: 0.65,
                        ),
                        g.GaugeRange(
                          startValue: 90,
                          endValue: 100,
                          color: ColorConstants.paymentMode02,
                          label: '',
                          sizeUnit: g.GaugeSizeUnit.factor,
                          startWidth: 0.65,
                          endWidth: 0.65,
                        ),
                      ],
                      pointers: const <g.GaugePointer>[

                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  child: SizedBox(
                      height: 120, child: buildTopSellingCategoryList()))
            ],
          )
        ],
      ),
    );
  }
}
