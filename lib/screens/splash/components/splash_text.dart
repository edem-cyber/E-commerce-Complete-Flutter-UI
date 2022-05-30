import 'package:flutter/material.dart';
import 'package:saharago_b2b/constants.dart';

class SplashText extends StatelessWidget {
  const SplashText({Key? key, this.text, this.color}) : super(key: key);
  final String? text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        style: TextStyle(
          color: Colors.white,
        ));
  }
}
