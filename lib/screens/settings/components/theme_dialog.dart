import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class ThemeDialog extends StatefulWidget {
  const ThemeDialog({super.key});

  @override
  State<ThemeDialog> createState() => _ThemeDialogState();
}

class _ThemeDialogState extends State<ThemeDialog> {
  var theme = "system";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(darker),
      ),
      height: 200,
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadioListTile(
            title: Text(
              "PADRÃO DO SISTEMA",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Inter",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            value: "system",
            groupValue: theme,
            onChanged: (value) {
              setState(() {
                theme = value.toString();
              });
            },
          ),
          RadioListTile(
            title: Text(
              "MODO CLARO",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Inter",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            value: "light",
            groupValue: theme,
            onChanged: (value) {
              setState(() {
                theme = value.toString();
              });
            },
          ),
          RadioListTile(
            title: Text(
              "MODO ESCURO",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Inter",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            value: "dark",
            groupValue: theme,
            onChanged: (value) {
              setState(() {
                theme = value.toString();
              });
            },
          ),
        ],
      ),
    );
  }
}

Future<void> themeModal(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return const Dialog(
        alignment: Alignment.center,
        insetPadding: EdgeInsets.all(0),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: ThemeDialog(),
      );
    },
  );
}
