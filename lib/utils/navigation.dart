import 'package:flutter/material.dart';

void navigatePage(BuildContext context, page) {
  Route createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  Navigator.of(context).push(createRoute());
}
