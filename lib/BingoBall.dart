import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int coculateRow(double row) {
  switch (row) {
    case 350:
      return 0;
    case 420:
      return 1;
    case 490:
      return 2;
    case 560:
      return 3;
    case 630:
      return 4;
    default:
      throw Exception('Invalid row value: $row');
  }
}

int coculateCol(double col) {
  switch (col) {
    case 35:
      return 0;
    case 105:
      return 1;
    case 175:
      return 2;
    case 245:
      return 3;
    case 315:
      return 4;
    default:
      throw Exception('Invalid row value: $col');
  }
}

bool winthegame(List<List<int>> bingowin) {
  bool Final = false;
  bool win = false;
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      if (bingowin[i][j] == 1)
        win = true;
      else {
        win = false;
        break;
      }
    }
    if (win) Final = true;
  }
  win = false;
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      if (bingowin[j][i] == 1)
        win = true;
      else {
        win = false;
        break;
      }
    }
    if (win) Final = true;
  }
  win = false;
  for (int i = 0; i < 5; i++) {
    if (bingowin[i][i] == 1)
      win = true;
    else {
      win = false;
      break;
    }
  }
  if (win) Final = true;
  win = false;
  int j = 4;
  for (int i = 0; i < 4; i++) {
    if (bingowin[i][j] == 1)
      win = true;
    else {
      win = false;
      break;
    }
    j--;
  }
  if (win) Final = true;
  return Final;
}

// ignore: must_be_immutable
class BingoBall extends StatefulWidget {
  final double top;
  final double left;
  final int inputnum;
  late int row;
  late int col;
  late bool playing;
  final Function(int, int, int) updateInputNum; // 添加回调函数参数

  BingoBall(
      {required this.top,
      required this.left,
      required this.inputnum,
      required this.updateInputNum,
      required this.playing});
  @override
  _BingoBallState createState() => _BingoBallState();
}

class _BingoBallState extends State<BingoBall> {
  Gradient colorball = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      const Color.fromARGB(255, 255, 255, 255),
      Color.fromARGB(255, 255, 255, 255),
    ],
  );
  String text = 'Text';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
        top: widget.top,
        left: widget.left,
        child: GestureDetector(
          onTap: () {
            if (text == 'Text')
              widget.updateInputNum(widget.inputnum + 1,
                  coculateRow(widget.top), coculateCol(widget.left));
            setState(() {
              if (text == 'Text') {
                text = widget.inputnum.toString();
              }
              if (widget.playing) {
                colorball = LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromRGBO(97, 207, 255, 1),
                    Color.fromRGBO(231, 90, 206, 1),
                    Color.fromRGBO(234, 186, 88, 1),
                  ],
                );
              }
            });
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: colorball,
              borderRadius: BorderRadius.all(Radius.elliptical(60, 60)),
            ),
            child: Center(
              child: Text(
                text, // 使用传入的文本内容
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color.fromRGBO(0, 0, 0, 1),
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
