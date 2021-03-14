import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'newPost.dart';
import '../widgets/textStyling.dart';

class PhotoScreen extends StatefulWidget {
  PhotoScreen({Key key}) : super(key: key);
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<PhotoScreen> {
  File image;
  final picker = ImagePicker();
  String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Photo Options'),
        backgroundColor: Colors.pink[700],
      ),
      body: Container(
        child: picOptions(context),
      ) 
    );
  }

  Widget picOptions(BuildContext context) {
    return  ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo_album_outlined),
          title: TextStyling(
            text: 'Choose photo from gallery',
            fontFam: 'KaushanScript',
            fSize: 28.0,
          ),
          onTap: () {
            _imgFromGallery();
          },
        ),
        Divider(
          color: Colors.brown,
        ),
        ListTile(
          leading: Icon(Icons.photo_camera_front),
          title: TextStyling(
            text: 'Take photo with camera',
            fontFam: 'KaushanScript',
            fSize: 28.0,
          ),
          onTap: () {
            _imgFromCamera();
          },
        ),
      ],
    );
  }

  void _imgFromCamera() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
    Reference storageReference = FirebaseStorage.instance.ref().child(image.path + DateTime.now().toString());
    UploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.whenComplete(() async {
      url = await storageReference.getDownloadURL();
      print(url);
      if (image != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (
            context) => NewPost(photoURL: url)
          ),
        );
      } else {
        while (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      }
    });  
  }

  void _imgFromGallery() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery, 
    );

    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
    Reference storageReference = FirebaseStorage.instance.ref().child(image.path + DateTime.now().toString());
    UploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.whenComplete(() async {
      url = await storageReference.getDownloadURL();
      print(url);
      if (image != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (
            context) => NewPost(photoURL: url)
          ),
        );
      } else {
        while (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      }
    });  
  }
  
}
