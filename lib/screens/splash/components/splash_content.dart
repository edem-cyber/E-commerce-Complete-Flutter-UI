import 'package:flutter/material.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
    this.heading,
  }) : super(key: key);
  final String? text, image, heading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        // Text(
        //   "SAHARAGO",
        //   style: TextStyle(
        //     fontSize: getProportionateScreenWidth(36),
        //     color: kPrimaryColor,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        Spacer(flex: 2),
        Image.asset(
          image!,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
        Spacer(flex: 2),
        Image.asset(
          heading!,
          height: getProportionateScreenHeight(30),
          width: getProportionateScreenWidth(235),
        ),
        Spacer(flex: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            text!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
