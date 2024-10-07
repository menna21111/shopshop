import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/features/home/pres/manager/searchcubit.dart/searchstate.dart';

import '../../../data/repo/home_repo.dart';

class Searchcubit extends Cubit<Searchstate> {
  Searchcubit(this.homeRepo) : super(Searchinitial());

  final HomeRepo homeRepo;

  Future<void> search(String query) async {
    emit(Searchloading());
    final result = await homeRepo.search(text: query);

    result.fold(
      (l) => emit(Searcherror(l.errMessage)),
      (r) => emit(Searchsuccess(r)),
    );
  }
}
