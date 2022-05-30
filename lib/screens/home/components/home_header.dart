import 'package:flutter/material.dart';
import 'package:saharago_b2b/screens/cart/cart_screen.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Container(
        // height: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            SearchField(),
            // Spacer()
            // IconBtnWithCounter(
            //   svgSrc: "assets/icons/Cart Icon.svg",
            //   press: () => Navigator.pushNamed(context, CartScreen.routeName),
            // ),
            // IconBtnWithCounter(
            //   svgSrc: "assets/icons/Bell.svg",
            //   numOfitem: 3,
            //   press: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
