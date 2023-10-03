import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class HomeMealCard extends StatelessWidget {
  const HomeMealCard({
    super.key,
    required this.description,
    required this.category,
    required this.hour,
    required this.imageUrl,
  });

  final String description;
  final String imageUrl;
  final String hour;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 177,
      height: 219,
      padding: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Color(darkBglight),
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
              height: 130,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 13.00),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Text(
                  hour,
                  style: const TextStyle(
                    fontFamily: "Signika",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 19.02,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  category,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Inter",
                    fontSize: 14.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(top: 4.0),
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                description,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: "Inter",
                ),
                maxLines: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
