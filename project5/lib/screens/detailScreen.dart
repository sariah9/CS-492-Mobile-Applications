import 'package:flutter/material.dart';
import '../models/postModel.dart';
import '../widgets/postImage.dart';
import '../widgets/textStyling.dart';

class DetailScreen extends StatefulWidget {
  final PostModel postTile;
  const DetailScreen({@required this.postTile});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Post Detail'),
        backgroundColor: Colors.pink[700],
      ),
      body: Center(
        child: detailView(),
      ), 
    );
  }

  Widget detailView() {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextStyling(
          text: widget.postTile.date,
          fontFam: 'DMSerifDisplay',
          fSize: 32.0,
        ),
        PostImage(
          postURL: widget.postTile.photo,
          width: 200.0,
          height: 400.0,
        ),
        TextStyling(
          text: widget.postTile.numItems.toString(),
          fontFam: 'DMSerifDisplay',
          fSize: 28.0,
        ),
        TextStyling(
          text: printGeoPoint(),
          fontFam: 'Courgette',
          fSize: 24.0,
        ),
      ],
    );
  }

  String printGeoPoint() {
    return '[${widget.postTile.location.latitude}, ${widget.postTile.location.longitude}]';
  }
}
