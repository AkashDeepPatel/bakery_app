import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../dashboard/bindings/dashboard_bindings.dart';
import '../../dashboard/screens/dashboard_screen.dart';
import '../../walkthrough/screens/walkthrough_screens.dart';

class AuthGate extends StatelessWidget {
  static const String routeName = "/auth";

  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DashboardBindings().dependencies();
          return DashboardScreen();
        } else {
          return WalkThroughScreens();
        }
      },
    );
  }
}
