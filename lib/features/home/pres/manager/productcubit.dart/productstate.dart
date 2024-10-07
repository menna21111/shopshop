import 'package:equatable/equatable.dart';

import '../../../data/models/home_model/product.dart';

abstract class Productstate extends Equatable {
  const Productstate();
  @override
  List<Object> get props => [];
}

class ProudctInitial extends Productstate {}

class ProudctLoading extends Productstate {}

class ProudctSuccess extends Productstate {
  final List<Product> proudctmodel;

  const ProudctSuccess(this.proudctmodel);
}

class ProudctFailure extends Productstate {
  final String errorMessage;
  const ProudctFailure(this.errorMessage);
}
