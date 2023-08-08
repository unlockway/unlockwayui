import 'package:flutter/material.dart';
import 'package:unlockway/screens/cellphone/phone_scaffold.dart';
import 'package:unlockway/screens/tablet/tablet_scaffold.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final bool isPhone = constraints.maxWidth < 800;
      final Widget screen =
          isPhone ? const PhoneScaffold() : const TabletScaffold();
      return screen;
    });
  }
}
