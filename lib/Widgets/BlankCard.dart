import 'package:flutter/material.dart';

//Blank Card
class BlankCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(image: AssetImage('./assets/images/blankCard.png'),),
    );
  }
}
