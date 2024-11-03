import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/components/bottom_navigator.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/patient_bottom_navigator.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/handlers/meals.handlers.dart';
import 'package:unlockway/models/ingredients.dart';
import 'package:unlockway/models/meals.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/meals/components/meal_card.dart';
import 'package:unlockway/screens/meals/components/meal_form.dart';
import 'package:unlockway/screens/recommendations/recommendations.dart';

class PatientMeals extends StatefulWidget {
  const PatientMeals({
    super.key,
    required this.patient,
  });

  final UserModel patient;

  @override
  State<PatientMeals> createState() => _PatientMealsState();
}

class _PatientMealsState extends State<PatientMeals> {
  late UserModel patient;
  TextEditingController searchController = TextEditingController();
  List<MealsModel> meals = [];
  bool _isLoading = true;
  Timer? _debounceTimer;

  Future<void> fetchMeals() async {
    List<MealsModel> result = await getPatientMealsAPI(
      context,
      patient.id!,
    );

    setState(() {
      meals = result;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    patient = widget.patient;
    fetchMeals();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    _debounceTimer?.cancel();
    _isLoading = false;
    meals = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar:
          PatientBottomNavigator("Meal", patient: widget.patient),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: AppBar(
          centerTitle: true,
          title: Text(
            "REFEIÇÕES",
            style: TextStyle(
              color: Theme.of(context).colorScheme.outline,
              fontWeight: FontWeight.bold,
              fontFamily: "Inter",
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Theme.of(context).colorScheme.outline,
            onPressed: () {
              navigatePage(context, Recommendations(patient: widget.patient));
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Container(
              margin: const EdgeInsets.only(
                  bottom: 10, left: 10, right: 10, top: 60),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TextField(
                          onChanged: (value) {
                            _onTextChanged(value);
                          },
                          cursorColor: const Color.fromARGB(255, 155, 155, 155),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          decoration: InputDecoration(
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.onSurface,
                            contentPadding: const EdgeInsets.all(10.0),
                            hintText: "Buscar",
                            suffixIcon: Icon(
                              Icons.search,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.outline,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 40,
        ),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : meals.isNotEmpty
                ? LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return CustomScrollView(
                        slivers: <Widget>[
                          SliverToBoxAdapter(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxHeight: constraints.maxHeight),
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
                                  MealsModel actualMeal = meals[index];
                                  List<SelectedFood> selectedingredients =
                                      actualMeal.ingredients.map((e) {
                                    return SelectedFood(
                                      e.id,
                                      e.amount,
                                    );
                                  }).toList();
                                  return UCard(
                                    description: actualMeal.description,
                                    title: actualMeal.name,
                                    imageURL: actualMeal.photo,
                                    category: actualMeal.category,
                                    idMeal: actualMeal.id,
                                    ingredients: selectedingredients,
                                    preparationMethod:
                                        actualMeal.preparationMethod,
                                    onEdit: fetchMeals,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        PhosphorIcons.bowlFood(PhosphorIconsStyle.regular),
                        size: 150,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 28,
                        ),
                        child: SizedBox(
                          child: Text(
                            textAlign: TextAlign.center,
                            "Não há refeições criadas, crie sua primeira refeição para que ela seja listada aqui.",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.outline,
                              fontFamily: "Inter",
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }

  void _onTextChanged(String value) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      List<MealsModel> resultName = await getMealsByNameAPI(context, value);
      setState(() {
        meals = resultName;
      });
    });
  }
}
