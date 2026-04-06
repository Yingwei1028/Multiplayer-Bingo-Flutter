import 'package:flutter/material.dart';

class FinalloseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator FinalloseWidget - FRAME
    return Container(
        width: 393,
        height: 852,
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 357,
              left: 88,
              child: Text(
                'Lose',
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Noto Sans TC',
                    fontSize: 96,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
        ]));
  }
}
