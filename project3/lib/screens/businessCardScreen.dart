import 'package:call_me_maybe/screens/components/browserTab.dart';
import 'package:flutter/material.dart';
import 'components/browserTab.dart';
import 'components/mainTab.dart';
import 'components/textTab.dart';

class BusinessCardScreen extends StatefulWidget {

  @override
  _BCState createState() => _BCState();
}

class _BCState extends State<BusinessCardScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            banner(context, 'Business Card'),
            SizedBox(
      width: 100.0, height: 100.0,      
      child: Image.asset('images/me.jpg'),
            ),
            SizedBox(height: 8.0),
            MainTab(buttonName: 'Sariah Bunnell', boldness: FontWeight.bold),
            SizedBox(height: 8.0),
            MainTab(buttonName: 'Software Engineer Student', boldness: FontWeight.normal),
            TextTab(),
            BrowserTab(),
            MainTab(buttonName: 'bunnells@oregonstate.edu', boldness: FontWeight.normal),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }

  Widget banner(BuildContext context, final String output) {
    return Padding( 
        padding: EdgeInsets.all(12.0), 
        child: Text(
          output, 
          style: TextStyle(fontFamily: 'Pacifico', fontSize: 40)
        )
    );
  }

  double padding(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.3;
  }
} 