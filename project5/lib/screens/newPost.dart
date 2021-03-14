import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:location/location.dart';
import 'package:wasteagram/widgets/getFormattedDate.dart';
import '../models/postModel.dart';
import '../widgets/getFormattedDate.dart';
import '../widgets/postImage.dart';

final formKey = GlobalKey<FormState>();

class NewPost extends StatefulWidget {
  final String photoURL;
  NewPost({@required this.photoURL});

  @override
  _NewEntryState createState() => _NewEntryState();
}

class _NewEntryState extends State<NewPost> {
  final postFields = PostModel();
  final postDate = GetFormattedDate();
  LocationData locationData;
  var locationService = Location();

  @override
  void initState() {
    super.initState();
    retrieveLocation();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            while (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
        title: Text('New Post'),
        backgroundColor: Colors.pink[700],
      ),
      body: formBody(), 
    );
  }

  Widget formBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PostImage(
              postURL: widget.photoURL,
              width: 200,
              height: 250,
            ),
            itemsText(),      
            Semantics(
              child: saveButton(context),
              label: 'Upload Button',
              button: true,
              onTapHint: 'Button for Uploading Post',
            ),
          ],
        ),
      ),
    );
  }
  
  Widget itemsText() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Number of Wasted Items',
        border: OutlineInputBorder(),
      ),
      onSaved: (value) {
        postFields.numItems = int.parse(value);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please type in the number of items';
        } else {
          return null;
        }
      },
      ),
    );
  }

  Widget saveButton(BuildContext context) {
    return RaisedButton(
      child: Text('Upload'),
      textColor: Colors.white,
      color: Colors.pink[700],
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          FirebaseFirestore.instance.collection('posts').add({
            'date': addDateToPost(),
            'imageURL': widget.photoURL,
            'quantity': postFields.numItems,
            'geoField': GeoPoint(locationData.latitude, locationData.longitude),
          }); 
          while (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        }
      },
    );
  }

  void retrieveLocation() async {
    try {
      var _serviceEnabled = await locationService.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await locationService.requestService();
        if (!_serviceEnabled) {
          print('Failed to enable service. Returning.');
          return;
        }
      }
      var _permissionGranted = await locationService.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await locationService.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          print('Location service permission not granted. Returning.');
        }
      }

      locationData = await locationService.getLocation();
    } on PlatformException catch (e) {
      print('Error: ${e.toString()}, code: ${e.code}');
      locationData = null;
    }
    locationData = await locationService.getLocation();
    setState(() {});
  }

  DateTime addDateToPost() {
    final givenDate = DateTime.now();
    postFields.date = DateFormat.yMMMMEEEEd().format(givenDate);
    return givenDate;
  }
}
