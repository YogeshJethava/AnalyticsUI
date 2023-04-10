import 'package:analytics_ui/Constants/color_constant.dart';
import 'package:flutter/material.dart';

class SectionTitleWidget extends StatelessWidget {
  SectionTitleWidget(
      {Key? key, required this.sectionTitle, required this.viewMoreTap})
      : super(key: key);
  final String sectionTitle;
  final Function() viewMoreTap;
  late ThemeData _themeData;
  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionTitle,
          style: _themeData.textTheme.bodyMedium!.merge(TextStyle(
              color: _themeData.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w600)),
        ),
        buildViewMore()
      ],
    );
  }

  Widget buildViewMore() {
    return InkWell(
      onTap: () {
        viewMoreTap();
      },
      child: Row(
        children: [
          Text(
            "View More",
            style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ColorConstants.textColor02)),
          ),
          const SizedBox(
            width: 16,
          ),
          const Icon(Icons.arrow_forward,color: ColorConstants.textColor02)
        ],
      ),
    );
  }
}
