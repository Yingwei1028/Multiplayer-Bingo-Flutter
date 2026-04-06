import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'PlayerLobby.dart';
import 'HostLobby.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Color containerColor = Color.fromRGBO(217, 217, 217, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393,
      height: 852,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 287,
            left: 116,
            child: Text(
              'Bingo',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(154, 150, 150, 1),
                fontFamily: 'Noto Sans',
                fontSize: 64,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          Positioned(
            top: 283,
            left: 115,
            child: Text(
              'Bingo',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Noto Sans',
                fontSize: 64,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          HostButton(),
          JoinButton(),
        ],
      ),
    );
  }
}

class HostButton extends StatefulWidget {
  @override
  _HostButtonState createState() => _HostButtonState();
}

class _HostButtonState extends State<HostButton> {
  Color containerColor = Color.fromRGBO(217, 217, 217, 1);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 402,
      left: 129,
      child: GestureDetector(
        onTap: () {
          setState(() {
            containerColor = Color.fromRGBO(98, 98, 98, 1);
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HostlobbyWidget(
                host: true,
                join: false,
                playerName: 'host',
              ),
            ),
          );
        },
        child: Container(
          width: 134,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            color: containerColor,
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 134,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    color: containerColor,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Host',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Noto Sans',
                    fontSize: 32,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JoinButton extends StatefulWidget {
  @override
  _JoinButtonState createState() => _JoinButtonState();
}

class _JoinButtonState extends State<JoinButton> {
  Color containerColor = Color.fromRGBO(217, 217, 217, 1);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 472,
      left: 129,
      child: GestureDetector(
        onTap: () {
          setState(() {
            containerColor = Color.fromRGBO(98, 98, 98, 1);
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Center(
                child: PlayerLobbyWidget(join: true),
              ),
            ),
          );
        },
        child: Container(
          width: 134,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            color: containerColor,
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 134,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    color: containerColor,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Join',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Noto Sans',
                    fontSize: 32,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
