import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class ButtonNew extends StatelessWidget {
  const ButtonNew({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(width: 4, color: Color(primarydark)),
          color: const Color.fromARGB(26, 215, 255, 130),
          borderRadius: BorderRadius.circular(100),
        ),
        child: InkWell(
          //borderRadius: BorderRadius.circular(100.0),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
              Icons.add,
              size: 30.0,
              color: Color(primarydark),
            ),
          ),
        ),
      ),
    );
  }
}
