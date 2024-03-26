import 'package:equatable/equatable.dart';
import 'package:portfolio_2/data/models/eduAndExp_model/eduAndExp_model.dart';

abstract class CubitEduAndExpState extends Equatable {}

class LoadingData extends CubitEduAndExpState {
  @override
  List<Object> get props => [];
}

class LoadedData extends CubitEduAndExpState {
  final List<EduAndExpModel> educations;
  final List<EduAndExpModel> experiences;
  LoadedData({required this.educations, required this.experiences});

  @override
  List<Object> get props => [educations, experiences];
}

class ErrorData extends CubitEduAndExpState {
  final String msg;
  ErrorData({required this.msg});
  @override
  List<Object> get props => [msg];
}
