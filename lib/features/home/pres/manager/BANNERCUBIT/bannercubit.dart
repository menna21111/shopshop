import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopshop/features/home/pres/manager/BANNERCUBIT/bannerstate.dart';

import '../../../data/repo/home_repo.dart';

class Bannercubit extends Cubit<BannerState> {
  final HomeRepo homeRepo;

  Bannercubit(this.homeRepo) : super(BannerInitial());

  Future<void> getBanner() async {
    emit(BannerLoading());
    final response = await homeRepo.getBanners();
    response.fold(
      (errorMessage) {
        emit(BannerFailure(errorMessage.errMessage));
      },
      (bannermodel) {
        emit(BannerSuccess(bannermodel));
      },
    );
  }
}
