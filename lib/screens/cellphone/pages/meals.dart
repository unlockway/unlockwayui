import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/data/meals.dart';
import 'package:unlockway/screens/cellphone/components/bottom_navigator.dart';
import 'package:unlockway/screens/cellphone/components/button_new.dart';
import 'package:unlockway/screens/cellphone/components/cards/card.dart';

class Meals extends StatelessWidget {
  const Meals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const ButtonNew(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: constraints.maxHeight),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.850,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      shrinkWrap: true,
                      itemCount: meals.length,
                      itemBuilder: (context, index) {
                        for (var index in meals) {
                          return UCard(
                            description: index.description,
                            title: index.title,
                            imageUrl: index.img,
                          );
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
