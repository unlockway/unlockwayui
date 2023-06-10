import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class UCard extends StatelessWidget {
  const UCard({
    super.key,
    required this.description,
    required this.title,
    this.subtitle,
    required this.imageUrl,
  });

  final String description;
  final String imageUrl;
  final String? subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 177,
      height: 288,
      decoration: BoxDecoration(
        color: darkBglight,
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 175,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 13.00),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Signika",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 19.02,
                  ),
                ),
                Text(
                  subtitle ?? "",
                  style: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              description,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
              ),
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
