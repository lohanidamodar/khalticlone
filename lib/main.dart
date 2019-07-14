import 'package:flutter/material.dart';
import 'package:khalticlone/res/colors.dart';
import 'package:khalticlone/ui/pages/auth/login.dart';
import 'package:khalticlone/ui/pages/home.dart';
import 'package:khalticlone/ui/pages/intro.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primary,
        accentColor: accent
      ),
      routes: {
        "/": (_) => IntroPage(),
        "home": (_) => HomePage(),
        "login": (_) => LoginPage(),
      },
    );
  }
}
