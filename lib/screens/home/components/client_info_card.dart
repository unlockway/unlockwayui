import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/user.dart';

class ClientInfoCard extends StatelessWidget {
  const ClientInfoCard({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          user.photo != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  clipBehavior: Clip.hardEdge,
                  child: CachedNetworkImage(
                    imageUrl: user.photo as String,
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
                    placeholder: (context, url) => CircleAvatar(
                      backgroundColor: Color(primary),
                      child: Text(
                        (user.firstName!.substring(0, 1) +
                                user.lastName!.substring(0, 1))
                            .toUpperCase(),
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 44.0,
                          color: Theme.of(context).colorScheme.outline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              : CircleAvatar(
                  backgroundColor: Color(primary),
                  child: Text(
                    (user.firstName!.substring(0, 1) +
                            user.lastName!.substring(0, 1))
                        .toUpperCase(),
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 44.0,
                      color: Theme.of(context).colorScheme.outline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${user.firstName!} ${user.lastName!}".toUpperCase(),
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 20.0,
                  color: Theme.of(context).colorScheme.outline,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "Biótipo: ",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 14.0,
                    color: Theme.of(context).colorScheme.outline,
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    TextSpan(
                      text: user.biotype != null
                          ? user.getBiotypeAsText(user.biotype)
                          : "Não informado",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "Sexo: ",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 14.0,
                    color: Theme.of(context).colorScheme.outline,
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    TextSpan(
                      text: user.sex == "MALE" ? "Homem" : "Mulher",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "Altura: ",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 14.0,
                    color: Theme.of(context).colorScheme.outline,
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    TextSpan(
                      text: user.height != null
                          ? "${(user.height! / 100).toStringAsFixed(2)}m"
                          : "0.00m",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "Peso: ",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 14.0,
                    color: Theme.of(context).colorScheme.outline,
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    TextSpan(
                      text: "${user.weight}kg",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
