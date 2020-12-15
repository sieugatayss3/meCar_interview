import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:me_car_interview/configs/styles.dart';
import 'package:me_car_interview/model/image_model.dart';
import '../configs/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(Styles.globalPadding)),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: getProportionateScreenWidth(40),
                ),
                Text(
                  'Discover',
                  style: Styles.pageTitleStyle,
                ),
                SizedBox(
                  height: getProportionateScreenWidth(40),
                ),
                Text(
                  'What\'s new today'.toUpperCase(),
                  style: Styles.sectionTitleStyle,
                ),
                SizedBox(
                    height: getProportionateScreenWidth(
                        Styles.globalPadding * 1.2)),
                Image.asset(
                  'assets/images/meo2.jpg',
                  fit: BoxFit.cover,
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenWidth,
                ),
                SizedBox(
                  height:
                      getProportionateScreenWidth(Styles.globalPadding * 1.2),
                ),
                UserAvatarAndName(
                  avatar: 'assets/images/meo6.jpg',
                  name: 'reicky',
                  code: '@asgas',
                ),
                SizedBox(
                  height: getProportionateScreenWidth(Styles.globalPadding * 3),
                ),
                Text(
                  'Browse all'.toUpperCase(),
                  style: Styles.sectionTitleStyle,
                ),
                SizedBox(
                  height: getProportionateScreenWidth(Styles.globalPadding * 1.2),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    StaggeredGridView.countBuilder(
                      physics: ScrollPhysics(),
                      crossAxisCount: 2,
                      itemCount: imagedata.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                              color: Colors.green,
                              child: Image.asset(imagedata[index].image)),
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserAvatarAndName extends StatelessWidget {
  const UserAvatarAndName({
    Key key,
    this.name = '',
    this.avatar,
    this.code = '',
  }) : super(key: key);

  final String name, avatar, code;

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
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w900),
            ),
            Text(
              code,
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
            ),
          ],
        )
      ],
    );
  }
}
