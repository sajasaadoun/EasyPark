import 'dart:ffi';

import 'package:easypark/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:easypark/model/user.dart';
import 'package:easypark/screens/edit_profile_page.dart';
import 'package:easypark/utils/user_preferences.dart';
import 'package:easypark/widgets/appbar_widget.dart';
import 'package:easypark/widgets/profile_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class profilescreen extends StatelessWidget {
  profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    var profileinfo = Expanded(
      child: Column(children: [
        Container(
          height: kSpacingUnit.w * 10,
          width: kSpacingUnit.w * 10,
          margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
          child: Stack(
            children: [
              CircleAvatar(
                radius: kSpacingUnit.w * 5,
                backgroundImage: AssetImage('assets/images/doc.jpg'),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfilePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                    shape: CircleBorder(),
                  ),
                  child: Icon(
                    LineAwesomeIcons.pen,
                    color: kDarkPrimaryColor,
                    size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: kSpacingUnit.w * 2,
        ),
        Text(
          'Nicolas Adams',
          style: kTitleTextStyle,
        ),
        SizedBox(height: kSpacingUnit.w * 0.5),
        Text(
          'nicolasadams@gmail.com',
          style: kCaptionTextStyle,
        ),
        SizedBox(height: kSpacingUnit.w * 2),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
              child: Container(
                height: kSpacingUnit.w * 4,
                width: kSpacingUnit.w * 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                ),
                child: Center(
                  child: Text(
                    'Edit Info',
                    style: kButtonTextStyle,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: kSpacingUnit.w * 2,
            ),
            Row(
              children: [
                Text(
                  'About',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(kSpacingUnit.w * 3),
                    color: kDarkPrimaryColor,
                  ),
                ),
                SizedBox(width: kSpacingUnit.w * 2),
                Text(
                  'A MIU CS students',
                  style: kTitleTextStyle,
                ),
              ],
            ),
          ],
        ),
      ]),
    );
    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IconButton(
          icon: Icon(
            LineAwesomeIcons.arrow_left,
            size: ScreenUtil().setSp(kSpacingUnit.w * 3),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        profileinfo
      ],
    );
    return Scaffold(
        body: Column(children: <Widget>[
      SizedBox(
        height: kSpacingUnit.w * 5,
      ),
      header,
      Expanded(
          child: ListView(
        children: const <Widget>[
          ProfileListItem(
            icon: LineAwesomeIcons.user_shield,
            text: 'privacy',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.alternate_sign_out,
            text: 'Logout',
          )
        ],
      ))
    ]));
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final text;
  final bool hasNavigation;

  const ProfileListItem({
    Key? key,
    required this.icon,
    this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit.w * 5.5,
      margin: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 4,
      ).copyWith(
        bottom: kSpacingUnit.w * 2,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: kSpacingUnit.w * 2.5,
          ),
          SizedBox(
            width: kSpacingUnit.w * 2.5,
          ),
          Text(this.text,
              style: kTitleTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              )),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              LineAwesomeIcons.angle_right,
              size: kSpacingUnit.w * 2.5,
            ),
        ],
      ),
    );
  }
}
