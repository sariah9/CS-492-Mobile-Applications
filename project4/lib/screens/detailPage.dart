import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final String body;
  final String rating;
  final String date;
  final bool hasEntries;
  DetailPage({
    this.title, 
    this.body, 
    this.rating,
    this.date,
    this.hasEntries,
  });
  @override
  DetailState createState() => DetailState();
}

class DetailState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail View'),
        actions: <Widget>[
          BackButton(
            color: Colors.purple,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: Container(
        child: detailView(),
      ) 
    );
  }

  Widget detailView() {
    if (widget.hasEntries){
      return  ListView(
        children: <Widget>[
          Text(widget.title),
          Text(widget.body),
          Text(widget.rating),
          Text(widget.date),
        ],
      );
    } else {
      return  ListView(
        children: <Widget>[
          Text('No Entries Yet'),
        ]
      );
    }
  }
}