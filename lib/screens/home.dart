import 'package:flutter/material.dart';
import 'package:unlockway/components/drawer.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/components/bottom_navigator.dart';
import 'package:unlockway/components/cards/daily_card.dart';
import 'package:unlockway/components/cards/info_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(darkBgdark),
      bottomNavigationBar: const UBottomNavigator("Home"),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: RichText(
          text: const TextSpan(
            text: 'Olá,',
            style: TextStyle(fontSize: 16, color: Colors.white),
            children: <TextSpan>[
              TextSpan(
                text: ' Daniel',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        backgroundColor: Color(darkBgdark),
      ),
      drawer: const UDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(13),
        child: const Column(
          children: [
            SizedBox(
              child: Column(
                children: [
                  Row(
                    children: [
                      InfoCard(text: "Próxima Refeição", hour: "12:00"),
                      InfoCard(text: "Próximo Exercício", hour: "18:00"),
                    ],
                  ),
                  UDailyCard(
                    description:
                        "Aquela receita simples e fácil, o strogonoff de carne é a escolha certa.",
                    flag: "Prato do dia",
                    imageUrl:
                        "https://img.cybercook.com.br/receitas/955/estrogonofe-de-carne-de-sol-com-leite-de-coco-e-mandioca-palha-840x480.jpeg?q=75",
                    title: "Strogonoff de carne",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
