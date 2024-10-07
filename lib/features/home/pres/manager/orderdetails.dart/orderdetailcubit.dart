import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/features/home/pres/manager/getorder/getorderstate.dart';

import '../../../data/repo/home_repo.dart';
import 'orderdetailsstate.dart';

class Getorderdetailscubit extends Cubit<Orderdetailsstate> {
  Getorderdetailscubit(this.homeRepo) : super(Getorderdetailsinitial());
  final HomeRepo homeRepo;

  Future<void> getorder({required int id}) async {
    emit(Getorderdetaiksloading());
    final response = await homeRepo.getorderdetailss(id: id);
    response.fold(
      (errorMessage) {
        emit(Getordedetailsrerror(errorMessage.errMessage));
      },
      (getcart) {
        emit(Getorderdetailsloaded(getcart));
      },
    );
  }
}
