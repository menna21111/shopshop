import 'package:equatable/equatable.dart';

import '../../../data/models/addtofav/addtofav.dart';

abstract class Addtofavstate extends Equatable {
  const Addtofavstate();
  @override
  List<Object> get props => [];
}

class AddtofavstateInitial extends Addtofavstate {}

class AddtofavstateLoading extends Addtofavstate {}

class AddtofavstateSuccess extends Addtofavstate {
  final Addtofav addtofav;

  const AddtofavstateSuccess(this.addtofav);
}

class AddtofavstateFailure extends Addtofavstate {
  final String errorMessage;
  const AddtofavstateFailure(this.errorMessage);
}
