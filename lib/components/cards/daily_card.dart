import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class UDailyCard extends StatelessWidget {
  const UDailyCard({
    super.key,
    required this.title,
    required this.flag,
    required this.description,
    required this.imageUrl,
  });

  final String description;
  final String imageUrl;
  final String flag;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 5, right: 5),
      height: 180,
      decoration: BoxDecoration(
        color: Color(darkBglight),
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: "Signika",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 19.0,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        description,
                        style: const TextStyle(
                          fontSize: 13,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white,
                        ),
                        maxLines: 5,
                      ),
                    ),
                  ),
                  Chip(
                    label: Text(flag),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                    backgroundColor: const Color(0xFF74BE96),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
