import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saharago_b2b/size_config.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                expandedHeight: SizeConfig.screenHeight * 0.13,
                floating: true,
                pinned: true,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  // centerTitle: true,

                  title: SvgPicture.asset(
                    "assets/icons/greenlogo.svg",
                    // height: SizeConfig.screenHeight * 5,
                    width: SizeConfig.screenWidth * 0.37,
                  ),
                ),
              ),
            ];
          },
          body: Body()),
    );
  }
}
