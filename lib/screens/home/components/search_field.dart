import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenHeight(10),
      ),
      // width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: Color(0xF5EBEBEB),
        // color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            // fillColor: Colors.black12,
            // filled: true,
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              color: kPrimaryColor,
            ),
            prefixIcon: Icon(
              Icons.search,
              size: getProportionateScreenWidth(35),
              color: kPrimaryColor,
            )),
      ),
    );
  }
}
