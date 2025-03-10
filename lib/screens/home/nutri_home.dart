// ignore_for_file: unused_field, use_build_context_synchronously

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/nutri_bottom_navigator.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/handlers/nutri.handlers.dart';
import 'package:unlockway/models/patient.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/home/components/client_card.dart';
import 'package:unlockway/screens/home/components/client_info.dart';
import 'package:unlockway/screens/home/components/delete_patient_popup.dart';
import 'package:unlockway/screens/home/components/new_patient_popup.dart';
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
  TextEditingController emailController = TextEditingController();
  late List<PatientUserModel> patients;
  dynamic actualRoutine;
  bool _isLoading = true;
  bool showClientInfo = false;
  PatientUserModel? selectedUser;
  Timer? _debounceTimer;

  Future<void> fetchClients() async {
    List<PatientUserModel> result = await getPatientsAPI(context);

    setState(() {
      patients = result;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    fetchClients();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _isLoading = false;
  }

  void _onClientCardTap(PatientUserModel user) {
    setState(() {
      showClientInfo = true;
      selectedUser = user;
    });
  }

  void _onBackButtonPressed() {
    setState(() {
      showClientInfo = false;
      selectedUser = null;
    });
  }

  void _deletePatient() async {
    Navigator.of(context, rootNavigator: true).pop('dialog');
    await deletePatientAPI(context, selectedUser!.relationId!);
    fetchClients();
    setState(() {
      showClientInfo = false;
      selectedUser = null;
    });
  }

  void _linkNewPatient() async {
    Navigator.of(context, rootNavigator: true).pop('dialog');
    await linkNewPatientAPI(context, emailController.text);
    fetchClients();
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = userData;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar:
          showClientInfo ? null : const NutriBottomNavigator("Home"),
      appBar: showClientInfo && selectedUser != null
          ? AppBar(
              centerTitle: true,
              title: Text(
                "PACIENTE",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.outline,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Theme.of(context).colorScheme.outline,
                onPressed: _onBackButtonPressed,
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Color(danger)),
                    ),
                    icon: const Icon(Icons.link_off),
                    color: Theme.of(context).colorScheme.outline,
                    onPressed: () {
                      modalBuilderBottomAnimation(
                        context,
                        DeletePatientPopup(
                          deleteFunction: _deletePatient,
                        ),
                      );
                    },
                  ),
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          : PreferredSize(
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
                                    color:
                                        Theme.of(context).colorScheme.outline),
                              ),
                              Text(
                                "${user.firstName} ${user.lastName}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        Theme.of(context).colorScheme.outline),
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
                          badgeColor: Colors.transparent,
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
                            icon: Icon(
                              Icons.notifications_none_outlined,
                              color: Theme.of(context).colorScheme.outline,
                            )),
                      ),
                    ],
                  ),
                ),
              )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.symmetric(
          horizontal: 13,
        ),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: showClientInfo && selectedUser != null
                    ? Column(
                        key: const ValueKey('ClientInfo'),
                        children: [
                          Expanded(child: ClientInfo(user: selectedUser!)),
                        ],
                      )
                    : Column(
                        key: const ValueKey('ClientList'),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: TextField(
                                  onChanged: (value) {
                                    _onTextChanged(value);
                                  },
                                  cursorColor:
                                      const Color.fromARGB(255, 155, 155, 155),
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ),
                                  decoration: InputDecoration(
                                    enabled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor:
                                        Theme.of(context).colorScheme.onSurface,
                                    contentPadding: const EdgeInsets.all(10.0),
                                    hintText: "Buscar",
                                    suffixIcon: Icon(
                                      Icons.search,
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    hintStyle: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    modalBuilderBottomAnimation(
                                      context,
                                      NewPatientPopup(
                                        emailController: emailController,
                                        addPatient: _linkNewPatient,
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: patients.isEmpty
                                ? Center(
                                    child: Text(
                                      "Nenhum paciente encontrado. Adicione um novo paciente.",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                        fontFamily: "Inter",
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: patients.length,
                                    itemBuilder: (context, index) {
                                      PatientUserModel client = patients[index];

                                      return ClientCard(
                                        user: client,
                                        onTap: () => _onClientCardTap(client),
                                      );
                                    },
                                  ),
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

  void _onTextChanged(String value) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      List<PatientUserModel> resultName =
          await getPatientsByNameAPI(context, value);
      setState(() {
        patients = resultName;
      });
    });
  }
}
