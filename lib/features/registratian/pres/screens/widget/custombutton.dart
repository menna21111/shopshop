import 'package:flutter/material.dart';
import 'package:shopshop/costant/colors.dart';
import 'package:shopshop/costant/size.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(Screan_size.width * 0.9, Screan_size.hieght * 0.09),
        backgroundColor: khomecolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
