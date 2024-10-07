import 'package:flutter/material.dart';

import '../../../../../costant/colors.dart';
import '../widget/custombutton.dart';
import '../widget/otp_form.dart';
import 'setnewpasswordscreen.dart';

class Otppage extends StatelessWidget {
  const Otppage({super.key});

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
              margin: const EdgeInsets.only(
                  top: 48, left: 16, right: 16, bottom: 25),
              alignment: Alignment.centerLeft,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'veridication code',
                    style: TextStyle(
                        fontSize: 22,
                        color: kmaincolor,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'we have sent the code verificetion to \n your email',
                    style: TextStyle(fontSize: 14, color: kgreycolor),
                  ),
                ],
              ),
            ),
            const OtpForm(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'resend code after',
                style: TextStyle(color: kgreycolor),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Custombutton(
                text: 'confrim',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChangePassword()));
                })
          ],
        ),
      ),
    );
  }
}
