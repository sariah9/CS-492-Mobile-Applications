import 'package:flutter/material.dart';
import 'dart:math'; 

class JobPredictorScreen extends StatefulWidget {

  @override
  _JobPState createState() => _JobPState();
}

class _JobPState extends State<JobPredictorScreen> {
  List<String> answers = [
    'Future is Unclear',
    'Yes',
    'No',
    'Definitely Not',
    'Try Again',
    'Think Positive',
    'Future is looking bright',
    'Never',
    'Maybe',
  ];
  int answerNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/crystalBall.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: _textBox(
                'Ask a question and let me divine your future.',
                'Pacifico',
                40,
                TextAlign.left,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Expanded(
              flex: 2,
              child: FlatButton( 
                onPressed: () { 
                  setState(() {   
                    //random integer from 0 to n-1 
                    answerNum = Random().nextInt(9); 
                  }); 
                },
                child: Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      answers[answerNum],
                      style: TextStyle(
                        fontFamily: 'RobotoSlab',
                        fontSize: 28,
                        foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    // Solid text as fill.
                    Text(
                      answers[answerNum],
                      style: TextStyle(
                        fontFamily: 'RobotoSlab',
                        fontSize: 28,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FractionallySizedBox(
                heightFactor: 0.2,
                widthFactor: 0.9,
              ),
            ),
            Expanded(
              flex: 2,
              child: _textBox(
                'Click the ball above to reveal the truth',
                'Imbue',
                32,
                TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  } 

  Widget _textBox(
    final String text,
    final String fontFam,
    final double fSize,
    TextAlign spacing,
    ) {
    return Padding( 
      padding: EdgeInsets.all(12.0), 
      child: Stack(
        children: <Widget>[
          // Stroked text as border.
          Text(
            text,
            style: TextStyle(
              fontFamily: fontFam,
              fontSize: fSize,
              foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = Colors.black,
            ),
            textAlign: spacing,
          ),
          // Solid text as fill.
          Text(
            text,
            style: TextStyle(
              fontFamily: fontFam,
              fontSize: fSize,
              color: Colors.white,
            ),
            textAlign: spacing,
          ),
        ],
      ),
    );
  }

  double padding(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.65;
  }
} 
