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
  bool _isLoading = true;

  Future<void> fetchNotify() async {
    List<NotifyModel> result = await getNotifyAPI(context);

    setState(() {
      notify = result;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchNotify();
  }

  @override
  void dispose() {
    super.dispose();

    _isLoading = false;
    notify = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Theme.of(context).colorScheme.outline,
        ),
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        title: Text(
          "NOTIFICAÇÕES(${notify.length})",
          style: TextStyle(
              color: Theme.of(context).colorScheme.outline,
              fontFamily: "Inter",
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Marcar todas como lidas",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: constraints.maxHeight - 60,
                        ),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 5,
                          ),
                          shrinkWrap: true,
                          itemCount: notify.length,
                          itemBuilder: (context, index) {
                            NotifyModel actualNotification = notify[index];
                            List<String> date =
                                actualNotification.date.split(":");
                            return NotifyCard(
                              description: actualNotification.description,
                              date: date[0],
                              func: () {
                                Navigator.of(context).push(
                                  _createRouteTwo(
                                    actualNotification.description,
                                    actualNotification.title,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}

Route _createRouteTwo(String text, String title) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        NotifyDetails(text: text, title: title),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(
        1.0,
        0.0,
      );
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
