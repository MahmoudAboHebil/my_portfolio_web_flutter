import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:portfolio_2/data/models/info_model/info_model.dart';
import 'package:portfolio_2/data/repository/data_repo.dart';
import 'package:portfolio_2/logic/cubit_info/cubit_info_state.dart';

class CubitInfo extends Cubit<CubitInfoState> {
  final DataRepository firRepo;

  CubitInfo({required this.firRepo}) : super(LoadingData()) {
    try {
      loadedData();
    } catch (e) {
      errorData(e.toString());
    }
  }

  void loadingData() {
    emit(LoadingData());
  }

  void loadedData() async {
    InfoModel model = await firRepo.getInfo();

    emit(LoadedData(info: model));
  }

  void errorData(String msg) {
    emit(ErrorData(msg: msg));
  }

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  void onChange(Change<CubitInfoState> change) {
    print(change);
    super.onChange(change);
  }
}
