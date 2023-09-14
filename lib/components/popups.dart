import 'package:flutter/material.dart';

Future<void> dialogBuilderBottomAnimation(
  BuildContext context,
  Widget dialog,
) {
  return showGeneralDialog<void>(
    barrierColor: const Color.fromARGB(0, 255, 255, 255),
    context: context,
    transitionDuration: const Duration(milliseconds: 200),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(
        0.0,
        1.0,
      );
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return dialog;
    },
  );
}
