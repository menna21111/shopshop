import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/features/home/data/repo/home_repo.dart';
import 'package:shopshop/features/home/pres/manager/adress/adressstate.dart';

class Adresscubit extends Cubit<Adressstate> {
  final HomeRepo homeRepo;
  Adresscubit(this.homeRepo) : super(AdressstateInitial());
  TextEditingController region = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController? phone = TextEditingController();
  String? city;
  String? name;

  double? latitude;
  double? longitude;


  Future<void> addadress() async {
    emit(AdressstateLoading());
    final response = await homeRepo.addAddress(
        city: city ?? '',
        details: details.text,
        latitude: latitude ?? 0,
        longitude: longitude ?? 0,
        name: name ?? '',
        notes: phone?.text,
        region: region.text);
    response.fold(
      (errorMessage) {
        emit(AdressstateFailure(errorMessage.errMessage));
      },
      (adreesresponse) {
        emit(AdressstateSuccess(adreesresponse));
      },
    );
  }
}
