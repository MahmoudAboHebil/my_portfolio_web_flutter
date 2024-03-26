import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:abohebil_portfolio/data/models/project_model/project_model.dart';
import 'package:abohebil_portfolio/data/repository/data_repo.dart';
import 'package:abohebil_portfolio/logic/cubit_projects/cubit_projects_state.dart';

class CubitProjects extends Cubit<CubitProjectsState> {
  final DataRepository firRepo;
  late StreamSubscription _subscription;
  CubitProjects({required this.firRepo}) : super(LoadingData()) {
    try {
      _subscription = firRepo.getProjects().listen((projects) {
        loadedData(projects);
      });
    } catch (e) {
      errorData(e.toString());
    }
  }

  void loadingData() {
    emit(LoadingData());
  }

  void loadedData(List<ProjectModel> projects) {
    emit(LoadedData(projects: projects));
  }

  void errorData(String msg) {
    emit(ErrorData(msg: msg));
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
