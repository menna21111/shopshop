import 'package:equatable/equatable.dart';

import '../../../data/models/getfav/datum.dart';

abstract class Getfavstate extends Equatable {
  const Getfavstate();
  @override
  List<Object> get props => [];
}

class GetfavstateInitial extends Getfavstate {}

class GetfavstateLoading extends Getfavstate {}

class GetfavstateSuccess extends Getfavstate {
  final List<Datuwm> getfav;
  const GetfavstateSuccess(this.getfav);
}

class GetfavstateFailure extends Getfavstate {
  final String errorMessage;
  const GetfavstateFailure(this.errorMessage);
}
