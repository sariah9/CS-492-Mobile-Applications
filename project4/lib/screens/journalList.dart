import 'package:flutter/material.dart';
import '../models/journal.dart';

class JournalList extends StatefulWidget {
  static const routeKey = 'journal_entries';
  final Journal journalData;
  JournalList({this.journalData});

  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<JournalList> {
  List<String> titles = [];
  List<String> dates = [];

  void initState() {
    super.initState();
    loadEntries();
  }

  void loadEntries(){
    int idx = 0;
    for (var i in widget.journalData.getEntries) {
      titles[idx] = i.getTitle;
      dates[idx] = i.getDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return  ListTile(
          leading: Icon(Icons.turned_in_not),
          trailing: Icon(Icons.edit),
          title: Text('${titles[index]}'),            
          subtitle: Text('${dates[index]}'),
          // wrap in closure: 
          //onTap: Navigator.of(context).pushNamed(routeKey);
        );
      }, 
      itemCount: widget.journalData.getEntries.length,
    );
  }
}