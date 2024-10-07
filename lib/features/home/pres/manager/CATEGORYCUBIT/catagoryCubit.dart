import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopshop/features/home/pres/manager/BANNERCUBIT/bannerstate.dart';

import '../../../data/repo/home_repo.dart';
import 'catagorystate.dart';

class Catagorycubit extends Cubit<Catagorystate> {
  final HomeRepo homeRepo;

  Catagorycubit(this.homeRepo) : super(CatgoryInitial());

  Future<void> geTcatagroy() async {
    emit(CatgoryLoading());
    final response = await homeRepo.getcategories();
    response.fold(
      (errorMessage) {
        emit(CatgoryFailure(errorMessage.errMessage));
      },
      (Catgorymodel) {
        emit(CatgorySuccess(Catgorymodel));
      },
    );
  }
}
