import 'package:flutter/material.dart';
import '../db/database_manager.dart';
import '../db/journalEntryDTO.dart';
import '../widgets/dropdown_rating_form.dart';
import '../widgets/themeController.dart';

class JournalForm extends StatefulWidget {
  final void Function(bool val) func;
  final bool sel;
  final void Function(bool val) pageFunc;
  JournalForm({this.func, this.sel, this.pageFunc});
  @override
  JournalFormState createState() => JournalFormState();
}

class JournalFormState extends State<JournalForm> {
  final GlobalKey<ScaffoldState> _formPageKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final journalFields = JournalEntryDTO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formPageKey,
      appBar: AppBar(
        title: Text('New Entry'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _formPageKey.currentState.openEndDrawer(),
          ),
        ],
      ),
      endDrawer: ThemeController(
        themeFunc: widget.func, 
        themeSelect: widget.sel,
      ),
      body: bodyForm(context), 
    );
  }

  Widget bodyForm(BuildContext context) {
    //JournalApp appState = context.findAncestorStateOfType(<JournalApp>);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: titleText(),
            ),
            Expanded(
              flex: 1,
              child: bodyText(),
            ),
            Expanded(
              flex: 1,
              child: ratingDropDown(),
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: cancelButton(context),
                ),
                Expanded(
                  flex: 2,
                  child: saveButton(context),
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }

  Widget titleText() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Title',
        border: OutlineInputBorder(),
      ),
      onSaved: (value) {
        journalFields.title = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please type something in the title field';
        } else {
          return null;
        }
      },
    );
  }

  Widget bodyText() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Body',
        border: OutlineInputBorder(),
      ),
      onSaved: (value) {
        journalFields.body= value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please type something in the body field';
        } else {
          return null;
        }
      },
    );
  }

  Widget ratingDropDown() {
    return DropdownRatingFormField(
      maxRating: 4,
      onSaved: (value) {
        //store value in database
        journalFields.rating = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please type something in the form fields';
        } else {
          return null;
        }
      },
    );
  }

  Widget cancelButton(BuildContext context) {
  return RaisedButton(
    child: Text('Cancel'),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
}

Widget saveButton(BuildContext context) {
  return RaisedButton(
    child: Text('Save'),
    onPressed: () async {
      if (formKey.currentState.validate()) {
        formKey.currentState.save();
        addDateToJournalEntryValues();
        final database = DatabaseManager.getInstance();
        database.saveJournalEntry(dto: journalFields);
        widget.pageFunc(true);
        Navigator.of(context).pop();
      }
    }
  );
}

  void addDateToJournalEntryValues() {
    journalFields.date = DateTime.now();
  }
}


