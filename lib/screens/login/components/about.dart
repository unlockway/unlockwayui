import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class AboutCover extends StatelessWidget {
  const AboutCover({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                // Ação quando o botão "Pular" for presionado
              },
              child: const Text(
                'Pular',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/image1.png'),
              const SizedBox(height: 15),
              const Text(
                textAlign: TextAlign.center,
                'Unlockway é um gerenciador\n inteligente de rotina alimentar e de\n exercícios físicos que te ajudará a \n desenvolver hábitos positivos e\n alcançar sua melhor forma.',
                style: TextStyle(
                  color: Colors.white,
                  height: 1.10,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Page2Content extends StatelessWidget {
  const Page2Content({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                // Ação quando o botão "Pular" for presionado
              },
              child: const Text(
                'Pular',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/image2.png', // Altere o caminho da imagem
                width: 150, // Largura da imagem reduzida
                height: 150, // Altura da imagem reduzida
              ),
              const SizedBox(
                  height: 80), // Espaçamento vertical entre a imagem e o texto
              const Text(
                textAlign: TextAlign.center,
                'Utilizamos de uma inteligência artificial\n para gerar as melhores recomendações\n alimentares para você.',
                style: TextStyle(
                  color: Colors.white,
                  height: 1.10,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Page3Content extends StatelessWidget {
  const Page3Content({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                // Ação quando o botão "Pular" for presionado
              },
              child: const Text(
                'Pular',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/image3.png', // Altere o caminho da imagem
                width: 150, // Largura da imagem reduzida
                height: 150, // Altura da imagem reduzida
              ),
              const SizedBox(
                  height: 80), // Espaçamento vertical entre a imagem e o texto
              const Text(
                textAlign: TextAlign.center,
                'Receba notificações em tempo real\n para se lembrar de se alimentar bem.',
                style: TextStyle(
                  color: Colors.white,
                  height: 1.10,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Page4Content extends StatelessWidget {
  const Page4Content({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                // Ação quando o botão "Pular" for presionado
              },
              child: const Text(
                'Fechar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/image4.png', // Altere o caminho da imagem
                width: 150, // Largura da imagem reduzida
                height: 150, // Altura da imagem reduzida
              ),
              const SizedBox(
                  height: 80), // Espaçamento vertical entre a imagem e o texto
              const Text(
                textAlign: TextAlign.center,
                'Acompanha sua porcentagem de\n progresso conforme gerencia seus\n melhores hábitos.', // Altere o texto
                style: TextStyle(
                  color: Colors.white,
                  height: 1.10,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  final PageController pageController = PageController();
  final List<Widget> contentList = [
    AboutCover(), // Página 0
    Page2Content(), // Página 1
    Page3Content(), // Página 2
    Page4Content(), // Página 3
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 0) {
            // Swiping right
            if (currentIndex > 0) {
              currentIndex--;
              pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            }
          } else {
            // Swiping left
            if (currentIndex < contentList.length - 1) {
              currentIndex++;
              pageController.nextPage(
                duration: Duration(milliseconds: 400),
                curve: Curves.ease,
              );
            }
          }
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/about_bg.png', // Altere o caminho da imagem
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Container(color: const Color(0xff242E39).withOpacity(0.90)),
            PageView(
              controller: pageController,
              children: contentList,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
            ),
            Positioned(
              bottom: 50,
              left: 50,
              right: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff242E39),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < 4; i++)
                      Container(
                        width: 19,
                        height: 40,
                        margin: const EdgeInsets.symmetric(horizontal: 0.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex == i
                              ? const Color(0xffABD84D)
                              : Colors.white,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
