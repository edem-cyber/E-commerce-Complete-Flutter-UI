import 'package:flutter/material.dart';
import 'package:saharago_b2b/screens/home/components/discount_section.dart';
import 'package:saharago_b2b/screens/home/components/trending_product.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(30)),
            TrendingProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
            DiscountSection(),
            // Categories(),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
