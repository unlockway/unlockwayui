import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class ButtonNew extends StatelessWidget {
  const ButtonNew({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 3,
          color: Color(primary),
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      backgroundColor: const Color.fromARGB(26, 215, 255, 130),
      child: Icon(
        Icons.add,
        color: Color(primary),
        size: 35,
      ),
    );
  }
}
