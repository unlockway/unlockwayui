import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/components/bottom_navigator.dart';
import 'package:unlockway/components/cards/card.dart';

class Meals extends StatelessWidget {
  const Meals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(darkBgdark),
      bottomNavigationBar: const UBottomNavigator("Meal"),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Color(darkBgdark),
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            height: 60,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(darkBglight),
            ),
            width: double.infinity,
            child: Center(
              child: TextField(
                cursorColor: const Color.fromARGB(255, 155, 155, 155),
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  hintText: "Buscar",
                  suffixIcon: Icon(
                    Icons.search,
                    color: Color(lightBglight),
                  ),
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Color(lightBg),
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
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
                      childAspectRatio: 0.850,
                      primary: false,
                      padding: const EdgeInsets.all(5),
                      shrinkWrap: true,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: const [
                        UCard(
                          description:
                              "elit. Proin tristique eu nunc eu ultricies. Curabitur lorem elit, condimentum at lacus eu, ornare ultricies sem. Curabitur",
                          title: "Estrogonoff de Frango",
                          imageUrl:
                              "https://cdn0.tudoreceitas.com/pt/posts/6/8/8/strogonoff_de_frango_simples_9886_600.webp",
                        ),
                        UCard(
                          description:
                              "elit. Proin tristique eu nunc eu ultricies. Curabitur lorem elit, condimentum at lacus eu, ornare ultricies sem. Curabitur",
                          title: "Estrogonoff de Frango",
                          imageUrl:
                              "https://cdn0.tudoreceitas.com/pt/posts/6/8/8/strogonoff_de_frango_simples_9886_600.webp",
                        ),
                        UCard(
                          description:
                              "elit. Proin tristique eu nunc eu ultricies. Curabitur lorem elit, condimentum at lacus eu, ornare ultricies sem. Curabitur",
                          title: "Estrogonoff de Frango",
                          imageUrl:
                              "https://cdn0.tudoreceitas.com/pt/posts/6/8/8/strogonoff_de_frango_simples_9886_600.webp",
                        ),
                        UCard(
                          description:
                              "elit. Proin tristique eu nunc eu ultricies. Curabitur lorem elit, condimentum at lacus eu, ornare ultricies sem. Curabitur",
                          title: "Estrogonoff de Frango",
                          imageUrl:
                              "https://cdn0.tudoreceitas.com/pt/posts/6/8/8/strogonoff_de_frango_simples_9886_600.webp",
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(width: 4, color: Color(primarydark)),
                    color: Color.fromARGB(26, 215, 255, 130),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: InkWell(
                    //borderRadius: BorderRadius.circular(100.0),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.add,
                        size: 30.0,
                        color: Color(primarydark),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
