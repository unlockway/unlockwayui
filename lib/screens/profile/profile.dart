import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/constants.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({
    super.key,
    required this.firstname,
    required this.lastname,
    required this.weight,
    required this.height,
    required this.goals,
    required this.email,
    required this.biotype,
    required this.password,
  });

  final String firstname;
  final String lastname;
  final double weight;
  final double height;
  final List<String> goals;
  final String email;
  final String biotype;
  final String password;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final nameController = TextEditingController();
  final lastnameController = TextEditingController();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  List<String> goals = [];
  late String biotypeSelected;

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.firstname;
    lastnameController.text = widget.lastname;
    emailController.text = widget.email;
    alturaController.text = widget.height.toString();
    pesoController.text = widget.weight.toString();
    goals = widget.goals;
    biotypeSelected = widget.biotype;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(PhosphorIcons.regular.caretLeft),
        ),
        iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.outline, size: 32.0),
        title: Text(
          "Perfil".toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.outline,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            fontFamily: "Inter",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Salvar".toUpperCase(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Inter",
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 84.0,
                backgroundImage: AssetImage("assets/imgs/thomas.png"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GenericTextField(
                      title: "Nome",
                      placeholder: "Insira seu nome aqui",
                      width: double.infinity,
                      controller: nameController,
                      number: false,
                    ),
                    const SizedBox(height: 16.0),
                    GenericTextField(
                      title: "Sobrenome",
                      placeholder: "Insira seu sobrenome aqui",
                      width: double.infinity,
                      controller: lastnameController,
                      number: false,
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: GenericTextField(
                            title: "Peso",
                            placeholder: "KG",
                            width: double.infinity,
                            controller: pesoController,
                            number: true,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: GenericTextField(
                            title: "Altura",
                            placeholder: "0,00",
                            width: double.infinity,
                            controller: alturaController,
                            number: false,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      "Meta",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                        fontSize: 16,
                        fontFamily: "Inter",
                      ),
                    ),
                    const SizedBox(height: 5),
                    DropDownMultiSelect(
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                          color: Color(0xFF616B7C),
                          fontFamily: "Inter",
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onBackground,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(darkBgdark),
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(primarydark),
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.onBackground,
                        focusColor: Theme.of(context).colorScheme.onBackground,
                      ),
                      enabled: true,
                      selected_values_style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      onChanged: (List<String> x) {
                        setState(() {
                          goals = x;
                        });
                      },
                      options: const [
                        'Manter saúde',
                        'Perder peso',
                        'Ganhar músculo',
                      ],
                      selectedValues: goals,
                      whenEmpty: 'Diga-nos qual seu objetivo',
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      "Biotipo",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                        fontSize: 16,
                        fontFamily: "Inter",
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      child: DropdownButton<String>(
                          dropdownColor:
                              Theme.of(context).colorScheme.onBackground,
                          hint: const Text("EX: Endomorfo"),
                          borderRadius: BorderRadius.circular(6),
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.outline,
                            fontSize: 16,
                            fontFamily: "Inter",
                          ),
                          value: biotypeSelected,
                          onChanged: (String? newValue) {
                            setState(() {
                              biotypeSelected = newValue!;
                            });
                          },
                          underline: Container(
                            color: Colors.transparent,
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'ECTOMORPH',
                              child: Text('Ectomorfo'),
                            ),
                            DropdownMenuItem(
                              value: 'ENDOMORPH',
                              child: Text('Endomorfo'),
                            ),
                            DropdownMenuItem(
                              value: 'MESOMORPH',
                              child: Text('Mesomorfo'),
                            ),
                          ]
                          // items: <String>[
                          //   'Ectomorfo',
                          //   'Endomorfo',
                          //   'Mesomorfo',
                          // ].map<DropdownMenuItem<String>>((String value) {
                          //   return DropdownMenuItem<String>(
                          //     value: value,
                          //     child: Text(value),
                          //   );
                          // }).toList(),
                          ),
                    ),
                    const SizedBox(height: 24.0),
                    GenericTextField(
                      title: "E-mail",
                      placeholder: "Insira seu E-mail aqui",
                      width: double.infinity,
                      controller: emailController,
                      number: false,
                    ),
                    const SizedBox(height: 16.0),
                    GenericTextField(
                      title: "Nova Senha",
                      placeholder: "Digite nova senha",
                      width: double.infinity,
                      controller: senhaController,
                      number: false,
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      "© unlockway 2023",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
