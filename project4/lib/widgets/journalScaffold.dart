import 'package:flutter/material.dart';
import 'themeController.dart';
import '../screens/journalForm.dart';

class JournalScaffold extends StatefulWidget {
  final void Function(bool val) func;
  final bool sel;
  final String title; 
  final Widget child; 
  final void Function(bool val) pageFunc;
  JournalScaffold({
    this.func,
    this.sel,
    this.title, 
    this.child, 
    this.pageFunc,
  });

  @override
  _ScaffoldState createState() => _ScaffoldState();
}

class _ScaffoldState extends State<JournalScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title), //?? 'Welcome'? 
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
          ),
        ],
      ),
      endDrawer: ThemeController(
        themeFunc: widget.func, 
        themeSelect: widget.sel,
      ),
      body: LayoutBuilder(builder: layoutDecider),
      floatingActionButton: addEntryFab(context),
    );
  }

  Widget layoutDecider(BuildContext context, BoxConstraints constraints) => 
    constraints.maxWidth < 500 ? verticalLayout() : horizontalLayout();

  Widget verticalLayout() {
    return Center(
      child: widget.child,
    );
  }

  Widget horizontalLayout() {
    return Center(
      child: widget.child,
    );
  }

  Widget addEntryFab(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.history_edu),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JournalForm(
            func: widget.func,
            sel: widget.sel,
            pageFunc: widget.pageFunc,
          )),
        );
      },
    );
  }
}
