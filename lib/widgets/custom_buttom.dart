
import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  const CustomRaisedButton({
    Key key,
    this.press,
    this.label,
    this.color,
  }) : super(key: key);

  final Function press;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: color,
        onPressed: press,
        padding: EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label.toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 13.0,
              color: color != Colors.black ? Colors.black : Colors.white),
        ));
  }
}
