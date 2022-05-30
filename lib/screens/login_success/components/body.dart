import 'package:flutter/material.dart';
import 'package:saharago_b2b/base.dart';
import 'package:saharago_b2b/components/default_button.dart';
import 'package:saharago_b2b/constants.dart';
import 'package:saharago_b2b/screens/home/home_screen.dart';
import 'package:saharago_b2b/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          "Welcome to Saharago",
          style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(25)),
        ),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        // SizedBox(height: SizeConfig.screenHeight * 0.08),
        // Text(
        //   "Login Success",
        //   style: TextStyle(
        //     fontSize: getProportionateScreenWidth(30),
        //     fontWeight: FontWeight.bold,
        //     color: Colors.black,
        //   ),
        // ),
        SizedBox(
          height: getProportionateScreenHeight(50),
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Go to home",
            press: () {
              Navigator.pushNamed(context, Base.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
