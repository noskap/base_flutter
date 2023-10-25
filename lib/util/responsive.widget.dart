
import 'package:bingus_bongus/common/constants.dart';
import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  static const double largeScreenSize = 1200;
  static const double mediumScreenSize = 800;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < mediumScreenSize;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > largeScreenSize;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= mediumScreenSize && MediaQuery.of(context).size.width <= largeScreenSize;
  }

  static double getMaxAppWidth(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (width > BingusBongusConstants.maxAppWidth) {
      return BingusBongusConstants.maxAppWidth;
    }
    return width;
  }

  static double getMaxBodyWidth(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (width > BingusBongusConstants.maxBodyWidth) {
      return BingusBongusConstants.maxBodyWidth;
    }
    return width;
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (_, __) {
      final double maxWidth = MediaQuery.of(context).size.width;
      if (maxWidth > largeScreenSize) {
        return largeScreen;
      } else if (maxWidth <= largeScreenSize && maxWidth >= mediumScreenSize) {
        return mediumScreen ?? largeScreen;
      } else {
        return smallScreen ?? largeScreen;
      }
    },
  );

  static T getResponsiveValue<T>({
    required BuildContext context,
    required T largeScreen,
    T? mediumScreen,
    T? smallScreen,
  }) {
    final double maxWidth = MediaQuery.of(context).size.width;
    if (maxWidth > largeScreenSize) {
      return largeScreen;
    } else if (maxWidth <= largeScreenSize && maxWidth >= mediumScreenSize) {
      return mediumScreen ?? largeScreen;
    } else {
      return smallScreen ?? largeScreen;
      // TODO ResponsiveWidget fix the above statement doesn't work when trying to pass null as a value
    }
  }
}
