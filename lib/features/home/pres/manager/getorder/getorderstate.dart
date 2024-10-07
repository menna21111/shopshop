import 'package:equatable/equatable.dart';

import '../../../data/models/getordermodel/datum.dart';

class Getorderstate extends Equatable {
  const Getorderstate();

  @override
  List<Object?> get props => [];
}

class Getorderinitial extends Getorderstate {}

class Getorderloading extends Getorderstate {}

class Getorderloaded extends Getorderstate {
  final List<Datumorder> products;
  const Getorderloaded(this.products);
}

class Getordererror extends Getorderstate {
  final String error;
  const Getordererror(this.error);
}
