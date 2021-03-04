import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeController extends StatefulWidget {
  final void Function(bool val) themeFunc;
  final bool themeSelect;
  ThemeController({this.themeFunc, this.themeSelect});
  

  @override
  _ThemeState createState() => _ThemeState();
}

class _ThemeState extends State<ThemeController> {
  Icon themeSwitch = Icon(Icons.toggle_on);
  String themeText = 'Choose theme';
  bool _selections = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Choose your theme'),
          ),
          ListTile(
            title: Text(themeText),
            trailing: CupertinoSwitch(
              value: widget.themeSelect,
              onChanged: (val) {
                setState(() {
                  _selections = !widget.themeSelect;
                  if (_selections == true) {
                    themeSwitch = Icon(Icons.toggle_off);
                    themeText = 'Theme is Dark';
                  } else {
                    themeSwitch = Icon(Icons.toggle_on);
                    themeText = 'Theme is Light';
                  }
                  //change theme to toggle bool
                  widget.themeFunc(_selections);
                });
              },
            ),
          ),
        ],
      )  
    );
  } 
}