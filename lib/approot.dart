import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.signInAnonymously();
    return Scaffold(
      appBar: AppBar(),
      // drawer: ChDrawer(),
      body: Text('Body'),
    );
  }
}
