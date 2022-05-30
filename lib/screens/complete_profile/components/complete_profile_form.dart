import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:saharago_b2b/components/custom_surfix_icon.dart';
import 'package:saharago_b2b/components/default_button.dart';
import 'package:saharago_b2b/components/form_error.dart';
import 'package:saharago_b2b/providers/AuthProvider.dart';
import 'package:saharago_b2b/screens/otp/otp_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

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
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your phone address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
