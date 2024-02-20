import 'package:cloud_firestore/cloud_firestore.dart';

class PathModel {
  final String pathName;
  final String pathRoute;
  final int index;

  PathModel(
      {required this.pathName, required this.pathRoute, required this.index});

  factory PathModel.fromSnapshot(DocumentSnapshot snap) {
    return PathModel(
      pathName: snap.id,
      pathRoute: snap['route'],
      index: snap['index'],
    );
  }
}
