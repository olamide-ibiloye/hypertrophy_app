import 'auth.dart';
import 'package:hypertrophy_app/screens/responsive_layout.dart';
import 'package:hypertrophy_app/components/tablet_view_screen.dart';
import 'package:hypertrophy_app/components/mobile_view_screen.dart';
import '../screens/login_register_screen.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  static String id = 'widget_tree';

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const ResponsiveLayout(
              mobileBody: MobileViewScreen(),
              tabletBody: TabletViewScreen());
        } else {
          return const LoginAndRegisterPage();
        }
      },
    );
  }
}