import 'package:call_me_maybe/textsAndBrowser.dart';
import 'package:flutter/material.dart';
import '../services.dart';

class TextTab extends StatefulWidget {
  @override
  _MsgState createState() => _MsgState();
}

class _MsgState extends State<TextTab> {
  final TextsAndBrowser _service = locator<TextsAndBrowser>();

  final String number = '(555) 555 - 5555';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 4.0,
      ),
      child: RaisedButton(
        color: Colors.purple[100],
        splashColor: Colors.deepPurple,
        child: Text(
          'Text Me: $number',
          style: TextStyle(fontFamily: 'RobotoSlab', fontSize: 20)
        ),
        onPressed: () => _service.sendSms(number),
        shape: const StadiumBorder(),
      ),
    );
  }
}