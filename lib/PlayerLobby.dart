import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quickalert/quickalert.dart';
import 'Player.dart';

class PlayerLobbyWidget extends StatefulWidget {
  final bool join;
  PlayerLobbyWidget({required this.join});
  @override
  _PlayerLobbyWidgetState createState() => _PlayerLobbyWidgetState();
}

class _PlayerLobbyWidgetState extends State<PlayerLobbyWidget> {
  // 新增 TextEditingController
  final TextEditingController PlayerName = TextEditingController();
  @override
  void dispose() {
    // 記得在不需要時釋放 TextEditingController
    PlayerName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 393,
        height: 852,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 392,
              left: 39,
              child: Container(
                width: 316,
                height: 69,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
                child: Center(
                  child: TextField(
                    // 將TextEditingController與TextField關聯
                    controller: PlayerName,
                    enabled: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Noto Sans',
                      fontSize: 32,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter name',
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        fontFamily: 'Noto Sans',
                        fontSize: 32,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            StartButton(join: widget.join, PlayerName: PlayerName),
          ],
        ),
      ),
    );
  }
}

class StartButton extends StatefulWidget {
  final bool join;
  final TextEditingController PlayerName;
  StartButton({required this.join, required this.PlayerName});
  @override
  _StartButtonState createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  Color containerColor = Color.fromRGBO(217, 217, 217, 1);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 650,
      left: 129,
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (widget.PlayerName.text.isNotEmpty) {
              containerColor = Color.fromRGBO(98, 98, 98, 1);
            }
          });
          if (widget.PlayerName.text.isNotEmpty) {
            print(widget.PlayerName);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Player(
                  host: false,
                  join: widget.join,
                  playerName: widget.PlayerName.text,
                ),
              ),
            );
          } else {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.warning,
              text: 'You didnt enter name',
            );
          }
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
                  'Start',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.none,
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
