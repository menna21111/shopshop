import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/home_repo.dart';
import 'updatecartstate.dart';

class Updatecubite extends Cubit<Updatecartstateextend> {
  Updatecubite(
    this.homeRepo,
  ) : super(UpdatecartstateInitial());
  final HomeRepo homeRepo;

  Future<void> increaseCount(
      {required int id, required int currentCount}) async {
    final newCount = currentCount;

    emit(UpdatecartstateLoading());

    final response = await homeRepo.updatecart(id: id, count: newCount);

    response.fold(
      (errorMessage) {
        emit(UpdatecartstateFailure(errorMessage.errMessage));
      },
      (updatecard) {
        // Emit success with updated count
        emit(UpdatecartstateSuccess(updatecard));
      },
    );
  }

  Future<void> decreaseCount(
      {required int id, required int currentCount}) async {
    final newcount = currentCount;

    emit(UpdatecartstateLoading());

    final response = await homeRepo.updatecart(id: id, count: newcount);

    response.fold(
      (errorMessage) {
        emit(UpdatecartstateFailure(errorMessage.errMessage));
      },
      (updatecard) {
        // Emit success with updated count
        emit(UpdatecartstateSuccess(updatecard));
      },
    );
  }
}
