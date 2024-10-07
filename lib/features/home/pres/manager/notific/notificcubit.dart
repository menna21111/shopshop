import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/features/home/data/repo/home_repo.dart';

import 'notificstate.dart';

class Notificcubit extends Cubit<Notificstate> {
  Notificcubit(this.homeRepo) : super(NotificstateInitial());
  final HomeRepo homeRepo;
  Future<void> notific() async {
    emit(NotificstateLoading());
    final response = await homeRepo.getnotications();
    response.fold(
      (errorMessage) {
        emit(NotificstateFailure(errorMessage.errMessage));
      },
      (data) {
        emit(NotificstateSuccess(data));
      },
    );
  }
}
