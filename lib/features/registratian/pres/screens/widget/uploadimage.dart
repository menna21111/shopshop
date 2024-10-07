import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../costant/colors.dart';
import '../../../../../costant/size.dart';
import '../../cubit/usercubit.dart';
import '../../cubit/userstate.dart';

class Uploadimage extends StatelessWidget {
  const Uploadimage({super.key});

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return BlocConsumer<UserCubit, UserState>(
      builder: (context, state) {
        return SizedBox(
            height: Screan_size.hieght * .2,
            child: context.read<UserCubit>().profileimage == null
                ? Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('assets/images.jpeg'),
                      ),
                      Positioned(
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () async {
                              ImagePicker()
                                  .pickImage(source: ImageSource.gallery)
                                  .then((value) => context
                                      .read<UserCubit>()
                                      .uploadprofilepic(value!));
                            },
                            child: const Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                ),
                                Icon(
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
                    radius: 70,
                    backgroundImage: FileImage(
                        File(context.read<UserCubit>().profileimage!.path)),
                  ));
      },
      listener: (BuildContext context, UserState state) {},
    );
  }
}
