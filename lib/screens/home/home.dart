import 'package:flutter/material.dart';
import 'package:unlockway/components/bottom_navigator.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/home/components/create_buttons.dart';
import 'package:unlockway/screens/home/components/home_graph/home_graph.dart';
import 'package:unlockway/screens/home/components/next_meals.dart';
import 'package:unlockway/screens/notify/notifypage.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(darkBgdark),
      bottomNavigationBar: const UBottomNavigator("Home"),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.only(
                  bottom: 0, left: 20, right: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "assets/imgs/thomas.png",
                          width: 50,
                          height: 50,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Boa tarde,",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Thomas Schmit",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        navigationPageRightAnimation(
                          const NotifyPage(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color(darkBglight),
                      ),
                      padding: const MaterialStatePropertyAll(
                        EdgeInsets.all(8),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    icon: const Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(13),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Próximas Refeições",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Inter",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              NextMeals(),
              SizedBox(
                height: 16,
              ),
              CreateButtons(),
              SizedBox(
                height: 32,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "CALORIAS POR DIA",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Inter",
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              HomeGraph(
                data: [
                  10,
                  20,
                  30,
                  40,
                  50,
                  60,
                  70,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
