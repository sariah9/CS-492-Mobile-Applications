import 'package:flutter/material.dart';
import '../db/journalEntryDTO.dart';
import '../db/database_manager.dart';
import '../widgets/dropdown_rating_form.dart';

final formKey = GlobalKey<FormState>();

class NewEntryForm extends StatefulWidget {
  final void Function(bool val) pageFunc;
  NewEntryForm({this.pageFunc});

  @override
  NewFormState createState() => NewFormState();
}

class NewFormState extends State<NewEntryForm> {
  final journalFields = JournalEntryDTO();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: titleText(),
            ),
            Expanded(
              child: bodyText(),
            ),
            Expanded(
              child: ratingDropDown(),
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: cancelButton(context),
                ),
                Expanded(
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
        if (value < 1 || value > 4) {
          return 'Please choose a rating';
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
        setState(() {
          widget.pageFunc(true);
        });
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          addDateToJournalEntryValues();
          final database = DatabaseManager.getInstance();
          database.saveJournalEntry(dto: journalFields);
          Navigator.of(context).pop();
        }
      }
    );
  }

  void addDateToJournalEntryValues() {
    journalFields.date = DateTime.now();
  }
}