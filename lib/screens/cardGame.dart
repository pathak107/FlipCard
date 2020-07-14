import 'package:flipcart/Widgets/Flipcard.dart';
import 'package:flutter/material.dart';

class CardGame extends StatefulWidget {
  CardGame({Key key}) : super(key: key);

  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {
  List newCards = [
    {"card": "s1", "matched": false},
    {"card": "sA", "matched": false},
    {"card": "c1", "matched": false},
    {"card": "cA", "matched": false},
    {"card": "d1", "matched": false},
    {"card": "dA", "matched": false},
    {"card": "h1", "matched": false},
    {"card": "hA", "matched": false},
    {"card": "s1", "matched": false},
    {"card": "sA", "matched": false},
    {"card": "c1", "matched": false},
    {"card": "cA", "matched": false},
    {"card": "d1", "matched": false},
    {"card": "dA", "matched": false},
    {"card": "h1", "matched": false},
    {"card": "hA", "matched": false},
  ];

  //config variables
  int cardsRevealed = 0; //will be from 0 to 2
  int cardsMatched = 0;
  String matchStatus = "";
  int indexOfFirstCard = -1;
  int indexOfSecondCard = -1;
  bool istryingToMatchCards = false;

  //function to manage revealed cards
  void _cardReveal(index) {
    cardsRevealed++;

    if (cardsRevealed > 2) {
      setState(() {
        cardsRevealed -= 2; //now only one card is in revealed state

        //Seting both the cards revealed as false
        indexOfFirstCard = -1;
        indexOfSecondCard = -1;
      });
    }

    if (indexOfFirstCard == -1 && cardsRevealed == 1) {
      indexOfFirstCard = index;
      print(indexOfFirstCard);
    }
    if (indexOfSecondCard == -1 && cardsRevealed == 2) {
      indexOfSecondCard = index;
      print(indexOfSecondCard);
    }

    if (cardsRevealed < 2) {
      //do nothing
    } else if (cardsRevealed == 2) {
      _matchCards(indexOfFirstCard, indexOfSecondCard);
    }
  }

  //function to match cards
  void _matchCards(index1, index2) {
    //introduce delay and disable all cards for some time
    istryingToMatchCards = true;
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        istryingToMatchCards = false; //After 1.5s enable the cards once again
      });
    });
    print(index1);
    print(index2);
    if (newCards[index1]["card"] == newCards[index2]["card"] &&
        index1 != index2) {
      print("cards matched");
      setState(() {
        cardsMatched += 2;
        newCards[index1]['matched'] = true;
        newCards[index2]['matched'] = true;
        matchStatus = "Matched! ";
      });
    } else {
      print("cards don't match");
      setState(() {
        matchStatus = "Cards don't match";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flip Card Game'),
      ),
      body: SafeArea(
        child: Container(
          //to set background image
          // constraints: BoxConstraints.expand(),
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage('./assets/images/bg.png'),
          //         fit: BoxFit.cover)),

          child: AbsorbPointer(
            absorbing: istryingToMatchCards,
            child: Column(
              children: <Widget>[
                Center(
                  child: GridView.count(
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    children: List.generate(16, (cardIndex) {
                      return FlipCard(
                        returnIndex: (index) => {_cardReveal(index)},
                        index: cardIndex,
                        isMatching: newCards[cardIndex]["matched"],
                        cardValue: newCards[cardIndex]["card"],
                      );
                    }),
                  ),
                ),
                Text(cardsMatched.toString()),
                Text(matchStatus)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
