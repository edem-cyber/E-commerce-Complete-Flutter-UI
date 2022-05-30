import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saharago_b2b/models/Product.dart';
import 'package:saharago_b2b/screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: MediaQuery.of(context).size.height * 0.01,
          left: MediaQuery.of(context).size.height * 0.01),
      child: Container(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: product),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 0.8,
                child: Container(
                  // padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(product.images[0]),
                      fit: BoxFit.contain,
                    ),
                  ),

                  // tag: product.id.toString(),
                  // child: Image.asset(product.images[0]),
                ),
              ),
              AspectRatio(
                aspectRatio: 1.9,
                child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: getProportionateScreenHeight(15)),
                            Text(
                              "\$${product.price}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(15),
                                // fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10)),
                            Text(
                              product.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: getProportionateScreenWidth(14),
                              ),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          InkWell(
                            // borderRadius: BorderRadius.circular(50),
                            onTap: () {},
                            child: Container(
                              padding:
                                  EdgeInsets.all(getProportionateScreenWidth(8)),
                              height: getProportionateScreenWidth(28),
                              width: getProportionateScreenWidth(28),
                              child: Icon(product.isFavourite
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_outline),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
