import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:portfolio_2/data/models/eduAndExp_model/eduAndExp_model.dart';
import 'package:portfolio_2/data/repository/data_repo.dart';
import 'package:portfolio_2/logic/cubitEduAndExp/cubitEduAndExp_state.dart';

class CubitEduAndExp extends Cubit<CubitEduAndExpState> {
  final DataRepository firRepo;

  CubitEduAndExp({required this.firRepo}) : super(LoadingData()) {
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
    List<EduAndExpModel> educations = await firRepo.getEducations();
    List<EduAndExpModel> experiences = await firRepo.getExperiences();

    emit(LoadedData(educations: educations, experiences: experiences));
  }

  void errorData(String msg) {
    emit(ErrorData(msg: msg));
  }

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  void onChange(Change<CubitEduAndExpState> change) {
    print(change);
    super.onChange(change);
  }
}
