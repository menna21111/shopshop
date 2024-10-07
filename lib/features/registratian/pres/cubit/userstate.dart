import 'package:equatable/equatable.dart';
import 'package:shopshop/features/home/data/models/home_model/data.dart';
import 'package:shopshop/features/registratian/data/models/signupmodel/signupmodel.dart';

import '../../data/models/profilemodel/data.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UploadProfilePic extends UserState {}

class SignInLoading extends UserState {}

class SignInSuccess extends UserState {}

class SignInFailure extends UserState {
  final String errorMessage;
  const SignInFailure(this.errorMessage);
}

class GetUserLoading extends UserState {}

class GetUserSuccess extends UserState {
  final Data userModel;

  const GetUserSuccess(this.userModel);
}

class GetUserFailure extends UserState {
  final String errorMessage;
  const GetUserFailure(this.errorMessage);
}

class SignUpLoading extends UserState {}

class SignUpSuccess extends UserState {
  final Signupmodel userModel;

  const SignUpSuccess(this.userModel);
      
}

class SignUpFailure extends UserState {
  final String errorMessage;
  const SignUpFailure(this.errorMessage);
}

class VerifyLoading extends UserState {}

class VerifySuccess extends UserState {}

class VerifyFailure extends UserState {
  final String errorMessage;
  const VerifyFailure(this.errorMessage);
}

class VerifycodedLoading extends UserState {}

class VerifycodedSuccess extends UserState {}

class VerifycodedFailure extends UserState {
  final String errorMessage;
  const VerifycodedFailure(this.errorMessage);
}

class ChangePasswordLoading extends UserState {}

class ChangePasswordSuccess extends UserState {}

class ChangePasswordFailure extends UserState {
  final String errorMessage;
  const ChangePasswordFailure(this.errorMessage);
}

class ResetPasswordLoading extends UserState {}

class ResetPasswordSuccess extends UserState {}

class ResetPasswordFailure extends UserState {
  final String errorMessage;
  const ResetPasswordFailure(this.errorMessage);
}
