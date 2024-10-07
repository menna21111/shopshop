import 'package:equatable/equatable.dart';

import '../../../data/models/estimatordersponse/data.dart';

class Estimateorderstate extends Equatable {
  const Estimateorderstate();
  @override
  List<Object> get props => [];
}

class EstimateorderstateInitial extends Estimateorderstate {}

class EstimateorderstateLoading extends Estimateorderstate {}

class EstimateorderstateSuccess extends Estimateorderstate {
  final Dataestm data;
  const EstimateorderstateSuccess(this.data);
}

class EstimateorderstateFailure extends Estimateorderstate {
  final String errorMessage;
  const EstimateorderstateFailure(this.errorMessage);
}
