
import 'package:flutter/material.dart';
import 'package:bingus_bongus/common/busy_loader_container.widget.dart';
import 'package:bingus_bongus/common/left_drawer.widget.dart';
import 'package:bingus_bongus/util/responsive.widget.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar(this.child, {super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ResponsiveWidget.getResponsiveValue(context: context, largeScreen: 87, smallScreen: 65)),
          child: AppBar(),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 0),
            child: BusyLoaderContainer(child: child),
          ),
        ),
        drawer: ResponsiveWidget(
          smallScreen: const LeftDrawer(),
          largeScreen: Container(), // TODO ResponsiveWidget fix needs to be null
        ),
      );
}
