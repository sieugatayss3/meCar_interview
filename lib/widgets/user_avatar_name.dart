import 'package:flutter/material.dart';

class UserAvatarAndName extends StatelessWidget {
  const UserAvatarAndName({
    Key key,
    this.name = '',
    this.avatar,
    this.code = '',
    this.color,
  }) : super(key: key);

  final String name, avatar, code;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage(avatar ?? 'assets/images/meo6.jpg'),
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                color: color ?? Colors.black,
                fontSize: 13.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              code,
              style: TextStyle(
                  color: color ?? Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400),
            ),
          ],
        )
      ],
    );
  }
}
