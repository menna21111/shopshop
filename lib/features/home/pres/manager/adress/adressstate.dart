import 'package:equatable/equatable.dart';
import 'package:shopshop/features/home/data/models/adreesresponse/adreesresponse.dart';

class Adressstate extends Equatable {
  const Adressstate();
  @override
  List<Object> get props => [];
}

class AdressstateInitial extends Adressstate {}

class AdressstateLoading extends Adressstate {}

class AdressstateSuccess extends Adressstate {
  final Adreesresponse adreesresponse;
  const AdressstateSuccess(this.adreesresponse);
}

class AdressstateFailure extends Adressstate {
  final String errorMessage;
  const AdressstateFailure(this.errorMessage);
}
