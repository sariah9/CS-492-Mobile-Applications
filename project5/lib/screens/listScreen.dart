import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:wasteagram/screens/detailScreen.dart';
import '../models/postModel.dart';
import '../widgets/textStyling.dart';
//import '../widgets/postImage.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key key}) : super(key: key);

  @override
  _PostsState createState() => _PostsState(); 
}

class _PostsState extends State<ListScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts')
      .orderBy('date', descending: true).snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Waiting...');
        } else if (snapshot.hasError) {
          return Text('Error in stream');
        }
        if(!snapshot.hasData || snapshot.data.docs == null || snapshot.data.docs.length <= 0) {
          return Center(child: CircularProgressIndicator(),);
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.brown,
            ),
            padding: EdgeInsets.symmetric(vertical: 8.0),
            controller: scrollController,
            itemCount: snapshot.data.docs.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index < snapshot.data.docs.length) {
                var post = snapshot.data.docs[index];
                final foodPost = PostModel.fromSnapshot(post);
                return ListTile(
                  // leading: PostImage(postURL: post['imageURL'],
                  //   width: 60.0,
                  //   height: 60.0,
                  // ),
                  title: TextStyling(
                    text: DateFormat.yMMMMEEEEd().format(post['date'].toDate()).toString(),
                    fontFam: 'DMSerifDisplay',
                    fSize: 24.0,
                  ),
                  trailing: TextStyling(
                    text: post['quantity'].toString(),
                    fontFam: 'DMSerifDisplay',
                    fSize: 24.0,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (
                        context) => DetailScreen(postTile: foodPost)
                      ),
                    );
                  }

                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: Center(child: Text('No other Posts'),),
                );
              }
            },
          );
        }
      },
    );
  }
}
