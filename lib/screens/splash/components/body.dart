import 'package:flutter/material.dart';
import 'package:saharago_b2b/constants.dart';
import 'package:saharago_b2b/screens/sign_in/sign_in_screen.dart';
import 'package:saharago_b2b/screens/splash/components/splash_text.dart';
import 'package:saharago_b2b/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text":
          "Use SaharaDrop to execute inbound deliveries & stock your inventory on the go!",
      "image": "assets/images/trucks.png",
      "heading": "assets/images/drop.png"
    },
    {
      "text":
          "Leverage SaharaPay to build your portfolio on \nour platform so we pre-finance your large shipments.",
      "image": "assets/images/card.png",
      "heading": "assets/images/pay.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/b2b.png",
      "heading": "assets/images/goblack.png"
    },
  ];

  PageController _pageController = PageController();

  void nextPage() {
    _pageController.animateToPage(_pageController.page!.toInt() + 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  heading: splashData[index]["heading"],
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    // DefaultButton(
                    //   text: "Continue",
                    //   press: () {
                    //     Navigator.pushNamed(context, SignInScreen.routeName);
                    //   },
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SignInScreen.routeName);
                          },
                          child: SplashText(
                            text: "SKIP",
                          ),
                        ),
                        currentPage != splashData.length - 1
                            ? TextButton(
                                onPressed: () {
                                  nextPage();
                                },
                                child: TextButton.icon(
                                  onPressed: () {
                                    if (currentPage < splashData.length - 1) {
                                      nextPage();
                                    } else {
                                      Navigator.pushNamed(
                                          context, SignInScreen.routeName);
                                    }
                                  },
                                  icon: SplashText(
                                    text: "NEXT",
                                  ),
                                  label: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, SignInScreen.routeName);
                                },
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(horizontal: 20)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    kPrimaryColor,
                                  ),
                                ),
                                child: Text(
                                  "GET STARTED",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
