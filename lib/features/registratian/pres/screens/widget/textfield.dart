import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shopshop/costant/size.dart';

import '../../../../../costant/colors.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield({
    super.key,
    required this.hinttext,
    required this.controller,
    this.icon,
    required this.labeltext,
    this.onIconTap,
  });

  final String hinttext;
  final String labeltext;
  final TextEditingController controller;
  final IconData? icon;
  final VoidCallback? onIconTap;

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Screan_size.width * 0.06),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: onIconTap,
            child: Icon(
              icon,
              size: 24,
              color: kgreycolor,
            ),
          ),
          filled: true,
          fillColor: Colors.transparent,
          hintText: hinttext,
          labelText: labeltext,
          labelStyle: const TextStyle(fontSize: 18, color: Colors.black),
          hintStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: kgreycolor,
          ),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.symmetric(
              vertical: Screan_size.hieght * 0.025,
              horizontal: Screan_size.width * 0.07),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(23),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Screan_size.width * 0.06),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 182, 161, 161)),
          ),
        ),
      ),
    );
  }
}
