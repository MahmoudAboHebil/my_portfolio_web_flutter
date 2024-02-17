import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:portfolio_2/data/models/path_model/path_model.dart';
import 'package:portfolio_2/data/repository/data_repo.dart';
import 'package:portfolio_2/logic/cubit_path/cubit_path_state.dart';

class CubitPath extends Cubit<CubitPathState> {
  final DataRepository firRepo;
  late StreamSubscription _subscription;
  CubitPath({required this.firRepo}) : super(LoadingData()) {
    try {
      _subscription = firRepo.getPaths().listen((paths) {
        loadedData(paths);
      });
    } catch (e) {
      errorData(e.toString());
    }
  }

  void loadingData() {
    emit(LoadingData());
  }

  void loadedData(List<PathModel> paths) {
    emit(LoadedData(paths: paths));
  }

  void errorData(String msg) {
    emit(ErrorData(msg: msg));
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }

  @override
  void onChange(Change<CubitPathState> change) {
    print(change);
    super.onChange(change);
  }
}
