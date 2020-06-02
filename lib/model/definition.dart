import 'package:flutter/material.dart';

class Definition {
  String id;
  String title;
  String definition;
  int encounters;

  Definition({
    @required String id,
    @required String title,
    @required String definition,
    @required int encounters,
  });
}
