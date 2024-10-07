import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/home_repo.dart';
import 'productstate.dart';

class Productcubit extends Cubit<Productstate> {
  final HomeRepo homeRepo;

  Productcubit(this.homeRepo) : super(ProudctInitial());

  Future<void> getproduct() async {
    emit(ProudctLoading());
    final response = await homeRepo.getproducts();
    response.fold(
      (errorMessage) {
        emit(ProudctFailure(errorMessage.errMessage));
      },
      (proudctmodel) {
        emit(ProudctSuccess(proudctmodel));
      },
    );
  }
}
