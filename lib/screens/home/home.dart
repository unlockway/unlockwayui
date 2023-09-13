import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/components/utils/bottom_navigator.dart';
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
        child: Container(
          margin:
              const EdgeInsets.only(bottom: 0, left: 20, right: 20, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/img/generic_profile.png",
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
                        "Daniel Vieira",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    _createRoute(),
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
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(13),
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const NotifyPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(
        1.0,
        0.0,
      );
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
