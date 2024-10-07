import 'package:equatable/equatable.dart';

import '../../../data/models/notficationmo/datum.dart';

class Notificstate extends Equatable {
  const Notificstate();

  @override
  List<Object> get props => [];
}

class NotificstateInitial extends Notificstate {}

class NotificstateLoading extends Notificstate {}

class NotificstateSuccess extends Notificstate {
  final List<Datumnot> datumnot;
  const NotificstateSuccess(this.datumnot);
}

class NotificstateFailure extends Notificstate {
  final String errorMessage;
  const NotificstateFailure(this.errorMessage);
}
