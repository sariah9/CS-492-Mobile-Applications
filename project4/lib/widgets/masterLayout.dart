import 'package:flutter/material.dart';
import '../models/journal.dart';
import '../models/journalEntry.dart';
import '../widgets/themeController.dart';
import '../screens/detailPage.dart';
import '../screens/journalForm.dart';

//this class called first
class MasterLayout extends StatefulWidget {
  final void Function(bool val) func;
  final bool sel;
  final String title; 
  final String childDecider;
  final Journal journalData; 
  final void Function(bool val) pageFunc;
  MasterLayout({
    this.func,
    this.sel,
    this.title, 
    this.childDecider, 
    this.journalData,
    this.pageFunc,
  });
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  _ScaffoldState createState() => _ScaffoldState();
}

class _ScaffoldState extends State<MasterLayout> {
  List<String> titles = [];
  List<String> dates = [];
  List<String> bodies = [];
  List<String> ratings = [];
  JournalEntry selectedItem;
  bool hasEntries = false;
  bool isVertical = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: buildScaffold(context),
          ),
        ],
      ),
    );
  }

  void loadEntries(){
    if (widget.journalData.getEntries.isNotEmpty){
      selectedItem = widget.journalData.getEntries[0];
      for (var i in widget.journalData.getEntries) {
        titles.add(i.getTitle);
        dates.add(i.getDate);
        bodies.add(i.getBody);
        ratings.add(i.getRating);
      }
    }
  }

  Widget buildScaffold(BuildContext context) {
    return Scaffold(
      key: widget._scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title ?? 'Welcome'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => widget._scaffoldKey.currentState.openEndDrawer(),
          ),
        ],
      ),
      endDrawer: ThemeController(
        themeFunc: widget.func, 
        themeSelect: widget.sel,
      ),
      body: welcomeScreen(),
      floatingActionButton: addEntryFab(context),
    );
  }

  Widget welcomeScreen() {
    if (widget.childDecider == 'A'){
      return Center(child: CircularProgressIndicator());
    } else if (widget.childDecider == 'B'){
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/cover.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      hasEntries = true;
      loadEntries();
      return LayoutBuilder(builder: layoutDecider);
    }
  }

  Widget layoutDecider(BuildContext context, BoxConstraints constraints) => 
    constraints.maxWidth < 500 ? verticalLayout(context) : horizontalLayout(context, 0);
  
  Widget verticalLayout(BuildContext context) {
    isVertical = true;
    return Center(
      child: buildList(context),
    );
  }

  Widget horizontalLayout(BuildContext context, int idx) {
    isVertical = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget> [
        Expanded(child: buildList(context)),
        Expanded(child: rowOption(idx)),
      ],
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

   Widget buildList(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
        return  ListTile(
          leading: Icon(Icons.turned_in_not),
          trailing: Icon(Icons.edit),
          selected: widget.journalData.getEntries[index] == selectedItem,
          title: Text('${titles[index]}'),            
          subtitle: Text('${dates[index]}'),
          onTap: () { 
            if (isVertical) {
              setState(() {
                selectedItem = widget.journalData.getEntries[index];
                // To remove the previously selected detail page
                while (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage(
                  title: '${titles[index]}',
                  body: '${bodies[index]}',
                  rating: '${ratings[index]}',
                  date: '${dates[index]}',
                  hasEntries: hasEntries,
                )),
              );
            } else {
              setState(() {
                horizontalLayout(context, index);
              });
            }
          }
        );
      }, 
      itemCount: widget.journalData.getEntries.length,
      )
    );
  }

  Widget rowOption(int idx) {
    if (hasEntries) {
      return DetailPage(
        title:'${titles[idx]}',
        body:'${bodies[idx]}',
        rating: '${ratings[idx]}',
        date: '${dates[idx]}',
        hasEntries: hasEntries,
      );
    } else {
      return ListView(
        children: <Widget>[
          Text('No Entries Yet'),
        ]
      );
    }
  }

}