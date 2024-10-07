import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/core/func/upload_image.dart';
import 'package:shopshop/features/registratian/pres/screens/screens/setnewpasswordscreen.dart';

import '../../data/repo.dart';
import 'userstate.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserInitial());
  final UserRepository userRepository;
  GlobalKey<FormState> signup = GlobalKey<FormState>();
  GlobalKey<FormState> signinkey = GlobalKey<FormState>();

  TextEditingController signinemail = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController signinpassword = TextEditingController();
  TextEditingController newpasswordpassword = TextEditingController();
  TextEditingController signupemail = TextEditingController();
  TextEditingController signuppassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  XFile? profileimage;

  uploadprofilepic(XFile image) {
    profileimage = image;
    emit(UploadProfilePic());
  }

  Future<void> requestPermissions() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }

    status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  Future<void> signUP() async {
    emit(SignUpLoading());
    final response = await userRepository.signup(
        email: signupemail.text,
        password: signuppassword.text,
        phone: phone.text,
        name: name.text,
        profilePic: profileimage ?? XFile(''));
    response.fold(
      (errorMessage) {
        emit(SignUpFailure(errorMessage.errMessage));
      },
      (signUpModel) {
        emit(SignUpSuccess(signUpModel));
      },
    );
  }

  Future<void> login() async {
    emit(SignInLoading());
    final response = await userRepository.login(
      email: signinemail.text.toString(),
      password: signinpassword.text,
    );
    print(response);
    response.fold(
      (error) {
        emit(SignInFailure(error.errMessage));
      },
      (user) {
        emit(SignInSuccess());
      },
    );
  }

  Future<void> getuser() async {
    emit(GetUserLoading());
    final response = await userRepository.getuser();
    print(response);
    response.fold(
      (error) {
        emit(GetUserFailure(error.errMessage));
      },
      (UserModel) {
        emit(GetUserSuccess(UserModel));
      },
    );
  }

  Future<void> changePassword() async {
    emit(ChangePasswordLoading());
    final response = await userRepository.changePassword(
        password: signinpassword.text, newpassword: newpasswordpassword.text);
    print(response);
    response.fold(
      (error) {
        emit(ChangePasswordFailure(error.errMessage));
      },
      (user) {
        emit(ChangePasswordSuccess());
      },
    );
  }

  Future<void> verifyemail() async {
    emit(VerifyLoading());
    final response = await userRepository.verifyemail(
      email: signinemail.text.toString(),
    );
    print(response);
    response.fold(
      (error) {
        emit(VerifyFailure(error.errMessage));
      },
      (user) {
        emit(VerifySuccess());
      },
    );
  }

  Future<void> verifycode() async {
    emit(VerifycodedLoading());
    final response = await userRepository.vrifycode(
        email: signinemail.text.toString(), code: code.text);
    print(response);
    response.fold(
      (error) {
        emit(VerifycodedFailure(error.errMessage));
      },
      (user) {
        emit(VerifycodedSuccess());
      },
    );
  }

  Future<void> resetpassword() async {
    emit(ResetPasswordLoading());
    final response = await userRepository.resetPassword(
        email: signinemail.text.toString(),
        code: code.text,
        password: signuppassword.text);
    print(response);
    response.fold(
      (error) {
        emit(ResetPasswordFailure(error.errMessage));
      },
      (user) {
        emit(ResetPasswordSuccess());
      },
    );
  }
}
