import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easypark/themes.dart';
import 'package:easypark/utils/user_preferences.dart';

AppBar buildAppBar(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
        icon: Icon(icon),
        onPressed: () {
          final theme = isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;

          //final switcher = ThemeSwitcher.of(context)!;
          //switcher.changeTheme(theme: theme);
        },
      ),
    ],
  );
}
