import 'package:portfolio_2/data/firebase_service/firebase_service.dart';
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
}
