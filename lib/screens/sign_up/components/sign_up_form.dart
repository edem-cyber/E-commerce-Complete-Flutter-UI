import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:saharago_b2b/components/custom_surfix_icon.dart';
import 'package:saharago_b2b/components/default_button.dart';
import 'package:saharago_b2b/components/form_error.dart';
import 'package:saharago_b2b/providers/AuthProvider.dart';
import 'package:saharago_b2b/screens/complete_profile/complete_profile_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
  final _formKey = GlobalKey<FormState>();
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);
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

  var loading = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      CircularProgressIndicator(),
      Text(" Registering ... Please wait")
    ],
  );

  @override
  void initState() {
    late GlobalKey<FormState> formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    var doRegister = () {
      print('on doRegister');

      final form = _formKey.currentState;

      try {
        if (form!.validate()) {
          form.save();

          auth.loggedInStatus = Status.Authenticating;

          Future.delayed(loginTime).then((_) {
            Navigator.pushReplacementNamed(context, '/login');
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
      key: formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              // doRegister();
              // if all are valid then go to success screen
              Navigator.pushNamed(context, CompleteProfileScreen.routeName);
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
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
        labelText: "Password",
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
      onSaved: (newValue) => email = newValue,
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
