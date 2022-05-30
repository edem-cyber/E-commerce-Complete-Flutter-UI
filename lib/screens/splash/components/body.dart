import 'package:flutter/material.dart';
import 'package:saharago_b2b/constants.dart';
import 'package:saharago_b2b/screens/sign_in/sign_in_screen.dart';
import 'package:saharago_b2b/screens/splash/components/splash_text.dart';

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
      "image": "assets/images/man-smiling.jpg",
      "heading": "assets/images/drop.svg"
    },
    {
      "text":
          "Leverage SaharaPay to build your portfolio on \nour platform so we pre-finance your large shipments.",
      "image": "assets/images/woman-smiling.jpg",
      "heading": "assets/images/pay.svg"
    },
    {
      "text":
          "Leverage SaharaPay to build your portfolio on \nour platform so we pre-finance your large shipments.",
      "image": "assets/images/courier-scooter.jpg",
      "heading": "assets/images/go.svg"
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
        color: currentPage == index ? kPrimaryColor : Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            //color filter to make the image transparent
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.darken),
            image: AssetImage(splashData[index]["image"]!),
            fit: BoxFit.cover,
          )),
          child: SafeArea(
            child: Stack(
              // alignment: AlignmentDirectional.bottomCenter,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    // TextButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, SignInScreen.routeName);
                    //   },
                    //   child: SplashText(
                    //     text: "SKIP",
                    //   ),
                    // ),

                    TextButton(
                      onPressed: () {
                        if (currentPage < splashData.length - 1) {
                          nextPage();
                        } else {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        }
                      },
                      child: SplashText(
                        text: currentPage != splashData.length - 1
                            ? "NEXT"
                            : "GET STARTED",
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 20,
                  right: MediaQuery.of(context).size.width * 0.40,
                  left: MediaQuery.of(context).size.width * 0.40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                ),
                SplashContent(
                  // image: splashData[index]["image"],
                  heading: splashData[index]["heading"],
                  text: splashData[index]["text"],
                ),
              ],
            ),
          )),
      controller: _pageController,
      itemCount: splashData.length,
      onPageChanged: (index) {
        setState(() {
          currentPage = index;
        });
      },
      // child: Container(
      //   // color: Colors.black,
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage("assets/images/splash_bg.png"),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   width: double.infinity,
      //   child: Column(
      //     children: <Widget>[
      //       Expanded(
      //         flex: 3,
      //         child: PageView.builder(
      //           controller: _pageController,
      //           onPageChanged: (value) {
      //             setState(() {
      //               currentPage = value;
      //             });
      //           },
      //           itemCount: splashData.length,
      //           itemBuilder: (context, index) => SplashContent(
      //             image: splashData[index]["image"],
      //             heading: splashData[index]["heading"],
      //             text: splashData[index]['text'],
      //           ),
      //         ),
      //       ),
      // Expanded(
      //   flex: 2,
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(
      //         horizontal: getProportionateScreenWidth(20)),
      //     child: Column(
      //       children: <Widget>[
      //         Spacer(
      //           flex: 3,
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: List.generate(
      //             splashData.length,
      //             (index) => buildDot(index: index),
      //           ),
      //         ),
      //         Spacer(),
      //         // DefaultButton(
      //         //   text: "Continue",
      //         //   press: () {
      //         //     Navigator.pushNamed(context, SignInScreen.routeName);
      //         //   },
      //         // ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             TextButton(
      //               onPressed: () {
      //                 Navigator.pushNamed(
      //                     context, SignInScreen.routeName);
      //               },
      //               child: SplashText(
      //                 text: "SKIP",
      //               ),
      //             ),
      //             currentPage != splashData.length - 1
      //                 ? TextButton.icon(
      //                     onPressed: () {
      //                       if (currentPage < splashData.length - 1) {
      //                         nextPage();
      //                       } else {
      //                         Navigator.pushNamed(
      //                             context, SignInScreen.routeName);
      //                       }
      //                     },
      //                     icon: SplashText(
      //                       text: "NEXT",
      //                     ),
      //                     label: Icon(
      //                       Icons.arrow_forward_ios,
      //                       size: 20,
      //                       color: kPrimaryColor,
      //                     ),
      //                   )
      //                 : ElevatedButton(
      //                     onPressed: () {
      //                       Navigator.pushNamed(
      //                           context, SignInScreen.routeName);
      //                     },
      //                     style: ButtonStyle(
      //                       padding: MaterialStateProperty.all(
      //                           EdgeInsets.symmetric(horizontal: 20)),
      //                       backgroundColor:
      //                           MaterialStateProperty.all<Color>(
      //                         kPrimaryColor,
      //                       ),
      //                     ),
      //                     child: Text(
      //                       "GET STARTED",
      //                       style: TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ),
      //           ],
      //         ),
      //         Spacer(),
      //       ],
      //     ),
      //   ),
      // ),
      //       ],
      //     ),
      //   ),
    );
  }
}
