import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:unlockway/components/text_field.dart';

typedef GoalsCallback = void Function(List<String> goals);
typedef BiotypeCallback = void Function(String? biotype);
typedef SexCallback = void Function(String? sex);

class RegisterStep1 extends StatefulWidget {
  const RegisterStep1({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.weightController,
    required this.heightController,
    required this.biotype,
    required this.goals,
    required this.sex,
    required this.onChangeBiotype,
    required this.onChangeGoals,
    required this.onChangeSex,
    required this.cfnController,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController weightController;
  final TextEditingController heightController;
  final TextEditingController cfnController;
  final String biotype;
  final String sex;
  final List<String> goals;

  final BiotypeCallback onChangeBiotype;
  final GoalsCallback onChangeGoals;
  final SexCallback onChangeSex;

  @override
  State<RegisterStep1> createState() => _RegisterStep1State();
}

class _RegisterStep1State extends State<RegisterStep1> {
  bool isNutritionist = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GenericTextField(
          placeholder: "Insira seu nome, ex: Marcela",
          title: "Nome",
          width: double.infinity,
          number: false,
          controller: widget.firstNameController,
        ),
        const SizedBox(height: 20),
        GenericTextField(
          placeholder: "Insira seu sobrenome, ex: Fernandes",
          title: "Sobrenome",
          width: double.infinity,
          number: false,
          controller: widget.lastNameController,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Flexible(
              child: GenericTextField(
                placeholder: "Ex: 88",
                title: "Peso",
                width: 200,
                controller: widget.weightController,
                number: true,
              ),
            ),
            const SizedBox(width: 30),
            Flexible(
              child: GenericTextField(
                placeholder: "Ex: 1,70",
                title: "Altura",
                width: 200,
                controller: widget.heightController,
                number: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          "Sexo",
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
            color: Theme.of(context).colorScheme.onSurface,
          ),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: DropdownButton<String>(
            dropdownColor: Theme.of(context).colorScheme.onSurface,
            borderRadius: BorderRadius.circular(6),
            isExpanded: true,
            value: widget.sex,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(
              color: Theme.of(context).colorScheme.outline,
              fontSize: 16,
              fontFamily: "Inter",
            ),
            onChanged: widget.onChangeSex,
            underline: Container(color: Colors.transparent),
            items: const [
              DropdownMenuItem(value: 'MALE', child: Text('Homem')),
              DropdownMenuItem(value: 'FEMALE', child: Text('Mulher')),
            ],
          ),
        ),
        const SizedBox(height: 20),
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
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.outline,
              fontFamily: "Inter",
              fontSize: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurface,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.onSurface),
              borderRadius: BorderRadius.circular(6),
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.onSurface,
          ),
          enabled: true,
          selected_values_style: TextStyle(
            color: Theme.of(context).colorScheme.outline,
          ),
          onChanged: widget.onChangeGoals,
          options: const [
            'Manter saúde',
            'Perder peso',
            'Ganhar músculo',
          ],
          selectedValues: widget.goals,
          whenEmpty: 'Diga-nos qual seu objetivo',
          menuItembuilder: (option) => Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Checkbox(
                  value: widget.goals.contains(option),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        widget.goals.add(option);
                      } else {
                        widget.goals.remove(option);
                      }
                      widget.onChangeGoals(widget.goals);
                    });
                  },
                ),
                Text(
                  option,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    fontSize: 16,
                    fontFamily: "Inter",
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Switch(
              value: isNutritionist,
              onChanged: (bool value) {
                setState(() {
                  if (value == false) {
                    widget.cfnController.clear();
                  }
                  isNutritionist = value;
                });
              },
            ),
            const Text(
              "Nutricionista?",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        if (isNutritionist)
          Column(
            children: [
              const SizedBox(height: 20),
              GenericTextField(
                placeholder: "Insira o número do seu registro CFN",
                title: "CFN",
                width: double.infinity,
                number: true,
                controller: widget.cfnController,
              ),
            ],
          ),
        const SizedBox(height: 20),
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
            color: Theme.of(context).colorScheme.onSurface,
          ),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: DropdownButton<String>(
            dropdownColor: Theme.of(context).colorScheme.onSurface,
            hint: const Text("EX: Endomorfo"),
            borderRadius: BorderRadius.circular(6),
            isExpanded: true,
            value: widget.biotype,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(
              color: Theme.of(context).colorScheme.outline,
              fontSize: 16,
              fontFamily: "Inter",
            ),
            onChanged: widget.onChangeBiotype,
            underline: Container(color: Colors.transparent),
            items: const [
              DropdownMenuItem(value: 'ECTOMORPH', child: Text('Ectomorfo')),
              DropdownMenuItem(value: 'ENDOMORPH', child: Text('Endomorfo')),
              DropdownMenuItem(value: 'MESOMORPH', child: Text('Mesomorfo')),
            ],
          ),
        ),
      ],
    );
  }
}
