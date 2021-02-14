import 'package:flutter/material.dart';

class MainTab extends StatelessWidget {
  final String buttonName;
  final FontWeight boldness;

  const MainTab({Key key, this.buttonName, this.boldness}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          buttonName,
          style: TextStyle(
            fontFamily: 'RobotoSlab',
            fontSize: 20,
            fontWeight: boldness,
          ),
        textAlign: TextAlign.center,
        ),
      ),
    );
  }
}