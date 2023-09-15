import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

Future<void> modalBuilderBottomAnimation(
  BuildContext context,
  Widget dialog,
) {
  return showModalBottomSheet<void>(
    enableDrag: true,
    context: context,
    useSafeArea: true,
    backgroundColor: const Color.fromRGBO(26, 36, 47, 1),
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: 180,
            height: 6,
            decoration: BoxDecoration(
              color: Color(darkBglight),
              borderRadius: BorderRadius.circular(9999),
            ),
          ),
          dialog,
        ],
      );
    },
  );
}
