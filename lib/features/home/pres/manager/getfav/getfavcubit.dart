import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/features/home/data/repo/home_repo.dart';
import 'package:shopshop/features/home/pres/manager/getfav/getfavstate.dart';

class Getfavcubit extends Cubit<Getfavstate> {
  Getfavcubit(this.homeRepo) : super(GetfavstateInitial());
  final HomeRepo homeRepo;
  Future<void> getfav() async {
    emit(GetfavstateLoading());
    final response = await homeRepo.getfav();
    response.fold(
      (errorMessage) {
        emit(GetfavstateFailure(errorMessage.errMessage));
      },
      (getfav) {
        emit(GetfavstateSuccess(getfav));
      },
    );
  }
}
