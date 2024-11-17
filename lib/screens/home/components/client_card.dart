import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/patient.dart';
import 'package:unlockway/models/user.dart';

class ClientCard extends StatelessWidget {
  const ClientCard({
    super.key,
    required this.user,
    required this.onTap,
  });

  final PatientUserModel user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            user.photo != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    clipBehavior: Clip.hardEdge,
                    child: CachedNetworkImage(
                      imageUrl: user.photo as String,
                      fit: BoxFit.cover,
                      width: 64,
                      height: 64,
                      placeholder: (context, url) => CircleAvatar(
                        backgroundColor: Color(primary),
                        child: Text(
                          (user.firstName!.substring(0, 1) +
                                  user.lastName!.substring(0, 1))
                              .toUpperCase(),
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 44.0,
                            color: Color(dark),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    width: 80,
                    height: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(primary),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      (user.firstName!.substring(0, 1) +
                              user.lastName!.substring(0, 1))
                          .toUpperCase(),
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 32.0,
                        color: Color(dark),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${user.firstName!} ${user.lastName!}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${(user.height! / 100).toStringAsFixed(2)}m",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "|",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${user.weight!.toStringAsFixed(0)}Kg",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
