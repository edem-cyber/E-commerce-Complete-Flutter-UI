import 'package:flutter/widgets.dart';
import 'package:saharago_b2b/base.dart';
import 'package:saharago_b2b/screens/cart/cart_screen.dart';
import 'package:saharago_b2b/screens/complete_profile/complete_profile_screen.dart';
import 'package:saharago_b2b/screens/details/details_screen.dart';
import 'package:saharago_b2b/screens/forgot_password/forgot_password_screen.dart';
import 'package:saharago_b2b/screens/home/home_screen.dart';
import 'package:saharago_b2b/screens/login_success/login_success_screen.dart';
import 'package:saharago_b2b/screens/otp/otp_screen.dart';
import 'package:saharago_b2b/screens/profile/profile_screen.dart';
import 'package:saharago_b2b/screens/sign_in/sign_in_screen.dart';
import 'package:saharago_b2b/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  Base.routeName: (context) => Base(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
