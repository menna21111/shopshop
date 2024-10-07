import 'package:flutter/material.dart';

class Screan_size {
  static late double width;
  static late double hieght;
  static void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    hieght = MediaQuery.of(context).size.height;
  }
}
