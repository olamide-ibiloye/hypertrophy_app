import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:hypertrophy_app/components/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:hypertrophy_app/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static String id = 'splash_screen';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int splashScreenDuration = 3;

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      loaderColor: Colors.white,
      logoWidth: 150,
      logo: Image.asset(
          'images/logo_w.png'),
      backgroundColor: kBrandColor,
      showLoader: true,
      navigator: WidgetTree.id,
      durationInSeconds: splashScreenDuration,
    );
  }
}