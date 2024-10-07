import 'package:flutter_bloc/flutter_bloc.dart';

import 'imageselectstste.dart';

class Imageselectcubit extends Cubit<Imageselectstste> {
  Imageselectcubit() : super(ImageselectInitial());
  late int index;

  void changeindex(int index) {
    this.index = index;
    emit(ImageselectSuccess());
  }
}
