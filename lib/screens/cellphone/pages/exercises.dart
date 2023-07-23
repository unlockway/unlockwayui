import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/cellphone/components/bottom_navigator.dart';
import 'package:unlockway/screens/cellphone/components/cards/card.dart';
import 'package:unlockway/screens/cellphone/components/button_new.dart';

class Exercise extends StatelessWidget {
  const Exercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(darkBgdark),
      bottomNavigationBar: const UBottomNavigator("Exercise"),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Color(darkBgdark),
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            height: 60,
            padding: const EdgeInsets.only(left: 5, right: 5),
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
                          title: "Peito",
                          imageUrl:
                              "https://img.championat.com/s/735x490/news/big/e/p/pochemu-u-vas-ne-poluchaetsya-otzhimatsya_1664801277205252492.jpg",
                        ),
                        UCard(
                          description:
                              "elit. Proin tristique eu nunc eu ultricies. Curabitur lorem elit, condimentum at lacus eu, ornare ultricies sem. Curabitur",
                          title: "Peito",
                          imageUrl:
                              "https://img.championat.com/s/735x490/news/big/e/p/pochemu-u-vas-ne-poluchaetsya-otzhimatsya_1664801277205252492.jpg",
                        ),
                        UCard(
                          description:
                              "elit. Proin tristique eu nunc eu ultricies. Curabitur lorem elit, condimentum at lacus eu, ornare ultricies sem. Curabitur",
                          title: "Peito",
                          imageUrl:
                              "https://img.championat.com/s/735x490/news/big/e/p/pochemu-u-vas-ne-poluchaetsya-otzhimatsya_1664801277205252492.jpg",
                        ),
                        UCard(
                          description:
                              "elit. Proin tristique eu nunc eu ultricies. Curabitur lorem elit, condimentum at lacus eu, ornare ultricies sem. Curabitur",
                          title: "Peito",
                          imageUrl:
                              "https://img.championat.com/s/735x490/news/big/e/p/pochemu-u-vas-ne-poluchaetsya-otzhimatsya_1664801277205252492.jpg",
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: ButtonNew(),
            ),
          ],
        ),
      ),
    );
  }
}
