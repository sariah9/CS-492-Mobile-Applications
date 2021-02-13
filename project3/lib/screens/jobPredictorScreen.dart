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
        child: _mainBody(),
      ), 
    );
  } 

  Column _mainBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        _titleBox(),
        SizedBox(height: 40.0),
        FlatButton( 
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
        SizedBox(height: 160.0),
        _instructions(),
      ],
    );
  }

  Widget _titleBox() {
    return Padding( 
      padding: EdgeInsets.all(12.0), 
      child: Stack(
        children: <Widget>[
          // Stroked text as border.
          Text(
            'Ask me a question and let me divine your future.',
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 40,
              foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = Colors.black,
            ),
            textAlign: TextAlign.left,
          ),
          // Solid text as fill.
          Text(
            'Ask me a question and let me divine your future.',
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 40,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

   Widget _instructions() {
    return Padding( 
      padding: EdgeInsets.all(12.0),
      child: Stack(
        children: <Widget>[
          // Stroked text as border.
          Text(
            'Click the ball above to reveal the truth',
            style: TextStyle(
              fontFamily: 'Imbue', 
              fontSize: 32,
              foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          // Solid text as fill.
          Text(
            'Click the ball above to reveal the truth',
            style: TextStyle(
              fontFamily: 'Imbue', 
              fontSize: 32,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ), 
    );
  }
} 
