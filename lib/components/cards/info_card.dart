import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class InfoCard extends StatelessWidget {

  const InfoCard({
    super.key,
    required this.text,
    required this.hour,
    required this.description,
    required this.actiontitle,
  });

  final String text;
  final String hour;
  final String description;
  final String actiontitle;
  

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
        color: Color(darkBglight),        
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              child: Text(text, style: const TextStyle(color: Colors.white, fontFamily: "Signika",
                        fontWeight: FontWeight.w500,
                        fontSize: 19.0,),),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5),),
                  color: Color(0xFF98A875),
                ),
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    Text(actiontitle, textAlign: TextAlign.center, style: const TextStyle(
                      fontFamily: "Signika",
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 19.0,
                    ),),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.only(bottom: 5, top: 5, left: 8, right: 8),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.access_alarm),
              Text(hour),
            ],
          ),
      ),
      ),
                    ],
                  )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
