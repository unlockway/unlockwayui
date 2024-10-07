import 'package:flutter/material.dart';
import 'package:unlockway/models/user.dart';

class ClientCard extends StatelessWidget {
  const ClientCard({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(),
    );
  }
}
