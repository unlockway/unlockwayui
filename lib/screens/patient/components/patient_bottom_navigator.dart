import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PatientBottomNavigator extends StatelessWidget {
  const PatientBottomNavigator({
    super.key,
    required this.atual,
    required this.onPageChange,
  });
  final String atual;
  final Function(int) onPageChange; // Função para alternar páginas

  @override
  Widget build(BuildContext context) {
    // Define as cores para os ícones com base na página atual
    Color meal = Theme.of(context).colorScheme.outline;
    Color routine = Theme.of(context).colorScheme.outline;
    Color history = Theme.of(context).colorScheme.outline;

    if (atual == "Meal") {
      meal = Theme.of(context).colorScheme.primary;
    } else if (atual == "Routine") {
      routine = Theme.of(context).colorScheme.primary;
    } else if (atual == "History") {
      history = Theme.of(context).colorScheme.primary;
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: 60,
        margin: const EdgeInsets.only(
          bottom: 16,
          left: 16,
          right: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.onSurface,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => onPageChange(1), // Chama a função com o índice 1
              icon: Icon(
                PhosphorIcons.bowlFood(PhosphorIconsStyle.regular),
                size: 28,
                color: meal,
              ),
            ),
            IconButton(
              onPressed: () => onPageChange(2), // Chama a função com o índice 2
              icon: Icon(
                PhosphorIcons.timer(PhosphorIconsStyle.regular),
                size: 28,
                color: routine,
              ),
            ),
            IconButton(
              onPressed: () => onPageChange(3), // Chama a função com o índice 3
              icon: Icon(
                PhosphorIcons.scroll(PhosphorIconsStyle.regular),
                size: 28,
                color: history,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
