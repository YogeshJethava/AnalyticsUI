import 'package:analytics_ui/Constants/color_constant.dart';
import 'package:analytics_ui/Constants/icon_constatns.dart';
import 'package:analytics_ui/Controllers/analytics/analytics_controller.dart';
import 'package:analytics_ui/Routes/route_constant.dart';
import 'package:analytics_ui/Screen/analytics/section_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WaiterWidget extends StatelessWidget {
  WaiterWidget({Key? key}) : super(key: key);

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
        SectionTitleWidget(sectionTitle: "Waiter", viewMoreTap: () {}),
        const SizedBox(
          height: 20,
        ),
        buildWaiterCard(),
        const SizedBox(
          height: 12,
        ),
        buildTaskCard(),
        const SizedBox(
          height: 12,
        ),
        buildTopPerformingWaiter()
      ],
    );
  }

  Widget buildWaiterCard() {
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
          buildWaiterData(),
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
            height: 12,
          ),
          buildWaiterRow(
              title: "Table served",
              amount: "1234",
              icon: IconConstants.tableServed),
          buildWaiterRow(
              title: "Guests per server per order",
              amount: "1234",
              icon: IconConstants.guestPerServedOrder),
          buildWaiterRow(
              title: "Per-person average",
              amount: "1234",
              icon: IconConstants.perPersonAverage),
          buildWaiterRow(
              title: "Average servicing time",
              amount: "1234",
              icon: IconConstants.averageServingTime),
        ],
      ),
    );
  }

  Widget buildTaskCard() {
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
          buildTaskData(),
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
                  Expanded(
                    flex: 8,
                    child: Container(
                      color: ColorConstants.orderColor01,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: ColorConstants.orderColor04,
                    ),
                  ),
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
            height: 12,
          ),
          SizedBox(
            height: 150,
            child: Obx(() => GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12),
                  itemBuilder: (builder, index) {
                    final obj = _controller.viewModel.taskList[index];
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: ColorConstants.tilesBackground,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            IconConstants.task,
                            width: 34,
                            height: 34,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(obj.amount,
                              style: _themeData.textTheme.bodyMedium!.merge(
                                  const TextStyle(
                                      color: ColorConstants.textColor01,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700))),
                          Text(obj.title,
                              style: _themeData.textTheme.bodyMedium!.merge(
                                  const TextStyle(
                                      color: ColorConstants.textColor03,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400))),
                        ],
                      ),
                    );
                  },
                  itemCount: _controller.viewModel.taskList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                )),
          )
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

  Widget buildWaiterData() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Servings",
            style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                color: ColorConstants.textColor02,
                fontSize: 16,
                fontWeight: FontWeight.w600)),
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
              Image.asset(IconConstants.downArrow,width: 20,height: 20,color: ColorConstants.textColorRed,)
            ],
          )
        ],
      ),
    );
  }

  Widget buildTaskData() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Tasks",
            style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                color: ColorConstants.textColor02,
                fontSize: 16,
                fontWeight: FontWeight.w600)),
          ),
          const SizedBox(
            height: 8,
          ),
          Text("Completed / Total",
              style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                  color: ColorConstants.textColor03,
                  fontSize: 10,
                  fontWeight: FontWeight.w400))),
          const SizedBox(
            height: 8,
          ),
          Text("230 / 300",
              style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                  color: ColorConstants.textColor02,
                  fontSize: 14,
                  fontWeight: FontWeight.w600)))
        ],
      ),
    );
  }

  Widget buildWaiterRow(
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
                  fontSize: 14))),
        ],
      ),
    );
  }

  Widget buildTopPerformingWaiter() {
    return Container(
      width: double.infinity,
      //padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
      child: Stack(
        children: [
          Positioned(right: 4,bottom: 4,child: Image.asset(IconConstants.starOutline,width: 100,height: 100,)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTopPerformingTitleRow(),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    buildProfilePicture(),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "Devon Lane",
                                  style: _themeData.textTheme.bodyMedium!.merge(
                                      const TextStyle(
                                          color: ColorConstants.textColor02,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                ),
                                Text(
                                  "Waiter",
                                  style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                                      color: ColorConstants.textColor02,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text("8501945495",
                              style: _themeData.textTheme.bodyMedium!.merge(
                                  const TextStyle(
                                      color: ColorConstants.textColor03,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500))),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child:
                            buildTitleValueBox(title: "Total Orders", value: "35")),
                    Expanded(
                        child: buildTitleValueBox(
                            title: "Total Sales", value: "₹2,000")),
                    Expanded(
                        child: buildTitleValueBox(
                            title: "Tips", value: "₹200", isShowBorder: false)),
                  ],
                ),
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
                buildViewTopFive(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Stack buildProfilePicture() {
    return Stack(
      children: [
        Container(
            decoration: const BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.hardEdge,
            width: 40,
            height: 40,
            child: Image.asset(
              IconConstants.userProfile,
              fit: BoxFit.cover,
            )),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 10,
            height: 10,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                color: ColorConstants.green),
          ),
        )
      ],
    );
  }

  Row buildTopPerformingTitleRow() {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: ColorConstants.paymentMode08,
          size: 24,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          "Top Performing Waiter",
          style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
              color: ColorConstants.textColor02,
              fontSize: 16,
              fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }

  Widget buildTitleValueBox(
      {required String title,
      required String value,
      bool isShowBorder = true}) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              right: BorderSide(
                  width: isShowBorder ? 0.5 : 0,
                  color: isShowBorder
                      ? ColorConstants.dividerColor
                      : Colors.transparent))),
      child: Column(
        children: [
          Text(value,
              style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                  color: ColorConstants.textColor02,
                  fontSize: 14,
                  fontWeight: FontWeight.w600))),
          const SizedBox(height: 4,),
          Text(title,
              style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                  color: ColorConstants.textColor03,
                  fontSize: 10,
                  fontWeight: FontWeight.w400))),
        ],
      ),
    );
  }

  Widget buildViewTopFive(){
    return TextButton(onPressed: (){}, child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Text("View Top 5",style: _themeData.textTheme.titleMedium!.merge(const TextStyle(color: ColorConstants.primaryColorDark,fontSize: 12,fontWeight: FontWeight.w600)),),
        const SizedBox(width: 8,),
        const Icon(Icons.keyboard_arrow_down_sharp,size: 20,)
      ],
    ));
    
  }
}
