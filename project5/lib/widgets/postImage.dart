import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  final String postURL;
  final double width;
  final double height;

  const PostImage( {
    Key key, 
    @required this.postURL,
    this.width,
    this.height,
  }) : assert(postURL != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.pink[700],
      child: Image.network(
        postURL,
        semanticLabel: 'Food Waste Photo',
        fit: BoxFit.cover,
      ),
    );
  }

}
