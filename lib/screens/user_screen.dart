import 'package:flutter/material.dart';
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
          label: 'Logout',
          press: () async {
            await context.read<AuthService>().logout();
          },
        )),
      ),
    );
  }
}
