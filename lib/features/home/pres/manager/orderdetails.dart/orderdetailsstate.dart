import 'package:equatable/equatable.dart';

import '../../../data/models/orderdetails/data.dart';

class Orderdetailsstate extends Equatable {
  const Orderdetailsstate();

  @override
  List<Object?> get props => [];
}

class Getorderdetailsinitial extends Orderdetailsstate {}

class Getorderdetaiksloading extends Orderdetailsstate {}

class Getorderdetailsloaded extends Orderdetailsstate {
  final DataOrderDetails products;
  const Getorderdetailsloaded(this.products);
}

class Getordedetailsrerror extends Orderdetailsstate {
  final String error;
  const Getordedetailsrerror(this.error);
}
