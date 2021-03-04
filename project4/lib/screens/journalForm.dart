import 'package:flutter/material.dart';
import 'newEntry.dart';
import '../widgets/themeController.dart';

final GlobalKey<ScaffoldState> formPageKey = GlobalKey<ScaffoldState>();

class JournalForm extends StatefulWidget {
  final void Function(bool val) func;
  final bool sel;
  final void Function(bool val) pageFunc;
  JournalForm({this.func, this.sel, this.pageFunc});
  @override
  JournalFormState createState() => JournalFormState();
}

class JournalFormState extends State<JournalForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: formPageKey,
      appBar: AppBar(
        title: Text('New Entry'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => formPageKey.currentState.openEndDrawer(),
          ),
        ],
      ),
      endDrawer: ThemeController(
        themeFunc: widget.func, 
        themeSelect: widget.sel,
      ),
      body: NewEntryForm(pageFunc: widget.pageFunc,), 
    );
  }
}


