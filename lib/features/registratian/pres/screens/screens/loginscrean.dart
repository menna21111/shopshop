import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/features/home/pres/view/homeviewbody.dart';
import 'package:shopshop/features/registratian/pres/screens/screens/otppage.dart';

import '../../../../../core/utls/bottomnavBAR.dart';
import '../../../../../costant/colors.dart';
import '../../../../../costant/size.dart';
import '../../cubit/usercubit.dart';
import '../../cubit/userstate.dart';
import '../widget/custombutton.dart';
import '../widget/textfield.dart';
import 'profile_screan.dart';
import 'signupscrean.dart';
import 'verifypage.dart';

class Loginscrean extends StatelessWidget {
  const Loginscrean({super.key});

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context); // Initialize screen size

    return Scaffold(
      body: Center(
        child: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is SignInSuccess) {
              context.read<UserCubit>().getuser();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BottomNavigation()));
            } else if (state is SignInFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      inherit: false,
                      color: khomecolor,
                      fontSize: Screan_size.width * 0.1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: Screan_size.hieght * 0.02,
                  ),
                  Text(
                    'Sign in with your email and password \n or with social media',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      inherit: false,
                      color: Colors.grey,
                      fontSize: Screan_size.width * 0.04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: Screan_size.hieght * 0.07,
                  ),
                  Form(
                    child: Column(
                      children: [
                        Customtextfield(
                          controller: context.read<UserCubit>().signinemail,
                          hinttext: 'enter your email',
                          icon: Icons.email_outlined,
                          labeltext: '  Email ',
                        ),
                        SizedBox(
                          height: Screan_size.hieght * 0.04,
                        ),
                        Customtextfield(
                          hinttext: 'enter your Password',
                          icon: Icons.lock_outline,
                          labeltext: '  Password  ',
                          controller: context.read<UserCubit>().signinpassword,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Screan_size.hieght * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: Screan_size.width * 0.05),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Chanepassword()));
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: const Text(
                          'Forgot password',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: khomecolor,
                            decorationThickness: 1.5,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Screan_size.hieght * 0.04,
                  ),
                  BlocBuilder<UserCubit, UserState>(builder: (context, state) {
                    return state is SignInLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Custombutton(
                            onPressed: () {
                              context.read<UserCubit>().login();
                            },
                            text: 'sign in',
                          );
                  }),
                  Padding(
                    padding: EdgeInsets.only(
                        right: Screan_size.width * 0.1,
                        top: Screan_size.hieght * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('don\'t have an account ? '),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Signupscrean()));
                            },
                            child: const Text(
                              'sign up',
                              style: TextStyle(
                                color: khomecolor,
                                //  decoration: TextDecoration.underline
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
