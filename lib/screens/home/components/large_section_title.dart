import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../size_config.dart';

class LargeSectionTitle extends StatelessWidget {
  const LargeSectionTitle({
    Key? key,
    required this.title,
    required this.press,
    required this.isExpandable,
  }) : super(key: key);

  final String title;
  final bool isExpandable;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(27),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: press,
            child: isExpandable? Text(
              "view all",
              style: TextStyle(
                  // color: Color(0xFFBBBBBB),
                  fontWeight: FontWeight.w200,
                  fontSize: getProportionateScreenWidth(18)),
            ) : SizedBox(),
          ),
        ],
      ),
    );
  }
}
