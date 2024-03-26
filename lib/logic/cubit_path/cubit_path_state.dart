import 'package:equatable/equatable.dart';
import 'package:abohebil_portfolio/data/models/path_model/path_model.dart';

abstract class CubitPathState extends Equatable {}

class LoadingData extends CubitPathState {
  @override
  List<Object> get props => [];
}

class LoadedData extends CubitPathState {
  final List<PathModel> paths;
  LoadedData({required this.paths});

  @override
  List<Object> get props => [paths];
}

class ErrorData extends CubitPathState {
  final String msg;
  ErrorData({required this.msg});
  @override
  List<Object> get props => [msg];
}
