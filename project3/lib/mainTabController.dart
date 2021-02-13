import 'package:flutter/material.dart';
import 'screens/businessCardScreen.dart';
import 'screens/resumeScreen.dart';
import 'screens/jobPredictorScreen.dart';

class MainTabController extends StatelessWidget {
  static const tabText = [
    Tab(text: 'Business Card'),
    Tab(text: 'Resume'),
    Tab(text: 'Job Predictor'),
  ];
  static const icons = [
    Tab(icon: Icon(Icons.branding_watermark)),
    Tab(icon: Icon(Icons.article_outlined)),
    Tab(icon: Icon(Icons.compare_rounded)),
  ];

  final screens = [
    BusinessCardScreen(),
    ResumeScreen(),
    JobPredictorScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child:Text(
              'Call Me Maybe',
              textAlign: TextAlign.center,
            ),
          ),
          bottom: TabBar(tabs: icons),
        ),
        body: TabBarView(children: screens)
      ),
    );
  }
}