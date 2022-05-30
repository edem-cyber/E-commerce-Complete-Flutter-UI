import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text!,
            style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: getProportionateScreenWidth(15),
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        // Image.asset(
        //   image!,
        //   height: getProportionateScreenHeight(265),
        //   width: getProportionateScreenWidth(235),
        // ),
        Spacer(flex: 2),
        SvgPicture.asset(
          heading!,
          height: getProportionateScreenHeight(40),
          width: getProportionateScreenWidth(235),
        ),
        Spacer(flex: 2),
      ],
    );
  }
}
