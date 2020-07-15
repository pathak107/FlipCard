import 'package:flutter/material.dart';

class MatchStatus extends StatelessWidget {
  final bool matchStatus;
  MatchStatus({this.matchStatus});

  Widget statusWidgetRenderer(){
    if(matchStatus==true){
      return Container(
            child: Column(
              children: <Widget>[
                Image.asset('./assets/images/correct.png'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Match',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Comfortaa',
                  ),
                ),
              ],
            ),
          );
    }
    else{
      return Container(
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.asset('./assets/images/wrong.png'),
                    Image.asset('./assets/images/cross.png'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Wrong Match',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Comfortaa',
                  ),
                ),
              ],
            ),
          );
    } 
  }



  @override
  Widget build(BuildContext context) {
    return statusWidgetRenderer();
  }
}
