import 'package:analytics_ui/Constants/icon_constatns.dart';
import 'package:analytics_ui/Controllers/analytics/analytics_controller.dart';
import 'package:analytics_ui/Model/payment_mode_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/color_constant.dart';
import '../../Routes/route_constant.dart';
import 'section_title_widget.dart';

class PaymentWidget extends StatelessWidget {
  PaymentWidget({Key? key}) : super(key: key);
  final AnalyticsController _controller = Get.find(tag:RouteConstants.analyticsScreen);
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
        SectionTitleWidget(sectionTitle: "Payments", viewMoreTap: () {}),
        const SizedBox(
          height: 20,
        ),
        buildPaymentCard(),
      ],
    );
  }

  Widget buildPaymentCard() {
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
          buildPaymentData(),
          SizedBox(
            height: 12,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Expanded(flex: 20,child: Container(color: ColorConstants.paymentMode01,),),
                  Expanded(flex: 5,child: Container(color: ColorConstants.paymentMode02,),),
                  Expanded(flex: 10,child: Container(color: ColorConstants.paymentMode03,),),
                  Expanded(flex: 0,child: Container(color: ColorConstants.paymentMode04,),),
                  Expanded(flex: 2,child: Container(color: ColorConstants.paymentMode05,),),
                  Expanded(flex: 0,child: Container(color: ColorConstants.paymentMode06,),),
                  Expanded(flex: 5,child: Container(color: ColorConstants.paymentMode07,),),
                  Expanded(flex: 3,child: Container(color: ColorConstants.paymentMode08,),),
                  Expanded(flex: 2,child: Container(color: ColorConstants.paymentMode09,),),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
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
          Obx(() => ListView.builder(
            itemBuilder: (builder,index){
              final obj = _controller.viewModel.paymentTransaction[index];
              return buildPaymentModeRow(paymentModeModel: obj);
            },
            itemCount: _controller.viewModel.paymentTransaction.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ))
        ],
      ),
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

  Widget buildPaymentData() {
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
                "Payment Modes",
                style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                    color: ColorConstants.textColor02,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
              ),
              const SizedBox(
                height: 4,
              ),
              Text("Total Orders",
                  style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                      color: ColorConstants.textColor03,
                      fontSize: 10,
                      fontWeight: FontWeight.w400))),
            ],
          ),
          Row(
            children: [
              Text("72",
                  style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                      color: ColorConstants.textColorRed,
                      fontSize: 16,
                      fontWeight: FontWeight.w600))),
              const SizedBox(
                width: 8,
              ),
              Text("Transactions",style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                  color: ColorConstants.textColorRed,
                  fontSize: 10,
                  fontWeight: FontWeight.w400))),
              const SizedBox(
                width: 8,
              ),
              const Icon(
                Icons.arrow_drop_down_sharp,
                color: ColorConstants.textColorRed,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildPaymentModeRow(
      {required PaymentModeModel paymentModeModel}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: paymentModeModel.color,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Flexible(
                  child: Text(
                    paymentModeModel.paymentType,
                    maxLines: 2,
                    softWrap: true,
                    style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                        color: ColorConstants.textColor02,
                        fontWeight: FontWeight.w500,
                        fontSize: 12)),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(paymentModeModel.numberOfTransaction,
                    style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                        color: ColorConstants.textColor02,
                        fontWeight: FontWeight.w600,
                        fontSize: 12))),
                const SizedBox(width: 4,),
                Visibility(
                  visible: paymentModeModel.numberOfTransaction != "",
                  child: Text("Transactions",
                      style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                          color: ColorConstants.textColor02,
                          fontWeight: FontWeight.w400,
                          fontSize: 10))),
                )
              ],
            ),
          ),
          Expanded(
            child: Text(paymentModeModel.amount,textAlign: TextAlign.right,
                style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                    color: ColorConstants.textColor02,
                    fontSize: 14,
                    fontWeight: FontWeight.w600))),
          )
        ],
      ),
    );
  }
}
