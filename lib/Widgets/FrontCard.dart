import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FrontCard extends StatelessWidget {
  final String cardValue;
  FrontCard({this.cardValue});

  // Function to determing the type of card
  Widget CardSymbolDetector() {
    //card symbol can be hearts, clubs, diamonds, spades
    //spades and clubs are black whereas hearts and diamonds are red
    //and value can be 1 or A
    Color cardColor;
    String cardText;
    Icon cardIcon;
    switch (cardValue) {
      case "s1":
        cardColor = Colors.black;
        cardText = "1";
        cardIcon = Icon(MaterialCommunityIcons.cards_spade,color: Colors.black,);
        break;
      case "sA":
        cardColor = Colors.black;
        cardText = "A";
        cardIcon = Icon(MaterialCommunityIcons.cards_spade,color: Colors.black,);
        break;
      case "c1":
        cardColor = Colors.black;
        cardText = "1";
        cardIcon = Icon(MaterialCommunityIcons.cards_club,color: Colors.black,);
        break;
      case "cA":
        cardColor = Colors.black;
        cardText = "A";
        cardIcon = Icon(MaterialCommunityIcons.cards_club,color: Colors.black,);
        break;
      case "h1":
        cardColor = Colors.red;
        cardText = "1";
        cardIcon = Icon(MaterialCommunityIcons.cards_heart,color: Colors.red,);
        break;
      case "hA":
        cardColor = Colors.red;
        cardText = "A";
        cardIcon = Icon(MaterialCommunityIcons.cards_heart,color: Colors.red,);
        break;
      case "d1":
        cardColor = Colors.red;
        cardText = "1";
        cardIcon = Icon(MaterialCommunityIcons.cards_diamond,color: Colors.red,);
        break;
      case "dA":
        cardColor = Colors.red;
        cardText = "A";
        cardIcon = Icon(MaterialCommunityIcons.cards_diamond,color: Colors.red,);
        break;
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(1, 1, 25,2),
            child: Text(
              cardText,
              style: TextStyle(
                color: cardColor,
              ),
            ),
          ),
          cardIcon,
          Container(
            margin: EdgeInsets.fromLTRB(25, 1, 1,2),
            child: Text(
              cardText,
              style: TextStyle(
                color: cardColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          child: Image.asset('./assets/images/cardFront.png'),
        ),
        Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(pi * 1),
          child: Center(child: CardSymbolDetector()),
        ),
      ],
    );
  }
}
