import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:me_car_interview/configs/styles.dart';
import 'package:me_car_interview/model/image_model.dart';
import 'package:me_car_interview/provider/images_provider.dart';
import 'package:me_car_interview/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../configs/size_config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final imageServive = Provider.of<ImagesServive>(context);

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
                  height:
                      getProportionateScreenWidth(Styles.globalPadding * 1.2),
                ),
                buildGridView(imageServive.imagedata),
                SizedBox(
                  height: getProportionateScreenWidth(Styles.globalPadding * 2),
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomRaisedButton(
                    color: Colors.white,
                    label: 'See more',
                    press: () {
                      imageServive.loadMore();
                    },
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(Styles.globalPadding * 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildGridView(itemList) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StaggeredGridView.countBuilder(
          physics: ScrollPhysics(),
          crossAxisCount: 2,
          itemCount: itemList.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => Container(
              color: Colors.green, child: Image.asset(itemList[index].image)),
          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
      ],
    );
  }
}
