import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/goals.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/profile/profile.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = userData;

    return InkWell(
        onTap: () {
          Navigator.of(context)
              .push(
            navigationPageRightAnimation(
              UserProfile(
                email: user.email!,
                biotype: user.biotype!,
                goals: setGoals(user.goals!),
                firstname: user.firstName!,
                lastname: user.lastName!,
                height: user.height!,
                sex: user.sex!,
                weight: user.weight!,
                password: "",
                userPhoto: user.photo == null ? "" : user.photo as String,
              ),
            ),
          )
              .then((value) {
            setState(() {});
          });
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
              Expanded(
                flex: 1,
                child: user.photo != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        clipBehavior: Clip.hardEdge,
                        child: CachedNetworkImage(
                          imageUrl: user.photo as String,
                          fit: BoxFit.cover,
                          width: 80,
                          height: 120,
                          placeholder: (context, url) => CircleAvatar(
                            backgroundColor: Color(primary),
                            child: Text(
                              (user.firstName!.substring(0, 1) +
                                      user.lastName!.substring(0, 1))
                                  .toUpperCase(),
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 44.0,
                                color: Color(dark),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(primary),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          (user.firstName!.substring(0, 1) +
                                  user.lastName!.substring(0, 1))
                              .toUpperCase(),
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 44.0,
                            color: Color(dark),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                        "${user.firstName} ${user.lastName}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                          fontFamily: "Inter",
                          fontSize: 24.0,
                        ),
                      ),
                      Text(
                        user.email!,
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

List<String> setGoals(Goals goals) {
  List<String> goalsArr = [];

  if (goals.gainMuscularMass) goalsArr.add("Ganhar músculo");
  if (goals.loseWeight) goalsArr.add("Perder peso");
  if (goals.maintainHealth) goalsArr.add("Manter saúde");

  return goalsArr;
}

String setBiotype(String bioType) {
  if (bioType == "ECTOMORPH") return "Ectomorfo";
  if (bioType == "MESOMORPH") return "Mesomorfo";
  return "Endomorfo";
}
