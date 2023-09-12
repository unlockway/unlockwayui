import 'package:flutter/material.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: const Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              radius: 64.0,
              backgroundImage: AssetImage("assets/img/generic_profile.png"),
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Thomas Schmit",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Inter",
                    fontSize: 24.0,
                  ),
                ),
                Text(
                  "thomas.p.schmit@gmail.com",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
