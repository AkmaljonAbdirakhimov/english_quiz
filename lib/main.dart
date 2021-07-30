import 'package:flutter/material.dart';

import './widgets/savol.dart';
import './widgets/natija.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> savollarVaJavoblar = [
    {
      "savol": "1. What ____ your name?",
      "javoblar": [
        {"matn": "are", "togrimi": false},
        {"matn": "is", "togrimi": true},
        {"matn": "hello", "togrimi": false},
        {"matn": "tom", "togrimi": false},
      ],
    },
    {
      "savol": "2. Who ____ you?",
      "javoblar": [
        {"matn": "hi", "togrimi": false},
        {"matn": "me", "togrimi": false},
        {"matn": "are", "togrimi": true},
        {"matn": "Mike", "togrimi": false},
      ],
    },
    {
      "savol": "3. Where ____ she from?",
      "javoblar": [
        {"matn": "Me", "togrimi": false},
        {"matn": "Cat", "togrimi": false},
        {"matn": "black", "togrimi": false},
        {"matn": "is", "togrimi": true},
      ],
    },
    {
      "savol": "4. What color ___ you like?",
      "javoblar": [
        {"matn": "Me", "togrimi": false},
        {"matn": "do", "togrimi": true},
        {"matn": "black", "togrimi": false},
        {"matn": "is", "togrimi": false},
      ],
    },
  ];

  int hozirgiSavolRaqami = 0;
  int natija = 0;

  void answerQuestion(bool togrimi) {
    setState(() {
      // hozirgiSavolRaqami = hozirgiSavolRaqami + 1;
      hozirgiSavolRaqami = hozirgiSavolRaqami + 1;
      if (togrimi) {
        natija++;
      }
    });
  }

  void qaytadanBoshlash() {
    setState(() {
      hozirgiSavolRaqami = 0;
      natija = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Ingliz Tili Quiz",
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: hozirgiSavolRaqami < savollarVaJavoblar.length
                ? Savol(
                    savollarVaJavoblar[hozirgiSavolRaqami]["savol"],
                    savollarVaJavoblar[hozirgiSavolRaqami]["javoblar"],
                    answerQuestion)
                : Natija(
                    natija,
                    savollarVaJavoblar.length,
                    qaytadanBoshlash,
                  )),
      ),
    );
  }
}
