import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/components/bottom_navigator.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/login/login.dart';
import 'package:unlockway/screens/settings/components/options.dart';
import 'package:unlockway/screens/settings/components/profile.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isAlertsAccepted = true;

  void onToggleAlert() {
    setState(() {
      isAlertsAccepted = !isAlertsAccepted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(darkBgdark),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Configurações".toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                SvgPicture.asset(
                  "assets/svgs/logo_mini.svg",
                  width: 28,
                  height: 28,
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const UBottomNavigator("Settings"),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            const ProfileSettings(),
            Container(
              margin: const EdgeInsets.only(top: 32.0),
              child: Column(
                children: [
                  SettingsOption(
                    icon: PhosphorIcons.regular.key,
                    label: "Privacidade",
                    onTap: () {},
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                  ),
                  InkWell(
                    onTap: onToggleAlert,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      margin: const EdgeInsets.only(top: 1.0),
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(darkBglight),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(PhosphorIcons.regular.bell, color: Colors.white),
                          const SizedBox(width: 16.0),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "Permitir Alertas".toUpperCase(),
                              style: const TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 28.0,
                            child: Switch(
                              activeColor: Color(primary),
                              inactiveTrackColor: Color(darkBg),
                              activeTrackColor: Color(primary),
                              thumbColor: MaterialStatePropertyAll(
                                isAlertsAccepted
                                    ? Color(darkBg)
                                    : Color(lightBgdark),
                              ),
                              value: isAlertsAccepted,
                              onChanged: (value) {
                                onToggleAlert();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SettingsOption(
                    icon: PhosphorIcons.regular.sun,
                    label: "Tema",
                    onTap: () {},
                  ),
                  SettingsOption(
                    icon: PhosphorIcons.regular.signOut,
                    label: "Desconectar",
                    onTap: () {
                      Navigator.of(context).push(
                        navigationPageLeftAnimation(
                          const Login(),
                        ),
                      );
                    },
                    iconColor: Color(danger),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.only(top: 16.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          width: 2, // Specify the border width
                          color: Color(primary), // Specify the border color
                        ),
                        fixedSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Termos de Uso".toUpperCase(),
                        style: TextStyle(
                          fontFamily: "Signika",
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Color(primary),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "© unlockway 2023",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                      color: Color(lightBglight),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
