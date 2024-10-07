import 'package:equatable/equatable.dart';
import 'package:shopshop/features/home/data/models/searchresultmodel/datum.dart';

class Searchstate extends Equatable {
  const Searchstate();
  @override
  List<Object?> get props => [];
}

class Searchinitial extends Searchstate {}

class Searchloading extends Searchstate {}

class Searchsuccess extends Searchstate {
  final List<Datumsearch> data;
  const Searchsuccess(this.data);
}

class Searcherror extends Searchstate {
  final String error;
  const Searcherror(this.error);
}
