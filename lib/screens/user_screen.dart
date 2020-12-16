import 'package:flutter/material.dart';
import 'package:me_car_interview/core/app_localization.dart';
import 'package:me_car_interview/provider/auth_provider.dart';
import 'package:me_car_interview/widgets/custom_buttom.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Center(
            child: CustomRaisedButton(
          color: Colors.red,
          label: getTranslated(context, 'logout'),
          press: () async {
            await context.read<AuthService>().logout();
          },
        )),
      ),
    );
  }
}
