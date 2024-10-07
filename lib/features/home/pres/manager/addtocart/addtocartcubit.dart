import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/features/home/data/repo/home_repo.dart';

import 'addcartstate.dart';

class Addtocartcubit extends Cubit<Addcartstate> {
  Addtocartcubit(this.homeRepo) : super(AddcartstateInitial());
  final HomeRepo homeRepo;
  Future<void> addtocart({required int id}) async {
    emit(AddcartstateLoading());
    final response = await homeRepo.addttocart(id: id ?? 52);
    response.fold(
      (errorMessage) {
        emit(AddcartstateFailure(errorMessage.errMessage));
      },
      (addtocart) {
        emit(AddcartstateSuccess(addtocart));
      },
    );
  }
}
