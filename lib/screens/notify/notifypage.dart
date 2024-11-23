import 'package:flutter/material.dart';
import 'package:unlockway/handlers/notify.handlers.dart';
import 'package:unlockway/models/notify.dart';
import 'package:unlockway/screens/notify/components/notify_card.dart';
import 'package:unlockway/screens/notify/components/notifydetails.dart';

class NotifyPage extends StatefulWidget {
  const NotifyPage({super.key});

  @override
  State<NotifyPage> createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage> {
  List<NotifyModel> notify = [];
  List<NotifyModel> recommendations = []; // Lista para recomendações
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
  Future<void> fetchRecommendations() async {
    // Simula uma lista de recomendações
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      recommendations = List.generate(
        5,
        (index) => NotifyModel(
          id: "rec-$index",
          title: "Recomendação $index",
          description: "Descrição da Recomendação $index",
          date: "2024-11-23T00:00:00",
          read: false,
        ),
      );
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
          _currentView.toUpperCase(), // Atualiza com base na visualização atual
          style: TextStyle(
            color: Theme.of(context).colorScheme.outline,
            fontFamily: "Inter",
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentView = "Notificações";
                        });
                      },
                      child: const Text("Notificações"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentView = "Recomendações";
                        });
                      },
                      child: const Text("Recomendações"),
                    ),
                  ],
                ),
                Expanded(
                  child: _currentView == "Notificações"
                      ? buildGridView(notify)
                      : buildGridView(recommendations),
                ),
              ],
            ),
    );
  }

  Widget buildGridView(List<NotifyModel> items) {
    return GridView.builder(
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
