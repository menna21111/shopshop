import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/home_repo.dart';
import 'addorderstate.dart';

class Addordercubit extends Cubit<Addorderstate> {
  Addordercubit(this.homeRepo) : super(AddorderstateInitial());
  final HomeRepo homeRepo;

  Future<void> addorder({required int id}) async {
    emit(AddorderstateLoading());
    final response = await homeRepo.addorder(
        addressid: id, paymentmethod: 1, usepoints: false);
    response.fold(
      (errorMessage) {
        emit(AddorderstateFailure(errorMessage.errMessage));
      },
      (addorder) {
        emit(AddorderstateSuccess());
      },
    );
  }
}
