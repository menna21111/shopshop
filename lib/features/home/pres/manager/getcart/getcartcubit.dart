import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/features/home/pres/manager/getcart/getcartstate.dart';

import '../../../data/repo/home_repo.dart';

class Getcartcubit extends Cubit<Getcartstate> {
  Getcartcubit(this.homeRepo) : super(GetcartstateInitial());
  final HomeRepo homeRepo;
  Future<void> getcart() async {
    emit(GetcartstateLoading());
    final response = await homeRepo.getcart();
    response.fold(
      (errorMessage) {
        emit(GetcartstateFailure(errorMessage.errMessage));
      },
      (getcart) {
        emit(GetcartstateSuccess(getcart));
      },
    );
  }
}
