import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BingoBall.dart';
import 'FinalWin.dart';
import 'FinalLose.dart';

class Player extends StatefulWidget {
  final bool join;
  final bool host;
  final String playerName;

  Player({required this.host, required this.join, required this.playerName});

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  bool showWaiting = true;
  late Socket _socket;
  late String _userID;
  int inputnum = 1;
  late List<List<int>> bingoball =
      List.generate(5, (index) => List.filled(5, 0));
  late List<List<int>> bingowin =
      List.generate(5, (index) => List.filled(5, 0));
  bool fillReady = false;
  bool playing = false;
  bool win = false;
  String bingonum = '';
  @override
  void initState() {
    super.initState();
    _connectToServer();
  }

  void _connectToServer() async {
    try {
      _socket = await Socket.connect('10.201.32.205', 8000);
      _userID = widget.playerName;
      _socket.write(_userID);

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
      if (message == 'start')
        showWaiting = false;
      else {
        if (!win && message == 'Finish') {
          _socket.close();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FinalloseWidget(),
            ),
          );
        } else if (win && message == 'Finish') {
          _socket.close();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FinalwinWidget(),
            ),
          );
        }
        bingonum = message;
        for (int i = 0; i < 5; i++) {
          for (int j = 0; j < 5; j++) {
            if (bingoball[i][j].toString() == message) {
              bingowin[i][j] = 1;
            }
          }
        }
        if (winthegame(bingowin)) {
          win = true;
          _sendMessageToServer('Win');
        }
      }
    });
  }

  void _sendMessageToServer(String message) {
    _socket.write(message);
  }

  void _updateInputNum(int newInputNum, int row, int col) {
    setState(() {
      inputnum = newInputNum;
      bingoball[row][col] = newInputNum - 1;
      if (inputnum >= 26) fillReady = true;
    });
  }

  void _updateplaying(bool newplaing) {
    setState(() {
      playing = newplaing;
    });
  }

  List<Widget> _getBingoBallWidgets() {
    return [
      BingoBall(
        top: 350,
        left: 35,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 350,
        left: 105,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 350,
        left: 175,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 350,
        left: 245,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 350,
        left: 315,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 420,
        left: 35,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 420,
        left: 105,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 420,
        left: 175,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 420,
        left: 245,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 420,
        left: 315,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 490,
        left: 35,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 490,
        left: 105,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 490,
        left: 175,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 490,
        left: 245,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 490,
        left: 315,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 560,
        left: 35,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 560,
        left: 105,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 560,
        left: 175,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 560,
        left: 245,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 560,
        left: 315,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 630,
        left: 35,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 630,
        left: 105,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 630,
        left: 175,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 630,
        left: 245,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
      BingoBall(
        top: 630,
        left: 315,
        inputnum: inputnum,
        updateInputNum: _updateInputNum,
        playing: playing,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393,
      height: 852,
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 1),
      ),
      child: Stack(
        children: <Widget>[
          // 根据 showWaiting 的值来决定是否显示 "Waiting"
          Visibility(
            visible: showWaiting,
            child: Center(
              child: Text(
                'Waiting',
                textAlign: TextAlign.left,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color.fromRGBO(255, 255, 255, 1),
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
            visible: fillReady && playing,
            child: Positioned(
              top: 750,
              left: 160,
              child: Text(
                bingonum,
                textAlign: TextAlign.left,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Noto Sans',
                  fontSize: 50,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
            ),
          ),
          Visibility(
            visible: !showWaiting,
            child: Stack(
              children: <Widget>[
                ..._getBingoBallWidgets(),
              ],
            ),
          ),
          Visibility(
            visible: !fillReady && !showWaiting,
            child: Positioned(
              top: 750,
              left: 190,
              child: Text(
                inputnum.toString(), // 使用传入的文本内容
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Noto Sans',
                  fontSize: 50,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
            ),
          ),
          Visibility(
              visible: fillReady && !playing,
              child: ReadyButton(
                sendMessage: _sendMessageToServer,
                updateplaying: _updateplaying,
              )),
        ],
      ),
    );
  }
}

class ReadyButton extends StatefulWidget {
  final Function(String) sendMessage;
  final Function(bool) updateplaying;
  ReadyButton({required this.sendMessage, required this.updateplaying});
  @override
  _ReadyButtonState createState() => _ReadyButtonState();
}

class _ReadyButtonState extends State<ReadyButton> {
  Color containerColor = Color.fromRGBO(217, 217, 217, 1);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 750,
      left: 140,
      child: GestureDetector(
        onTap: () {
          setState(() {
            containerColor = Color.fromRGBO(98, 98, 98, 1);
            widget.sendMessage('Ready');
            widget.updateplaying(true);
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
                  'Ready', // 将按钮文本更改为 "Ready"
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
