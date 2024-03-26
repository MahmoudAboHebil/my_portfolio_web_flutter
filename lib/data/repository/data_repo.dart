import 'package:portfolio_2/data/firebase_service/firebase_service.dart';
import 'package:portfolio_2/data/models/eduAndExp_model/eduAndExp_model.dart';
import 'package:portfolio_2/data/models/info_model/info_model.dart';
import 'package:portfolio_2/data/models/path_model/path_model.dart';
import 'package:portfolio_2/data/models/project_model/project_model.dart';

class DataRepository {
  final _fireService = FirebaseService();
  Stream<List<ProjectModel>> getProjects() {
    return _fireService.getProjectsCollection().snapshots().map((snapshot) {
      List<ProjectModel> list =
          snapshot.docs.map((snap) => ProjectModel.fromSnapshot(snap)).toList();
      list.sort((a, b) => a.index.compareTo(b.index));
      return list;
    });
  }

  Stream<List<PathModel>> getPaths() {
    return _fireService.getPathsCollection().snapshots().map((snapshot) {
      return snapshot.docs.map((snap) => PathModel.fromSnapshot(snap)).toList();
    });
  }

  Future<InfoModel> getInfo() async {
    var querySnapshot = await _fireService.getInfoCollection().get();
    return querySnapshot.docs
        .map((snap) => InfoModel.fromSnapshot(snap))
        .toList()[0];
  }

  Future<List<EduAndExpModel>> getEducations() async {
    var querySnapshot = await _fireService.getEduAndExpCollection().get();
    List<EduAndExpModel> allList = querySnapshot.docs
        .map((snap) => EduAndExpModel.fromSnapshot(snap))
        .toList();
    List<EduAndExpModel> educationList = [];
    for (EduAndExpModel model in allList) {
      if (model.type == 'Education') {
        educationList.add(model);
      }
    }
    educationList.sort((a, b) => a.index.compareTo(b.index));
    return educationList;
  }

  Future<List<EduAndExpModel>> getExperiences() async {
    var querySnapshot = await _fireService.getEduAndExpCollection().get();
    List<EduAndExpModel> allList = querySnapshot.docs
        .map((snap) => EduAndExpModel.fromSnapshot(snap))
        .toList();
    List<EduAndExpModel> experienceList = [];
    for (EduAndExpModel model in allList) {
      if (model.type == 'Experience') {
        experienceList.add(model);
      }
    }
    experienceList.sort((a, b) => a.index.compareTo(b.index));
    return experienceList;
  }
}
