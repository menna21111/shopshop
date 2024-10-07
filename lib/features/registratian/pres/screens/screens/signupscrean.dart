import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopshop/costant/colors.dart';
import 'package:shopshop/costant/size.dart';
import '../../cubit/usercubit.dart';
import '../../cubit/userstate.dart';
import '../widget/custombutton.dart';

import '../widget/custombutton.dart';
import '../widget/textfield.dart';
import 'otppage.dart';

class Signupscrean extends StatelessWidget {
  const Signupscrean({super.key});

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return Scaffold(
      body: Center(
        child: BlocConsumer<UserCubit, UserState>(listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.userModel.message??'تم التسجيل بنجاح'),
              backgroundColor: Colors.red,
            ));
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(' حدثت خطأ ماراجع التسجيل او انقطع  الاتصال بالانترنت'),
              backgroundColor: Colors.red,
            ));
          }
          else if (state is SignUpFailure&&state.errorMessage=="رقم الهاتف الذي قمت بإدخاله مستخدم من قبل") {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('رقم الهاتف الذي قمت بإدخاله مستخدم من قبل'),
              backgroundColor: Colors.red,
            ));
          }
          else if (state is SignUpFailure&&state.errorMessage=='البريد الإلكتروني مستخدم من قبل') {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('البريد الإلكتروني مستخدم من قبل'),
              backgroundColor: Colors.red,
            ));
          }
          else if (state is SignUpFailure&&state.errorMessage=="برجاء ادخال كلمة المرور") {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("برجاء ادخال كلمة المرور"),
              backgroundColor: Colors.red,
            ));
          }
          else if (state is SignUpFailure&&state.errorMessage=="برجاء ادخال البريد الإلكتروني") {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("برجاء ادخال البريد الإلكتروني"),
              backgroundColor: Colors.red,
            ));
          }
          else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ));
          }
        }, builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Screan_size.hieght * 0.08,
                ),
                BlocConsumer<UserCubit, UserState>(
                  builder: (context, state) {
                    return SizedBox(
                        height: Screan_size.hieght * 0.18,
                        child: context.read<UserCubit>().profileimage == null
                            ? Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.bottomCenter,
                                children: [
                                  CircleAvatar(
                                    radius: Screan_size.hieght * 0.09,
                                    backgroundColor: Colors.grey,
                                    backgroundImage:
                                        const AssetImage('assets/images.jpeg'),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      child: GestureDetector(
                                        onTap: () async {
                                          ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.gallery)
                                              .then((value) => context
                                                  .read<UserCubit>()
                                                  .uploadprofilepic(value!));
                                        },
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          alignment: Alignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius:
                                                  Screan_size.hieght * 0.029,
                                              backgroundColor: Colors.white,
                                            ),
                                            const Icon(
                                              Icons.add,
                                              size: 32,
                                              color: kmaincolor,
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              )
                            : CircleAvatar(
                                radius: Screan_size.hieght * 0.12,
                                backgroundImage: FileImage(File(context
                                    .read<UserCubit>()
                                    .profileimage!
                                    .path)),
                              ));
                  },
                  listener: (BuildContext context, UserState state) {},
                ),
                SizedBox(
                  height: Screan_size.hieght * 0.06,
                ),
                Customtextfield(
                  controller: context.read<UserCubit>().name,
                  hinttext: 'entre your name',
                  icon: Icons.person_outline,
                  labeltext: '  Name ',
                ),
                SizedBox(
                  height: Screan_size.hieght * 0.045,
                ),
                Customtextfield(
                  controller: context.read<UserCubit>().phone,
                  hinttext: 'entre your phone',
                  icon: Icons.call_outlined,
                  labeltext: '  phone number ',
                ),
                SizedBox(
                  height: Screan_size.hieght * 0.045,
                ),
                Customtextfield(
                  controller: context.read<UserCubit>().signupemail,
                  hinttext: 'entre your email',
                  icon: Icons.email_outlined,
                  labeltext: '  Email ',
                ),
                SizedBox(
                  height: Screan_size.hieght * 0.045,
                ),
                Customtextfield(
                  controller: context.read<UserCubit>().signuppassword,
                  hinttext: 'entre your Password',
                  icon: Icons.lock_outline,
                  labeltext: '  Password  ',
                ),
                SizedBox(
                  height: Screan_size.hieght * 0.045,
                ),
                BlocBuilder<UserCubit, UserState>(builder: (context, State) {
                  return State is SignUpLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Custombutton(
                          onPressed: () {
                            context.read<UserCubit>().signUP();
                          },
                          text: 'Sign up',
                        );
                }),
                Padding(
                  padding: const EdgeInsets.only(right: 40.0, top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'already have an account?',
                        style: TextStyle(),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(
                              context); // Go back to the previous screen
                        },
                        child: const Text(
                          'login',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Screan_size.hieght * 0.045,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
