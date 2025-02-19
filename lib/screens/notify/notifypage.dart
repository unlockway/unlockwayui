import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/handlers/notify.handlers.dart';
import 'package:unlockway/handlers/recommendation.handlers.dart';
import 'package:unlockway/models/notify.dart';
import 'package:unlockway/models/recommendation.dart';
import 'package:unlockway/screens/notify/components/notify_card.dart';
import 'package:unlockway/screens/notify/components/notifydetails.dart';
import 'package:unlockway/screens/notify/components/recommendation_notify_card.dart';

class NotifyPage extends StatefulWidget {
  const NotifyPage({super.key});

  @override
  State<NotifyPage> createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage> {
  List<NotifyModel> notify = [];
  List<RecommendationModel> recommendations = []; // Lista para recomendações
  int notifyLenght = 0;
  bool _isLoading = true;
  String _currentView = "Notificações"; // Estado atual da tela

  Future<void> fetchNotify() async {
    List<NotifyModel> result = await getNotifyAPI(context);

    setState(() {
      notify = result;
      notifyLenght = notify.length;
      _isLoading = false;
    });
  }

  // Exemplo de carregamento de recomendações (pode ser substituído pela lógica real)
  void fetchRecommendations() {
    setState(() {
      _isLoading = true;
    });
    getPatientRecommendationAPI(context, userData.id!).then((result) {
      setState(() {
        recommendations = result;

        _isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchNotify();
    fetchRecommendations(); // Carregar recomendações
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Theme.of(context).colorScheme.outline,
          ),
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          title: Text(
            _currentView
                .toUpperCase(), // Atualiza com base na visualização atual
            style: TextStyle(
              color: Theme.of(context).colorScheme.outline,
              fontFamily: "Inter",
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: _currentView == "Notificações"
                                  ? Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.3)
                                  : Theme.of(context).colorScheme.onSurface,
                            ),
                            onPressed: () {
                              setState(() {
                                _currentView = "Notificações";
                              });
                            },
                            child: Text(
                              "Notificações",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: _currentView == "Recomendações"
                                  ? Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.3)
                                  : Theme.of(context).colorScheme.onSurface,
                            ),
                            onPressed: () {
                              setState(() {
                                _currentView = "Recomendações";
                              });
                            },
                            child: Text(
                              "Recomendações",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: _currentView == "Notificações"
                          ? buildGridViewNotify(notify)
                          : buildGridViewRecommendation(recommendations),
                    ),
                  ],
                ),
        ));
  }

  Widget buildGridViewNotify(List<NotifyModel> items) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 5,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        NotifyModel item = items[index];
        List<String> date = item.date.split("T");

        return Dismissible(
          key: Key(item.id),
          onDismissed: (direction) {
            setState(() {
              items.removeAt(index);
              if (_currentView == "Notificações") {
                notifyLenght = notify.length;
              }
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('${item.title} dismissed'),
            ));
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          child: NotifyCard(
            read: item.read,
            id: item.id,
            description: item.description,
            date: date[0],
            func: () {
              Navigator.of(context).push(
                _createRouteTwo(
                  item.description,
                  item.title,
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildGridViewRecommendation(List<RecommendationModel> items) {
    // Filtrar e inverter os itens
    List<RecommendationModel> filteredItems = items
        .where((item) => item.status != "APPROVED" && item.status != "DENIED")
        .toList()
        .reversed
        .toList(); // Inverte a ordem

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 5,
      ),
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        RecommendationModel item = filteredItems[index];
        return RecommendationNotifyCard(
          recommendation: item,
          setStateFunc: fetchRecommendations,
        );
      },
    );
  }

  Route _createRouteTwo(String text, String title) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          NotifyDetails(text: text, title: title),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
