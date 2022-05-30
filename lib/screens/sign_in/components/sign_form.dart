import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:saharago_b2b/components/custom_surfix_icon.dart';
import 'package:saharago_b2b/components/form_error.dart';
import 'package:saharago_b2b/helper/keyboard.dart';
import 'package:saharago_b2b/models/SignInModel.dart';
import 'package:saharago_b2b/providers/AuthProvider.dart';
import 'package:saharago_b2b/screens/forgot_password/forgot_password_screen.dart';
import 'package:saharago_b2b/screens/login_success/login_success_screen.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  // String? email;
  // String? password;
  SignInBody? signInBody;
  bool? remember = false;
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2050);

  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);

    var doSignIn = () {
      print('on doSignIn');

      final form = _formKey.currentState;

      try {
        if (form!.validate()) {
          form.save();

          auth.loggedInStatus = Status.Authenticating;
          auth.login(signInBody!);

          Future.delayed(loginTime).then((_) {
            Navigator.pushReplacementNamed(
                context, LoginSuccessScreen.routeName);
            auth.loggedInStatus = Status.LoggedIn;
          });

          /*// now check confirm password
        if(_password.endsWith(_confirmPassword)){
          auth.register(_username, _password).then((response) {
            if(response['status']){
              User user = response['data'];
              Provider.of<UserProvider>(context,listen: false).setUser(user);
              Navigator.pushReplacementNamed(context, '/login');
            }else{
              Flushbar(
                title: 'Registration fail',
                message: response.toString(),
                duration: Duration(seconds: 10),
              ).show(context);
            }
          });
        }else{
          Flushbar(
            title: 'Mismatch password',
            message: 'Please enter valid confirm password',
            duration: Duration(seconds: 10),
          ).show(context);
        }*/

        }
      } catch (e) {
        debugPrint(e.toString());
      }
      // if (form!.validate()) {
      //   form.save();

      //   auth.loggedInStatus = Status.Authenticating;
      //   auth.notify();

      //   Future.delayed(loginTime).then((_) {
      //     Navigator.pushReplacementNamed(context, '/login');
      //     auth.loggedInStatus = Status.LoggedIn;
      //     auth.notify();
      //   });

      //   /*// now check confirm password
      //   if(_password.endsWith(_confirmPassword)){
      //     auth.register(_username, _password).then((response) {
      //       if(response['status']){
      //         User user = response['data'];
      //         Provider.of<UserProvider>(context,listen: false).setUser(user);
      //         Navigator.pushReplacementNamed(context, '/login');
      //       }else{
      //         Flushbar(
      //           title: 'Registration fail',
      //           message: response.toString(),
      //           duration: Duration(seconds: 10),
      //         ).show(context);
      //       }
      //     });
      //   }else{
      //     Flushbar(
      //       title: 'Mismatch password',
      //       message: 'Please enter valid confirm password',
      //       duration: Duration(seconds: 10),
      //     ).show(context);
      //   }*/

      // } else {
      //   debugPrint('on doRegister else');
      // }
    };

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              try {
                doSignIn();
                // _formKey.currentState!.validate() ? doSignIn() : null;
                // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                //    if (_formKey.currentState!.validate()) {
                //   Navigator.pushNamed(context, OtpScreen.routeName);
                // }
              } catch (e) {
                // Get snack bar
                debugPrint(e.toString());
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => signInBody!.password = newValue.toString(),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(10),
          horizontal: getProportionateScreenWidth(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        labelText: "Email",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => signInBody!.email = newValue.toString().trim(),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(10),
          horizontal: getProportionateScreenWidth(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
