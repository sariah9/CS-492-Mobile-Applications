import 'package:flutter/material.dart';
import 'listScreen.dart';
import 'photoScreen.dart';
import '../widgets/textStyling.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key key}) : super(key: key);
  final GlobalKey<ScaffoldState> landingScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: landingScaffoldKey,
      appBar: AppBar(
        toolbarHeight: 100,
        title: TextStyling(
          text:'Wasteagram',
          fontFam: 'Courgette',
          fSize: 32.0,
        ),
        centerTitle: true,
        backgroundColor: Colors.pink[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListScreen(),
            ),
          ],
        ),
      ),
      floatingActionButton: Semantics(
        child: addPhotoFab(context),
        enabled: true,
        button: true,
        label: 'Choose a photo',
        onTapHint: 'Choose a photo',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget addPhotoFab(BuildContext context) {
    return FloatingActionButton(
      elevation: 8.0,
      child: Icon(Icons.photo_camera),
      backgroundColor: Colors.pink[700],
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PhotoScreen()
          ),
        );
      },
    );
  }
}
