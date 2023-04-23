import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  AppCard({Key? key, required this.child}) : super(key: key);
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
            child: child,
          ),
        ));
  }
}
