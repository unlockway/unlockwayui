import 'package:flutter/material.dart';
import 'package:unlockway/screens/cellphone/components/drawer.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/cellphone/components/bottom_navigator.dart';
import 'package:unlockway/screens/cellphone/components/cards/daily_card.dart';
import 'package:unlockway/screens/cellphone/components/cards/info_card.dart';
import 'package:unlockway/screens/cellphone/components/cards/goalprogress.dart';

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
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(5),
                      shrinkWrap: true,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2,
                      children: const [
                        InfoCard(
                            text: "Próxima Refeição",
                            hour: "12:00",
                            description:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo eget ante condimentum mattis ac in lectus. Pellentesque scelerisque",
                            actiontitle: "Almoço"),
                        InfoCard(
                            text: "Próximo Exercicio",
                            hour: "12:00",
                            description:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo eget ante condimentum mattis ac in lectus. Pellentesque scelerisque",
                            actiontitle: "Dia de Perna"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const UDailyCard(
              description:
                  "Aquela receita simples e fácil, o strogonoff de carne é a escolha certa.",
              flag: "Prato do dia",
              imageUrl:
                  "https://img.cybercook.com.br/receitas/955/estrogonofe-de-carne-de-sol-com-leite-de-coco-e-mandioca-palha-840x480.jpeg?q=75",
              title: "Strogonoff de carne",
            ),
            const GoalCard(
                description:
                    "elit. Proin tristique eu nunc eu ultricies. Curabitur lorem elit, condimentum at lacus eu, ornare ultricies sem. Curabitur consequat nibh eu nisi accumsan consectetur",
                goal: "Progresso",
                progressporcentage: "25%",
                progressvalue: 0.25),
          ],
        ),
      ),
    );
  }
}
