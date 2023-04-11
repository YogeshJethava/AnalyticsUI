import 'package:analytics_ui/Screen/analytics/section_title_widget.dart';
import 'package:flutter/material.dart';

import '../../Constants/color_constant.dart';
import '../../Constants/icon_constatns.dart';

class OrdersWidget extends StatelessWidget {
   OrdersWidget({Key? key}) : super(key: key);

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
        SectionTitleWidget(sectionTitle: "Orders", viewMoreTap: () {}),
        const SizedBox(
          height: 20,
        ),
        buildOrderCard(),
        const SizedBox(
          height: 12,
        ),
        buildSalesCard()
      ],
    );
  }

  Widget buildOrderCard() {
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
            buildOrderData(),
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
                    Expanded(flex: 4,child: Container(color: ColorConstants.orderColor01,),),
                    Expanded(flex: 4,child: Container(color: ColorConstants.orderColor02,),),
                    Expanded(flex: 2,child: Container(color: ColorConstants.orderColor03,),),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 12,),
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
            buildOrderRow(
                title: "Ongoing",
                amount: "20",
                icon: IconConstants.onGoing),
            buildOrderRow(
                title: "Delivery",
                amount: "20",
                icon: IconConstants.delivery),
            buildOrderRow(
                title: "Takeaway",
                amount: "10",
                icon: IconConstants.takeAway),
          ],
        ),
      );
  }

   Widget buildSalesCard() {
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
           buildSalesData(),
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
           buildSalesRow(
               title: "Ongoing",
               order: "5",
               icon: IconConstants.onGoing, amount: '₹2,000',

           ),
           buildSalesRow(
               title: "Completed",
               order: "30",
               icon: IconConstants.completed, amount: '₹8,000'),

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

  Widget buildOrderData() {
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
                "Orders",
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
              Text("50",
                  style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                      color: ColorConstants.textColorRed,
                      fontSize: 16,
                      fontWeight: FontWeight.w600))),
              const SizedBox(
                width: 8,
              ),
              Text("Orders",style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                  color: ColorConstants.textColorRed,
                  fontSize: 10,
                  fontWeight: FontWeight.w400))),
              const SizedBox(
                width: 8,
              ),
              Image.asset(IconConstants.downArrow,width: 20,height: 20,color: ColorConstants.textColorRed,)
            ],
          )
        ],
      ),
    );
  }

   Widget buildSalesData() {
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
                 "Sales",
                 style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                     color: ColorConstants.textColor02,
                     fontSize: 16,
                     fontWeight: FontWeight.w600)),
               ),
               const SizedBox(
                 height: 4,
               ),
               Text("Total Gross Sales",
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

  Widget buildOrderRow(
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
          Row(
            children: [
              Text(amount,
                  style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                      color: ColorConstants.textColor02,
                      fontWeight: FontWeight.w500,
                      fontSize: 14))),
              const SizedBox(width: 4,),
              Text("Orders",
                  style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                      color: ColorConstants.textColor02,
                      fontWeight: FontWeight.w400,
                      fontSize: 10)))
            ],
          ),
        ],
      ),
    );
  }

   Widget buildSalesRow(
       {required String title, required String amount, required String icon,required String order}) {
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
           Row(
             children: [
               Row(
                 children: [
                   Text(order,
                       style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                           color: ColorConstants.textColor02,
                           fontWeight: FontWeight.w500,
                           fontSize: 14))),
                   const SizedBox(width: 4,),
                   Text("Orders",
                       style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                           color: ColorConstants.textColor02,
                           fontWeight: FontWeight.w400,
                           fontSize: 10)))
                 ],
               ),
               const SizedBox(width: 24,),
               Text(amount,
                   style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                       color: ColorConstants.textColor02,
                       fontSize: 16,
                       fontWeight: FontWeight.w600))),
             ],
           ),
         ],
       ),
     );
   }
}
