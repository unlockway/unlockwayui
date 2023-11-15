import 'package:flutter/material.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/profile/profile.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    var user = userData as Map;

    return InkWell(
        onTap: () {
          Navigator.of(context).push(
            navigationPageRightAnimation(
              const UserProfile(),
            ),
          );
        },
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: BorderDirectional(
              bottom: BorderSide(
                width: 1,
                color: Color(darkBglight),
              ),
            ),
          ),
          padding: const EdgeInsets.only(
              bottom: 20.0, left: 8.0, right: 8.0, top: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Expanded(
                flex: 1,
                child: CircleAvatar(
                  radius: 64.0,
                  backgroundImage: AssetImage("assets/imgs/thomas.png"),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user['firstname'] + " " + user['lastname'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                          fontFamily: "Inter",
                          fontSize: 24.0,
                        ),
                      ),
                      Text(
                        user['email'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
