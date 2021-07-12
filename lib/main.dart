import 'package:flutter/material.dart';
import 'package:flutter_bilgi/question.dart';

import 'constant.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  int correctAnswer = 0;
  List<Widget> choose = [];

  Bank bank = Bank();

  void buttonPress(bool boolean) {
    if (bank.lastQuestion() == true) {
      setState(() {
        if (bank.getAnswer() == boolean) {
          choose.add(correct);
          correctAnswer++;
        } else {
          choose.add(wrong);
        }
      });
      showDialog(
          context: context,
          builder: (_) => new AlertDialog(
                title: new Text("Congratulations"),
                content: new Text('Correct Answer:$correctAnswer'),
                actions: <Widget>[
                  // ignore: deprecated_member_use
                  FlatButton(
                    child: Text(
                      'Restart',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        bank.reloadPage();
                        choose = [];
                        correctAnswer = 0;
                      });
                    },
                  )
                ],
              ));
    } else {
      setState(() {
        if (bank.getAnswer() == boolean) {
          choose.add(correct);
          correctAnswer++;
        } else {
          choose.add(wrong);
        }
        bank.increasIndex();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                bank.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: choose,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.red[400],
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        buttonPress(false);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.green[400],
                      child: Icon(Icons.thumb_up, size: 30.0),
                      onPressed: () {
                        buttonPress(true);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
