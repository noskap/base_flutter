import 'package:bingus_bongus/approot.dart';
import 'package:flutter/material.dart';
import 'package:bingus_bongus/common/web_container.widget.dart';

import 'common/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => WebContainer(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          darkTheme: myTheme,
          theme: myTheme,
          home: const AppRoot(),
        ),
      );
}
