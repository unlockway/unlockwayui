import 'package:flutter/material.dart';
import 'package:unlockway/screens/home/components/home_meal_card.dart';

class NextMeals extends StatelessWidget {
  const NextMeals({
    super.key,
    //required this.meals,
  });

  //final List<Object> meals;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Expanded(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            HomeMealCard(
              description:
                  "Descrição do alimento irá aqui. contendo informações de carboidratos e proteinas talvez.",
              hour: "7:00",
              category: "Almoço",
              imageUrl:
                  "https://www.receiteria.com.br/wp-content/uploads/receitas-de-almoco-rapido-1-730x449.jpg",
            ),
            HomeMealCard(
              description:
                  "Descrição do alimento irá aqui. contendo informações de carboidratos e proteinas talvez.",
              hour: "7:00",
              category: "Almoço",
              imageUrl:
                  "https://www.receiteria.com.br/wp-content/uploads/receitas-de-almoco-rapido-1-730x449.jpg",
            ),
            HomeMealCard(
              description:
                  "Descrição do alimento irá aqui. contendo informações de carboidratos e proteinas talvez.",
              hour: "7:00",
              category: "Almoço",
              imageUrl:
                  "https://www.receiteria.com.br/wp-content/uploads/receitas-de-almoco-rapido-1-730x449.jpg",
            ),
          ],
        ),
      ),
    );
  }
}
