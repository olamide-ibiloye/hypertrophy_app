import 'package:flutter/material.dart';
import 'package:hypertrophy_app/constants.dart';
import 'package:hypertrophy_app/components/homepage_layout.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {super.key, required this.mobileBody, required this.tabletBody});

  final Widget mobileBody;
  final Widget tabletBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < kMobileWidth) {
        return HomePageLayout(
            mainBody: mobileBody);
      } else {
        return HomePageLayout(
            mainBody: tabletBody);
      }
    });
  }
}
