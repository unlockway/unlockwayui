import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PendingActions extends StatelessWidget {
  const PendingActions({
    super.key,
    required this.meals,
    required this.routines,
  });

  final int meals;
  final int routines;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(6),
          color: Theme.of(context).colorScheme.onBackground,
        ),
        padding: const EdgeInsets.all(6),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                PhosphorIcons.warningCircle(PhosphorIconsStyle.regular),
                size: 32.0,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: Text(
                  "Você tem ações pendentes",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 19,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PendingPopup extends StatelessWidget {
  const PendingPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
    );
  }
}
