// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/nutri_bottom_navigator.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/handlers/home.handlers.dart';
import 'package:unlockway/models/home_data.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/home/components/client_card.dart';
import 'package:unlockway/screens/notify/notifypage.dart';
import 'package:badges/badges.dart' as badges;

class NutriHome extends StatefulWidget {
  const NutriHome({
    super.key,
  });

  @override
  State<NutriHome> createState() => _NutriHomeState();
}

class _NutriHomeState extends State<NutriHome> {
  late NutriHomeDataModel homeData =
      const NutriHomeDataModel(notifications: 0, clients: []);
  dynamic actualRoutine;
  bool _isLoading = true;

  Future<void> fetchAnalysis() async {
    NutriHomeDataModel result = await getNutriHomeAnalysysAPI(context);

    setState(() {
      homeData = result;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    fetchAnalysis();
  }

  @override
  void dispose() {
    super.dispose();

    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = userData;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: const NutriBottomNavigator("Home"),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 0,
                left: 20,
                right: 20,
                top: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      user.photo != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              clipBehavior: Clip.hardEdge,
                              child: CachedNetworkImage(
                                imageUrl: user.photo as String,
                                fit: BoxFit.cover,
                                width: 64,
                                height: 64,
                                placeholder: (context, url) => CircleAvatar(
                                  backgroundColor: Color(primary),
                                  child: Text(
                                    (user.firstName!.substring(0, 1) +
                                            user.lastName!.substring(0, 1))
                                        .toUpperCase(),
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 44.0,
                                      color: Color(dark),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              width: 80,
                              height: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(primary),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                (user.firstName!.substring(0, 1) +
                                        user.lastName!.substring(0, 1))
                                    .toUpperCase(),
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 32.0,
                                  color: Color(dark),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Boa tarde,",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.outline),
                          ),
                          Text(
                            "${user.firstName} ${user.lastName}",
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).colorScheme.outline),
                          ),
                        ],
                      )
                    ],
                  ),
                  badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -3, end: -3),
                    showBadge: true,
                    ignorePointer: false,
                    onTap: () {},
                    badgeStyle: badges.BadgeStyle(
                      shape: badges.BadgeShape.circle,
                      badgeColor: homeData.notifications > 0
                          ? Color(danger)
                          : Colors.transparent,
                      padding: const EdgeInsets.all(5),
                      borderRadius: BorderRadius.circular(4),
                      elevation: 0,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          navigationPageRightAnimation(
                            const NotifyPage(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Theme.of(context).colorScheme.onSurface,
                        ),
                        padding: const WidgetStatePropertyAll(
                          EdgeInsets.all(8),
                        ),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      icon: homeData.notifications == 0
                          ? Icon(
                              Icons.notifications_none_outlined,
                              color: Theme.of(context).colorScheme.outline,
                            )
                          : Icon(
                              Icons.notifications_active,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(13),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Lista de Clientes",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                          fontFamily: "Inter",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: homeData.clients.length,
                      itemBuilder: (context, index) {
                        UserModel client = homeData.clients[index]!;

                        return ClientCard(user: client);
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
