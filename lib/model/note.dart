import 'package:flutter/material.dart';

class Note {
  String id;
  String title;
  String body;

  Note({
    @required this.id,
    this.title,
    @required this.body,
  });
}
