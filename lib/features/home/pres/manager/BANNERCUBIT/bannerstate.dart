import 'package:equatable/equatable.dart';

import '../../../data/models/bannermodel.dart/banner_model/datum.dart';

abstract class BannerState extends Equatable {
  const BannerState();
  @override
  List<Object> get props => [];
}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerSuccess extends BannerState {
  final List<Datum> bannermodel;

  const BannerSuccess(this.bannermodel);
}

class BannerFailure extends BannerState {
  final String errorMessage;
  const BannerFailure(this.errorMessage);
}
