import 'package:flutter/material.dart';
import 'package:saharago_b2b/components/product_card.dart';
import 'package:saharago_b2b/models/Product.dart';
import 'package:saharago_b2b/screens/home/components/large_section_title.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class TrendingProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: LargeSectionTitle(
            title: "Trending Products",
            press: () {},
            isExpandable: true,
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                ...List.generate(
                  demoProducts.length,
                  (index) {
                    return ProductCard(
                      product: demoProducts[index],
                      width: 150,
                    );
                  },
                ),
                // SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
