import 'package:base_flutter/approot.dart';
import 'package:flutter/material.dart';

import 'common/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        darkTheme: myTheme,
        theme: myTheme,
        home: const AppRoot(),
      );
}
