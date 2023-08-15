import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;
  const Responsive(
    
    {
    super.key,
    Widget? tablet,
    required this.mobile,
    required this.desktop,
  }) : tablet = tablet;

  static bool isMobile(BuildContext ctx) =>
      MediaQuery.sizeOf(ctx).width < 800;

  static bool isTablet(BuildContext ctx) =>
      MediaQuery.sizeOf(ctx).width >= 800 &&
      MediaQuery.sizeOf(ctx).width < 1200;

  static bool isDesktop(BuildContext ctx) =>
      MediaQuery.sizeOf(ctx).width >= 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return desktop;
        } else if(constraints.maxWidth >=800){
          return tablet ?? mobile;
        }else{
          return mobile;
        }
      },
    );
  }
}
