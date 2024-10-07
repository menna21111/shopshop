import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/home_repo.dart';
import 'estimateorderstate.dart';

class Estimateordercubit extends Cubit<Estimateorderstate> {
  Estimateordercubit(this.homeRepo) : super(EstimateorderstateInitial());
  final HomeRepo homeRepo;

  Future<void> estimateorder() async {
    emit(EstimateorderstateLoading());
    final response =
        await homeRepo.estimateorder(promocodeid: 4, usepoints: true);
    response.fold(
      (errorMessage) {
        emit(EstimateorderstateFailure(errorMessage.errMessage));
      },
      (data) {
        emit(EstimateorderstateSuccess(data));
      },
    );
  }
}
