/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-09 22:30:22
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/theme/app_theme.dart
 */
import 'package:app/res/style.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff171616);
const kPrimaryLightColor = Color(0xff151515);
const primaryDarkColor = Color(0xff1d1d1d);
const secondaryColor = Color(0xff1f1f1f);
const secondaryLightColor = Color(0xff1c1c1c);
const secondaryDarkColor = Color(0xff000000);
// const primaryTextColor = Color(0xFFF1E6FF);
// const secondaryTextColor = Color(0xFFF1E6FF);

ThemeData get appThemeData => ThemeData(
      scaffoldBackgroundColor: Styles.styleBackgroundGray,
      primaryColor: kPrimaryColor,
      primaryColorLight: kPrimaryLightColor,
      accentColor: kPrimaryColor,
      appBarTheme: appBarTheme,
      textTheme: const TextTheme(),
      backgroundColor: Styles.styleBackgroundGray,
    );

AppBarTheme get appBarTheme => AppBarTheme(
      backgroundColor: Styles.styleBackgroundGray,
      toolbarHeight: 100,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 30,
      ),
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    );

Widget AppContainer({required Widget child}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    ),
  );
}
