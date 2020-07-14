import 'dart:math';

import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  @override
  _FlipCardState createState() => _FlipCardState();

  //Callback funtion to passback data
  final Function returnIndex;
  final int index;
  final bool isMatching;
  final String cardValue;

  FlipCard({this.returnIndex, this.index, this.isMatching,this.cardValue});
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.003)
          ..rotateY(pi * _animation.value),
        child: GestureDetector(
          onTap: widget.isMatching
              ? null // disable the card if its matching
              : () {
                  if (_animationStatus == AnimationStatus.dismissed) {
                    widget.returnIndex(widget
                        .index); //Returning the index of Card to match the value
                    _animationController.forward();

                    //Creating delay and then fippinig back
                    if(widget.isMatching!=true){
                      Future.delayed(const Duration(milliseconds: 1000), () {
                      _animationController.reverse();
                    });
                    }
                    
                  } else {
                    _animationController.reverse();
                  }
                },
          child: (widget.isMatching)
              ? (BlankCard())
              : //If the ismatching is true render a blank card else play the animations
              _animation.value <= 0.5
                  ? Container(
                      child: Image.asset('./assets/images/card.png'),
                    )
                  : Stack(
                      children: <Widget>[
                        Container(
                          child: Image.asset('./assets/images/cardFront.png'),
                        ),
                        Transform(
                          alignment: FractionalOffset.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.002)
                            ..rotateY(pi * 1),
                          child: Center(child: Text(widget.cardValue)),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}



//Blank Card
class BlankCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: 55,
      height: 100,
    );
  }
}
