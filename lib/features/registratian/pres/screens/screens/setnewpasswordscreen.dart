import 'package:flutter/material.dart';
import 'package:shopshop/costant/size.dart';

import '../../../../../costant/colors.dart';
import '../widget/custombutton.dart';
import 'loginscrean.dart';
import 'otppage.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: Screan_size.hieght * .07,
                left: Screan_size.hieght * .035,
                right: Screan_size.hieght * .035,
                bottom: Screan_size.hieght * .045,
              ),
              alignment: Alignment.centerLeft,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'set new password',
                    style: TextStyle(
                        fontSize: 20,
                        color: kmaincolor,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Enter your email to change your password',
                    style: TextStyle(fontSize: 16, color: kgreycolor),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.lock_outlined,
                    size: 24,
                    color: kgreycolor,
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: 'entre new password',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: kgreycolor,
                  ),
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: Screan_size.hieght * .035,
                    horizontal: Screan_size.hieght * .035,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 182, 161, 161),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.lock_outlined,
                    size: 24,
                    color: kgreycolor,
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: 'confirm new password',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: kgreycolor,
                  ),
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: Screan_size.hieght * .035,
                    horizontal: Screan_size.hieght * .045,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 182, 161, 161),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Screan_size.hieght * .22,
            ),
            Custombutton(
                text: 'change password',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Loginscrean()));
                })
          ],
        ),
      ),
    );
  }
}
