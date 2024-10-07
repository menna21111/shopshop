import 'package:flutter/material.dart';

import '../../../../../costant/colors.dart';
import '../widget/custombutton.dart';
import 'otppage.dart';

class Chanepassword extends StatelessWidget {
  const Chanepassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 48, left: 16, right: 16, bottom: 25),
              alignment: Alignment.centerLeft,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Password Changed',
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.email_outlined,
                    size: 24,
                    color: kgreycolor,
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: 'Email adress',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: kgreycolor,
                  ),
                  alignLabelWithHint: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 25.0),
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
            const SizedBox(
              height: 150,
            ),
            Custombutton(
                text: 'next',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Otppage()));
                })
          ],
        ),
      ),
    );
  }
}
