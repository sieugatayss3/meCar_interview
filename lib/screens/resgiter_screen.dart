import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:me_car_interview/configs/size_config.dart';
import 'package:me_car_interview/configs/styles.dart';
import 'package:me_car_interview/widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final _formKey = GlobalKey<FormState>();
    String email;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
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
              'Register',
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
                    onSaved: (value) => email = value,
                    onChanged: (value) => email = value,
                    decoration: InputDecoration(hintText: 'Email'),
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
                press: () {},
                color: Colors.black,
                label: 'Register',
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
