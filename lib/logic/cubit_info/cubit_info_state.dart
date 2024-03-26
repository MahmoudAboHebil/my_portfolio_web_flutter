import 'package:equatable/equatable.dart';
import 'package:abohebil_portfolio/data/models/info_model/info_model.dart';

abstract class CubitInfoState extends Equatable {}

class LoadingData extends CubitInfoState {
  @override
  List<Object> get props => [];
}

class LoadedData extends CubitInfoState {
  final InfoModel info;
  LoadedData({required this.info});

  @override
  List<Object> get props => [info];
}

class ErrorData extends CubitInfoState {
  final String msg;
  ErrorData({required this.msg});
  @override
  List<Object> get props => [msg];
}
