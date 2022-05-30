import 'package:flutter/material.dart';
import 'package:saharago_b2b/components/product_card.dart';
import 'package:saharago_b2b/models/Product.dart';
import 'package:saharago_b2b/screens/home/components/discount_banner.dart';
import 'package:saharago_b2b/screens/home/components/large_section_title.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class DiscountSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: LargeSectionTitle(title: "Deals", press: () {}, isExpandable: false,),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(s
        //     children: [
        //       DiscountBanner(),
        //       SizedBox(width: getProportionateScreenWidth(20)),
        //     ],
        //   ),
        // )
        DiscountBanner()
      ],
    );
  }
}
