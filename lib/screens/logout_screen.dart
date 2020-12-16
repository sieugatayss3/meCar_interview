import 'package:flutter/material.dart';
import 'package:me_car_interview/configs/styles.dart';
import 'package:me_car_interview/widgets/widgets.dart';

class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/bg2.jpg"),
            fit: BoxFit.cover,
          )),
        ),
        Positioned(
          bottom: 120,
          left: 15,
          right: 0,
          child: UserAvatarAndName(
            avatar: 'assets/images/meo2.jpg',
            code: '@12345',
            name: 'abcName',
            color: Colors.white,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Styles.globalPadding, vertical: 20.0),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomRaisedButton(
                    press: () {},
                    label: 'Login',
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CustomRaisedButton(
                    press: () {},
                    label: 'Register',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
