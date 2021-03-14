import 'package:flutter/material.dart';

class TextStyling extends StatelessWidget {
  final String text;
  final String fontFam;
  final double fSize;

  TextStyling({
    Key key, 
    this.text, 
    this.fontFam, 
    this.fSize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFam,
        fontSize: fSize,
      ),
    );
  }
}
