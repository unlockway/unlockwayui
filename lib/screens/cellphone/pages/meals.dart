import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/data/meals.dart';
import 'package:unlockway/screens/cellphone/components/bottom_navigator.dart';
import 'package:unlockway/screens/cellphone/components/buttons.dart';
import 'package:unlockway/screens/cellphone/components/cards/card.dart';
import 'package:unlockway/screens/cellphone/components/generic_form.dart';

class Meals extends StatefulWidget {
  const Meals({super.key});

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          alignment: Alignment.topCenter,
          insetPadding: const EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.only(top: 40),
            width: 200,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(darkBgdark),
              boxShadow: [
                BoxShadow(
                  color: Color(darkBglight),
                ),
                BoxShadow(
                  color: Color(darkBglight),
                  spreadRadius: 4.0,
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.only(right: 20, left: 20),
              child: Form(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const GenericForm(
                        title: "Categoria",
                        placeholder: "",
                        width: double.infinity),
                    const SizedBox(height: 20),
                    const GenericForm(
                        title: "Data de criação",
                        placeholder: "dd/mm/yyyy",
                        width: double.infinity),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonOutlined(
                            text: "Cancelar",
                            height: 48.0,
                            width: 600.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            }),
                        const SizedBox(width: 10),
                        ButtonFilled(
                          text: "Filtrar",
                          height: 48.0,
                          width: 600.0,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(darkBgdark),
      bottomNavigationBar: const UBottomNavigator("Meal"),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          margin:
              const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextField(
                  cursorColor: const Color.fromARGB(255, 155, 155, 155),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Color(darkBglight),
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
              const SizedBox(
                width: 10,
              ),
              Material(
                type: MaterialType.transparency,
                child: Ink(
                  decoration: BoxDecoration(
                    color: Color(darkBglight),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    //borderRadius: BorderRadius.circular(100.0),
                    onTap: () => _dialogBuilder(context),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.filter_list,
                        size: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
