import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/app_bar.dart';
import 'package:unlockway/components/form_progress.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:unlockway/handlers/register.dart';
import 'package:unlockway/screens/register/inputs/step1.dart';
import 'package:unlockway/screens/register/inputs/step2.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var weightController = TextEditingController();
  var heightController = TextEditingController();

  String biotype = "ECTOMORPH";
  String sex = "MALE";
  List<String> goals = [];

  late int currentStep;

  @override
  void initState() {
    super.initState();
    currentStep = 1;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onBiotypeChange(String? newBiotype) {
    setState(() {
      biotype = newBiotype!;
    });
  }

  void onGoalsChange(List<String> newGoals) {
    setState(() {
      goals = newGoals;
    });
  }

  void onSexChange(String? newSex) {
    setState(() {
      sex = newSex!;
    });
  }

  void goToNextStep() {
    setState(() {
      currentStep = 2;
    });
  }

  void goToPreviousStep() {
    setState(() {
      currentStep = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          registerAppBar(context, currentStep == 1 ? null : goToPreviousStep),
      body: Stack(
        children: <Widget>[
          Positioned(
            width: MediaQuery.of(context).size.width,
            child: Theme.of(context).colorScheme.outline == Colors.white
                ? SvgPicture.asset("assets/svgs/register_bg.svg",
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height)
                : SvgPicture.asset("assets/svgs/register_bg_light.svg",
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Form(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormProgress(now: currentStep, steps: 2),
                      const SizedBox(
                        height: 20,
                      ),
                      (() {
                        if (currentStep == 1) {
                          return RegisterStep1(
                            firstNameController: firstNameController,
                            lastNameController: lastNameController,
                            weightController: weightController,
                            heightController: heightController,
                            biotype: biotype,
                            goals: goals,
                            sex: sex,
                            onChangeBiotype: onBiotypeChange,
                            onChangeGoals: onGoalsChange,
                            onChangeSex: onSexChange,
                          );
                        }
                        return RegisterStep2(
                          emailController: emailController,
                          passwordController: passwordController,
                          confirmPasswordController: confirmPasswordController,
                        );
                      }()),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 36),
                          width: 130,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).colorScheme.primary,
                                const Color.fromARGB(255, 171, 216, 77)
                              ],
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.5),
                                blurRadius: 1.5,
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => {
                                if (currentStep == 1)
                                  {goToNextStep()}
                                else
                                  {
                                    if (passwordController.text !=
                                        confirmPasswordController.text)
                                      {
                                        modalBuilderBottomAnimation(
                                          context,
                                          const SimplePopup(
                                            message: "Senhas não coincidêm",
                                          ),
                                        )
                                      }
                                    else
                                      {
                                        registerAPI(
                                          context,
                                          firstNameController.text,
                                          lastNameController.text,
                                          emailController.text,
                                          passwordController.text,
                                          double.parse(heightController.text),
                                          double.parse(weightController.text),
                                          goals,
                                          biotype,
                                          sex,
                                        )
                                      }
                                  }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    currentStep == 1 ? "Seguir" : "Confirmar",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_outlined,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
