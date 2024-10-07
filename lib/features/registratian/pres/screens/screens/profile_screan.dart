import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../costant/colors.dart';
import '../../../../../costant/size.dart';
import '../../cubit/usercubit.dart';
import '../../cubit/userstate.dart';

class ProfileScrean extends StatelessWidget {
  const ProfileScrean({super.key});

  @override
  Widget build(BuildContext context) {
     context.read<UserCubit>().getuser();
    Screan_size.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<UserCubit, UserState>(builder: (context, State) {
          if (State is GetUserSuccess) {
            return Column(
              children: [
                SizedBox(
                  height: Screan_size.hieght * .06,
                ),
                Center(
                  child: SizedBox(
                    height: Screan_size.hieght * .18,
                    child: context.read<UserCubit>().profileimage == null
                        ? Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.bottomCenter,
                            children: [
                              CircleAvatar(
                                radius: Screan_size.hieght * .075,
                                backgroundColor: Colors.red,
                                child: CircleAvatar(
                                  foregroundColor: Colors.red,
                                  radius: Screan_size.hieght * .074,
                                  backgroundColor: Colors.grey,
                                  child: CachedNetworkImage(
                                    imageUrl: State.userModel.image ?? '',
                                    fit: BoxFit.fill,
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
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
                                        color: khomecolor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : CircleAvatar(
                            radius: Screan_size.hieght * .08,
                            backgroundImage: FileImage(
                              File(
                                  context.read<UserCubit>().profileimage!.path),
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: Screan_size.hieght * .08,
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: Screan_size.hieght * .02,
                    bottom: Screan_size.hieght * .02,
                  ),
                  margin: EdgeInsets.symmetric(
                      horizontal: Screan_size.hieght * .035),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Screan_size.hieght * .035),
                            child: const Text(
                              'email',
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                      infocardprofile(text: State.userModel.email ?? 'eror'),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              'name',
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                      infocardprofile(text: State.userModel.name ?? 'eror'),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Screan_size.hieght * .035),
                            child: const Text(
                              'phone',
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                      infocardprofile(text: State.userModel.phone ?? 'eror'),
                    ],
                  ),
                ),
              ],
            );
          } else if (State is GetUserFailure) {
            return Center(child: Text(State.errorMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}

Widget infocardprofile({required String text}) {
  return Container(
    margin: const EdgeInsets.all(8),
    width: 300,
    padding: EdgeInsets.all(6),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      text,
      style: const TextStyle(color: khomecolor),
    ),
  );
}
