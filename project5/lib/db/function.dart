import 'package:flutter/material.dart';
import 'dart:async';

Future<List<Map>> getExampleServerData(int length) {
  return Future.delayed(Duration(seconds: 1), () {
    return List<Map>.generate(
      length, 
      (int index) {
        return {
          'body': Text('Post Body'),
          'avatar': Text('Photo'),
        };
      }
    );
  });
}