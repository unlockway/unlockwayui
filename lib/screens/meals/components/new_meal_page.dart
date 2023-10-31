import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/meals/components/foods_selection_page.dart';
import 'package:unlockway/screens/meals/meals.dart';
import 'package:dotted_border/dotted_border.dart';

class NewMeal extends StatefulWidget {
  const NewMeal({
    super.key,
  });

  @override
  State<NewMeal> createState() => _NewMealState();
}

class _NewMealState extends State<NewMeal> {
  String selectedImagePath = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            ButtonOutlined(
              color: Theme.of(context).colorScheme.primary,
              text: "CANCELAR",
              height: 48,
              width: double.infinity,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(
              width: 15,
            ),
            ButtonFilled(
              text: "SALVAR",
              height: 48,
              width: double.infinity,
              onTap: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        flexibleSpace: Container(
          padding: const EdgeInsets.only(
            bottom: 16.0,
            left: 0.0,
            right: 16.0,
            top: 16.0,
          ),
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          navigationPageLeftAnimation(
                            const Meals(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 26.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      label: Text(
                        'VOLTAR',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                "assets/svgs/logo_mini.svg",
                width: 28,
                height: 28,
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  mealPhotoModal(
                    context,
                  );
                },
                child: selectedImagePath != ''
                    ? Container(
                        width: double.infinity,
                        height: 158,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.onBackground,
                            width: 2,
                          ),
                        ),
                        child: Image.file(
                          File(selectedImagePath),
                          fit: BoxFit.fitHeight,
                          width: double.infinity,
                          height: 158,
                        ),
                      )
                    : DottedBorder(
                        color: Theme.of(context).colorScheme.onBackground,
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        padding: const EdgeInsets.all(6),
                        dashPattern: const [10, 10],
                        strokeWidth: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 158,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                PhosphorIcons.regular.camera,
                                size: 94.0,
                                color: Theme.of(context).colorScheme.outline,
                              ),
                              Text(
                                "Escolha uma imagem",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Inter",
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              const GenericTextField(
                title: "Nome",
                placeholder: "Insira o nome da refeição",
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              const GenericTextField(
                title: "Categoria",
                placeholder: "Selecionar",
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    navigationPageRightAnimation(
                      const FoodSelectionPage(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color(darker),
                  ),
                  child: const Center(
                    child: Text(
                      "ESCOLHER INGREDIENTES",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Inter",
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const TextFieldMultline(
                title: "Descrição",
                placeholder: "Insira o nome da refeição",
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              const TextFieldMultline(
                title: "Modo de Preparo",
                placeholder:
                    "Escreva ou cole aqui o modo de preparo de sua refeição",
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }

  pickFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  pickFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  Future<void> mealPhotoModal(BuildContext context) async {
    return showModalBottomSheet<void>(
      enableDrag: true,
      context: context,
      useSafeArea: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 180,
              height: 6,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground,
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
            Container(
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      selectedImagePath = await pickFromCamera();

                      if (selectedImagePath != '') {
                        setState(() {});
                      } else {}
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 95,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onBackground,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Icon(
                              PhosphorIcons.regular.camera,
                              size: 60.0,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "Tirar Foto",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.outline,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () async {
                      selectedImagePath = await pickFromGallery();

                      if (selectedImagePath != '') {
                        setState(() {});
                      } else {}
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 95,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onBackground,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Icon(
                              PhosphorIcons.regular.images,
                              size: 60.0,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "Foto da Galeria",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.outline,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}