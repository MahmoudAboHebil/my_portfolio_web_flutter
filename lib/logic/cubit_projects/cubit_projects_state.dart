import 'package:equatable/equatable.dart';
import 'package:portfolio_2/data/models/project_model/project_model.dart';

abstract class CubitProjectsState extends Equatable {}

class LoadingData extends CubitProjectsState {
  @override
  List<Object> get props => [];
}

class LoadedData extends CubitProjectsState {
  final List<ProjectModel> projects;
  LoadedData({required this.projects});

  @override
  List<Object> get props => [projects];
}

class ErrorData extends CubitProjectsState {
  final String msg;
  ErrorData({required this.msg});
  @override
  List<Object> get props => [msg];
}
