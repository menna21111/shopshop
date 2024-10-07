import 'package:equatable/equatable.dart';

import '../../../data/models/categories_model/datum.dart';

abstract class Catagorystate extends Equatable {
  const Catagorystate();
  @override
  List<Object> get props => [];
}

class CatgoryInitial extends Catagorystate {}

class CatgoryLoading extends Catagorystate {}

class CatgorySuccess extends Catagorystate {
  final List<Datuum> catgorymodel;

  const CatgorySuccess(this.catgorymodel);
}

class CatgoryFailure extends Catagorystate {
  final String errorMessage;
  const CatgoryFailure(this.errorMessage);
}
