import 'package:analytics_ui/Constants/color_constant.dart';
import 'package:analytics_ui/Constants/icon_constatns.dart';
import 'package:analytics_ui/Screen/analytics/section_title_widget.dart';
import 'package:flutter/material.dart';

class SalesWidget extends StatelessWidget {
  SalesWidget({Key? key}) : super(key: key);

  late ThemeData _themeData;

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Scaffold(
      body: buildBody(),
    );
  }

  ///Build the body.
  Widget buildBody() {
    return Column(
      children: [
        SectionTitleWidget(sectionTitle: "Sales", viewMoreTap: () {}),
        const SizedBox(
          height: 20,
        ),
        Container(
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
              buildRevenueData(),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 0.5,
                thickness: 0.5,
                indent: 20,
                endIndent: 20,
                color: ColorConstants.dividerColor,
              ),
              const SizedBox(
                height: 14,
              ),
              buildRevenueRow(
                  title: "Revenue per available seat hour",
                  amount: "₹2,000",
                  icon: IconConstants.revenuePerAvailableHour),
              buildRevenueRow(
                  title: "Revenue per table",
                  amount: "₹2,000",
                  icon: IconConstants.revenuePerTable),
            ],
          ),
        ),
        const SizedBox(height: 12,),
        buildTotalRevenue()
      ],
    );
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

  Widget buildRevenueData() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Revenue",
                style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                    color: ColorConstants.textColor02,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
              ),
              const SizedBox(
                height: 4,
              ),
              Text("Total Revenue",
                  style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                      color: ColorConstants.textColor03,
                      fontSize: 10,
                      fontWeight: FontWeight.w400))),
            ],
          ),
          Row(
            children: [
              Text("₹2,000",
                  style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                      color: ColorConstants.green,
                      fontSize: 16,
                      fontWeight: FontWeight.w600))),
              const SizedBox(
                width: 8,
              ),
              Image.asset(IconConstants.upArrow,width: 20,height: 20,color: ColorConstants.green,)
            ],
          )
        ],
      ),
    );
  }

  Widget buildRevenueRow(
      {required String title, required String amount, required String icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                icon,
                width: 32,
                height: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                title,
                style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                    color: ColorConstants.textColor02,
                    fontWeight: FontWeight.w500,
                    fontSize: 12)),
              )
            ],
          ),
          Text(amount,
              style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                  color: ColorConstants.textColor02,
                  fontWeight: FontWeight.w500,
                  fontSize: 14)))
        ],
      ),
    );
  }

  Widget buildTotalRevenue() {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 16),
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
            Text("Total Revenue",
                style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                    color: ColorConstants.textColor03,
                    fontSize: 10,
                    fontWeight: FontWeight.w400))),
            const SizedBox(height: 4,),

            Row(
              children: [
                Text("₹2,000",
                    style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                        color: ColorConstants.textColor01,
                        fontSize: 24,
                        fontWeight: FontWeight.w700))),
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.arrow_drop_up_sharp,
                  color: ColorConstants.green,
                ),
                Text("6%",
                    style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                        color: ColorConstants.green,
                        fontSize: 12,
                        fontWeight: FontWeight.w400)))
              ],
            ),
            const SizedBox(height: 4,),
            Text("Compared to ₹1,800 yesturday",
                style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                    color: ColorConstants.textColorPurple,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)))
          ],
        ));
  }
}
