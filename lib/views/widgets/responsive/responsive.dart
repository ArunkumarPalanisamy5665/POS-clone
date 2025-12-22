import 'package:flutter/material.dart';


class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const Responsive({super.key, required this.mobile, required this.tablet, required this.desktop});

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;


  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
          MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1160;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(

      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop;
        }
        else if (constraints.maxWidth >= 650) {
          return tablet;
        }
        else {
          return mobile;
        }
      },
    );
  }
}


class ResponsiveTwo extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveTwo({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });


  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isSmallTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
          MediaQuery.of(context).size.width < 780;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 780 &&
          MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;


  static int gridCount(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    if (w < 600) return 1;
    if (w < 780) return 2;
    if (w < 900) return 3;
    if (w < 1024) return 3;
    if (w < 1100) return 3;
    if (w < 1200) return 4;
    if (w < 1600) return 4;
    return 5;
  }


  static double gridAspect(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    if (w < 600) return 1.30;
    if (w < 650) return 1.150;
    if (w < 700) return 1.220;
    if (w < 780) return 1.280;
    if (w < 850) return 1.1;
    if (w < 950) return 1.150;
    if (w < 1000) return 1.220;
    if (w < 1024) return 1.080;
    if (w < 1050) return 1.050;
    if (w < 1080) return 1.050;
    if (w < 1100) return 1.1;
    if (w < 1120) return 0.95;
    if (w < 1150) return 0.98;
    if (w < 1200) return 1.0;
    if (w < 1300) return 0.99;
    if (w < 1440) return 1.060;
    // if (w < 1600) return 0.80;
    return 0.85;
  }

  static double gridAspectItems(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    if (w < 600) return 1.4;
    if (w < 650) return 1.350;
    if (w < 700) return 1.4;
    if (w < 780) return 1.4;
    if (w < 850) return 1.3;
    if (w < 950) return 1.350;
    if (w < 1000) return 1.3;
    if (w < 1024) return 1.4;
    if (w < 1050) return 1.140;
    if (w < 1080) return 1.150;
    if (w < 1100) return 1.20;
    if (w < 1120) return 1.10;
    if (w < 1150) return 1.10;
    if (w < 1200) return 1.160;
    if (w < 1300) return 1.2;
    if (w < 1440) return 2.060;
    // if (w < 1600) return 0.80;
    return 2.0;
  }


  static double imageAspectRatio(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    if (w < 600) return 16 / 9;
    if (w < 1000) return 2.2/ 1.1;
    if (w < 1024) return 2.2/ 1.0;
    if (w < 1100) return 2.5/ 1.3;
    if (w < 1200) return 2.5 / 1.3;
    if (w < 1300) return 2.8 / 1.5;
    if (w < 1440) return 2.8 / 1.8;
    return 3 / 2;
  }



  static bool showRightPanel(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1000;

  static double gridSpacing(BuildContext context) =>
      isMobile(context) ? 8 : 12;

  static EdgeInsets pagePadding(BuildContext context) =>
      EdgeInsets.all(isMobile(context) ? 12 : 16);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1024) {
          return desktop;
        } else if (constraints.maxWidth >= 600) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}


class ResponsiveHelper {
  // Breakpoints
  static bool isMobile(double w) => w < 600;
  static bool isTablet(double w) => w >= 600 && w < 1024;
  static bool isDesktop(double w) => w >= 1024 && w < 1440;
  static bool isLargeDesktop(double w) => w >= 1440;

  // Grid columns
  static int gridCount(double w) {
    if (w < 600) return 1;
    if (w < 780) return 2;
    if (w < 900) return 3;
    if (w < 1200) return 4;
    if (w < 1600) return 5;
    return 5;
  }

  // Card ratio
  static double gridAspect(double w) {
    if (w < 600) return 1.30;
    if (w < 780) return 1.0;
    if (w < 900) return 0.95;
    if (w < 1024) return 0.90;
    if (w < 1100) return 0.90;
    if (w < 1200) return 0.85;
    if (w < 1440) return 0.75;
    // if (w < 1600) return 0.80;
    return 0.85;
  }


  // Image ratio
  static double imageAspect(double w) {
    if (w < 600) return 16 / 9;
    if (w < 1200) return 3 / 2;
    return 4 / 3;
  }
}

