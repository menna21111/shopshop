import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/features/home/pres/manager/getorder/getorderstate.dart';

import '../../../data/repo/home_repo.dart';

class Getordercubit extends Cubit<Getorderstate> {
  Getordercubit(this.homeRepo) : super(Getorderinitial());
  final HomeRepo homeRepo;

  Future<void> getorder() async {
    emit(Getorderloading());
    final response = await homeRepo.getorder();
    response.fold(
      (errorMessage) {
        emit(Getordererror(errorMessage.errMessage));
      },
      (getcart) {
        emit(Getorderloaded(getcart));
      },
    );
  }
}
