import 'package:equatable/equatable.dart';
import '../../../data/models/updatecard/data.dart';

class Updatecartstateextend extends Equatable {
  const Updatecartstateextend();

  @override
  List<Object?> get props => [];
}

class UpdatecartstateInitial extends Updatecartstateextend {}

class UpdatecartstateLoading extends Updatecartstateextend {}

class UpdatecartstateSuccess extends Updatecartstateextend {
  final Dataupdate data;
  const UpdatecartstateSuccess(this.data);
}

class UpdatecartstateFailure extends Updatecartstateextend {
  final String errMessage;
  const UpdatecartstateFailure(this.errMessage);
}

class UpdatecartstateCountIncreased extends Updatecartstateextend {
  final Dataupdate data;
  const UpdatecartstateCountIncreased(this.data);
}

class UpdatecartstateCountDecreased extends Updatecartstateextend {
  final Dataupdate data;
  const UpdatecartstateCountDecreased(this.data);
}
