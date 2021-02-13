import 'package:call_me_maybe/textsAndBrowser.dart';
import 'package:flutter/material.dart';
import '../services.dart';

class BrowserTab extends StatefulWidget {
  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<BrowserTab> {
  final TextsAndBrowser _service = locator<TextsAndBrowser>();

  final String url = 'https://github.com/sariah9';

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
          '$url',
          style: TextStyle(fontFamily: 'RobotoSlab', fontSize: 20)
        ),
        onPressed: () => _service.launchURL(url),
        shape: const StadiumBorder(),
      ),
    );
  }
}