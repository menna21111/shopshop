import 'package:equatable/equatable.dart';

import '../../../../cart/data/model/addtocart/addtocart.dart';

class Addcartstate extends Equatable {
  const Addcartstate();
  @override
  List<Object> get props => [];
}

class AddcartstateInitial extends Addcartstate {}

class AddcartstateLoading extends Addcartstate {}

class AddcartstateSuccess extends Addcartstate {
  final Addtocart addtocart;
  const AddcartstateSuccess(this.addtocart);
}

class AddcartstateFailure extends Addcartstate {
  final String errorMessage;
  const AddcartstateFailure(this.errorMessage);
}
