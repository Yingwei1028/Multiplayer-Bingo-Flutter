import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'FinalFinish.dart';

// ignore: must_be_immutable
class HostlobbyWidget extends StatefulWidget {
  final bool join;
  final bool host;
  final String playerName;

  HostlobbyWidget(
      {required this.host, required this.join, required this.playerName});

  @override
  _HostlobbyWidgetState createState() => _HostlobbyWidgetState();
}

class _HostlobbyWidgetState extends State<HostlobbyWidget> {
  late Socket _socket;
  int countPlayer = 0;
  List<String> playerIds = List.filled(3, ' ');
  bool ready = false;
  bool wait = true;

  @override
  void initState() {
    super.initState();
    _connectToServer();
  }

  void _connectToServer() async {
    try {
      _socket = await Socket.connect('10.201.32.205', 8000);

      _socket.listen(
        (List<int> event) {
          String message = utf8.decode(event);
          _handleMessage(message);
        },
        onError: (error) {
          print('Error: $error');
        },
        onDone: () {
          print('Disconnected from server');
        },
      );
    } catch (e) {
      print('Error connecting to server: $e');
    }
  }

  void _handleMessage(String message) {
    setState(() {
      if (!ready) {
        playerIds[countPlayer] = message;
        countPlayer++;
      }
      if (ready && wait) {
        if (message == 'Ready') {
          countPlayer--;
          if (countPlayer == 0) {
            wait = false;
          }
        }
      }
      if (message == 'Win') {
        _sendMessageToServer('Finish');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FinalfinishWidget(),
          ),
        );
        _socket.close();
      }
    });
  }

  void _sendMessageToServer(String message) {
    _socket.write(message);
  }

  void _setReady(bool value) {
    setState(() {
      ready = value;
    });
  }

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
          Visibility(
            visible: !ready,
            child: Positioned(
              top: 349,
              left: 129,
              child: Text(
                playerIds[0] != ' ' ? playerIds[0] : 'No Player',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  fontFamily: 'Noto Sans',
                  fontSize: 32,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
          ),
          Visibility(
            visible: !ready,
            child: Positioned(
              top: 404,
              left: 129,
              child: Text(
                playerIds[1] != ' ' ? playerIds[1] : 'No Player',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  fontFamily: 'Noto Sans',
                  fontSize: 32,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
          ),
          Visibility(
            visible: !ready,
            child: Positioned(
              top: 459,
              left: 129,
              child: Text(
                playerIds[2] != ' ' ? playerIds[2] : 'No Player',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  fontFamily: 'Noto Sans',
                  fontSize: 32,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
          ),
          Visibility(
            visible: !ready,
            child: StartButton(
              sendMessage: _sendMessageToServer,
              setReady: _setReady,
              playernum: countPlayer,
            ),
          ),
          Visibility(
            visible: wait && ready,
            child: Center(
              child: Text(
                'Waiting',
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
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 350,
              left: 35,
              inputnum: 1,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 350,
              left: 105,
              inputnum: 2,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 350,
              left: 175,
              inputnum: 3,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 350,
              left: 245,
              inputnum: 4,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 350,
              left: 315,
              inputnum: 5,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 420,
              left: 35,
              inputnum: 6,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 420,
              left: 105,
              inputnum: 7,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 420,
              left: 175,
              inputnum: 8,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 420,
              left: 245,
              inputnum: 9,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 420,
              left: 315,
              inputnum: 10,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 490,
              left: 35,
              inputnum: 11,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 490,
              left: 105,
              inputnum: 12,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 490,
              left: 175,
              inputnum: 13,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 490,
              left: 245,
              inputnum: 14,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 490,
              left: 315,
              inputnum: 15,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 560,
              left: 35,
              inputnum: 16,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 560,
              left: 105,
              inputnum: 17,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 560,
              left: 175,
              inputnum: 18,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 560,
              left: 245,
              inputnum: 19,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 560,
              left: 315,
              inputnum: 20,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 630,
              left: 35,
              inputnum: 21,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 630,
              left: 105,
              inputnum: 22,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 630,
              left: 175,
              inputnum: 23,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 630,
              left: 245,
              inputnum: 24,
              sendMessage: _sendMessageToServer,
            ),
          ),
          Visibility(
            visible: !wait,
            child: BingoBallHost(
              top: 630,
              left: 315,
              inputnum: 25,
              sendMessage: _sendMessageToServer,
            ),
          ),
        ],
      ),
    );
  }
}

class StartButton extends StatefulWidget {
  final Function(String) sendMessage;
  final Function(bool) setReady;
  final int playernum;
  StartButton(
      {required this.sendMessage,
      required this.setReady,
      required this.playernum});
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
            if (widget.playernum != 0) {
              containerColor = Color.fromRGBO(98, 98, 98, 1);
              // Assume 'start' is the message to send
              widget.sendMessage('start');
              widget.setReady(true);
            } else {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.warning,
                text: 'There is no player',
              );
            }
          });
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

class BingoBallHost extends StatefulWidget {
  final double top;
  final double left;
  final int inputnum; // 添加回调函数参数
  final Function(String) sendMessage;

  BingoBallHost({
    required this.top,
    required this.left,
    required this.inputnum,
    required this.sendMessage,
  });
  @override
  _BingoBallHostState createState() => _BingoBallHostState();
}

class _BingoBallHostState extends State<BingoBallHost> {
  Gradient colorball = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Colors.black,
      Colors.black,
    ],
  );
  Color colorbtext = Color.fromRGBO(255, 255, 255, 1);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
        top: widget.top,
        left: widget.left,
        child: GestureDetector(
          onTap: () {
            setState(() {
              colorball = LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(97, 207, 255, 1),
                  Color.fromRGBO(231, 90, 206, 1),
                  Color.fromRGBO(234, 186, 88, 1),
                ],
              );
              colorbtext = Color.fromRGBO(0, 0, 0, 1);
              widget.sendMessage(widget.inputnum.toString());
            });
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: colorball,
              //color: colorball,
              borderRadius: BorderRadius.all(Radius.elliptical(60, 60)),
            ),
            child: Center(
              child: Text(
                widget.inputnum.toString(), // 使用传入的文本内容
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: colorbtext,
                  fontFamily: 'Noto Sans',
                  fontSize: 16,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
