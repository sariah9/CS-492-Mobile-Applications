import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class PostModel {
  String photo;
  int numItems;
  String date;
  GeoPoint location;

  PostModel({
    this.photo, 
    this.numItems,
    this.date,
    this.location,
  });

  factory PostModel.fromMap(Map data) {
    return PostModel(
      photo: data['imageURL'],
      numItems: data['quantity'],
      date: data['date'],
      location: data['geoField'],
    );
  }

  factory PostModel.fromSnapshot(DocumentSnapshot snapshot) {
    return PostModel(
      photo: snapshot['imageURL'],
      numItems: snapshot['quantity'],
      date: DateFormat.yMMMMEEEEd().format(snapshot['date'].toDate()).toString(),
      location: snapshot['geoField'],
    );
  }
}