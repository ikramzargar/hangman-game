import 'package:flutter/material.dart';
import 'package:hangman/game.dart';
import 'package:hangman/letter.dart';
import 'figure.dart';

class screen extends StatefulWidget {
  const screen({super.key});

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  String word = 'flutter'.toUpperCase();
  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Text("Hangman",
          style: TextStyle(
            color: Colors.white
          ),),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
           children: [
             figure(Game.tries>=0,'images/hang.png'),
             figure(Game.tries>=1,'images/head.png'),
             figure(Game.tries>=2,'images/body.png'),
             figure(Game.tries>=3,'images/ra.png'),
             figure(Game.tries>=4,'images/la.png'),
             figure(Game.tries>=5,'images/rl.png'),
             figure(Game.tries>=6,'images/ll.png'),
           ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
               word.split('')
                   .map((e) => letter(e.toUpperCase(), !Game.selectedChar.contains(e.toUpperCase(),),),)
                   .toList(),

            ),
            SizedBox(height: 12,),
            SizedBox(
              width: double.infinity,
                height: 250,
            child: GridView.count(
                crossAxisCount: 7,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                padding: EdgeInsets.all(12),
              children: alphabets.map((e) {
                return RawMaterialButton(
                  onPressed: Game.selectedChar.contains(e) ? null : (){
                  setState(() {
                    Game.selectedChar.add(e);
                    if (Game.selectedChar.contains(e.toUpperCase())){
                      Game.tries++;
                    }
                  });
                  },
                  child: Text(e,style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  fillColor: Game.selectedChar.contains(e) ? Colors.black : Colors.blueGrey,
                );
              }).toList(),
            ),
            ),

          ],
        ),
      ),
    );
  }
}
