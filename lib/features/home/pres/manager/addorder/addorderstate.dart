import 'package:equatable/equatable.dart';
import 'package:shopshop/features/home/data/repo/home_repo.dart';

class Addorderstate extends Equatable {
  const Addorderstate();
  @override
  List<Object> get props => [];
}

class AddorderstateInitial extends Addorderstate {}

class AddorderstateLoading extends Addorderstate {}

class AddorderstateSuccess extends Addorderstate {}

class AddorderstateFailure extends Addorderstate {
  final String errorMessage;
  const AddorderstateFailure(this.errorMessage);
}
