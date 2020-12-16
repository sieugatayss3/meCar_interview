import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:me_car_interview/configs/configs.dart';
import 'package:me_car_interview/configs/size_config.dart';
import 'package:me_car_interview/configs/styles.dart';
import 'package:me_car_interview/provider/auth_provider.dart';
import 'package:me_car_interview/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _globalKey = GlobalKey<ScaffoldState>();
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: Styles.globalPadding,
          horizontal: getProportionateScreenWidth(Styles.globalPadding),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Login',
              style: Styles.pageTitleStyle,
            ),
            SizedBox(
              height: getProportionateScreenWidth(Styles.globalPadding * 3),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autocorrect: false,
                    validator: (value) {
                      if (value.isEmpty ||
                          !emailValidatorRegExp.hasMatch(value)) return '';
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) => email = value,
                    onChanged: (value) => email = value,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  SizedBox(
                    height:
                        getProportionateScreenWidth(Styles.globalPadding * 1.5),
                  ),
                  TextFormField(
                    obscureText: true,
                    autocorrect: false,
                    onSaved: (value) => password = value,
                    onChanged: (value) => password = value,
                    validator: (value) {
                      if (value.isEmpty) return '';
                      if (value.length < 7) {
                        return '';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: 'Password'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(Styles.globalPadding * 2),
            ),
            SizedBox(
              width: double.infinity,
              child: CustomRaisedButton(
                press: () async {
                  if (_formKey.currentState.validate()) {
                    if (!await context
                        .read<AuthService>()
                        .signInWithEmailAndPassword(
                            email: email, password: password)) {
                      _globalKey.currentState.showSnackBar(
                          SnackBar(content: Text('Unable to login.')));
                    } else {
                      Navigator.pop(context);
                    }
                  }
                },
                color: Colors.black,
                label: 'Login',
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(Styles.globalPadding * 2),
            ),
            Text.rich(TextSpan(
                style: TextStyle(height: 1.5, fontSize: 13.0),
                children: [
                  TextSpan(text: 'By signing up, you agree to Photo\'s '),
                  TextSpan(
                    text: 'Terms of Service',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('go Terms of Service');
                      },
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w900),
                  ),
                  TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Policy.',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('go Privacy Policy');
                      },
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w900),
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
