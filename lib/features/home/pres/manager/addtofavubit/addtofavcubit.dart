import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopshop/features/home/pres/manager/BANNERCUBIT/bannerstate.dart';

import '../../../data/repo/home_repo.dart';
import 'addtofavstate.dart';

class Addtofavcubit extends Cubit<Addtofavstate> {
  final HomeRepo homeRepo;

  Addtofavcubit(
    this.homeRepo,
  ) : super(AddtofavstateInitial());

  Future<void> addtofav({required int id}) async {
    emit(AddtofavstateLoading());
    final response = await homeRepo.addtofav(id: id ?? 52);
    response.fold(
      (errorMessage) {
        emit(AddtofavstateFailure(errorMessage.errMessage));
      },
      (addtofav) {
        emit(AddtofavstateSuccess(addtofav));
      },
    );
  }
}
