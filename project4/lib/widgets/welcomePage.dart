import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'journalScaffold.dart';
import '../db/database_manager.dart';
import '../db/journalEntryDAO.dart';
import '../models/journal.dart';
import '../models/journalEntry.dart';
import '../screens/journalList.dart';


class WelcomePage extends StatefulWidget {
  final void Function(bool val) func;
  final bool sel;
  final SharedPreferences prefs;
  WelcomePage({this.func, this.sel, @required this.prefs});

  @override
  _WelcomeWagon createState() => _WelcomeWagon();
}

class _WelcomeWagon extends State<WelcomePage> {
  static const PAGE_KEY = 'hasEntries';
  Journal journal;

  bool get getVisit =>
    widget.prefs.getBool(PAGE_KEY) ?? false;
  
  void listSet(bool setting) {
    widget.prefs.setBool(PAGE_KEY, setting);
    setState(() => {});
  }

  @override
  void initState() {
    super.initState();
    loadJournal();
  }

  void loadJournal() async {
    final database = DatabaseManager.getInstance();
    List<JournalEntry> journalRecords = await JournalEntryDAO.journalEntries(database);
    setState(() {
      journal = Journal(entries: journalRecords);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (journal == null) {
      return JournalScaffold(
        func: widget.func,
        sel: widget.sel,
        title: 'Loading',
        child: CircularProgressIndicator(),
        pageFunc: listSet,
      );
    } else {
      return JournalScaffold(
        func: widget.func,
        sel: widget.sel,
        title: journal.isEmpty ? 'Welcome' : 'Journal Entries',
        child: welcomeScreen(),
        pageFunc: listSet,
      );
    }
  }

  Widget welcomeScreen() {
    if (getVisit){
      return JournalList(journalData: journal);
    } else {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/cover.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
