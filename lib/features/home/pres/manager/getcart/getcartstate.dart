import 'package:equatable/equatable.dart';

import '../../../../cart/data/model/getcart/cart_item.dart';

abstract class Getcartstate extends Equatable {
  const Getcartstate();
  @override
  List<Object> get props => [];
}

class GetcartstateInitial extends Getcartstate {}

class GetcartstateLoading extends Getcartstate {}

class GetcartstateSuccess extends Getcartstate {
  final List<CartItem> getcart;
  const GetcartstateSuccess(this.getcart);
}

class GetcartstateFailure extends Getcartstate {
  final String errorMessage;
  const GetcartstateFailure(this.errorMessage);
}
