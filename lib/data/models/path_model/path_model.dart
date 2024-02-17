import 'package:cloud_firestore/cloud_firestore.dart';

class PathModel {
  final String pathName;
  final String pathRoute;

  PathModel({required this.pathName, required this.pathRoute});

  factory PathModel.fromSnapshot(DocumentSnapshot snap) {
    return PathModel(
      pathName: snap.id,
      pathRoute: snap['route'],
    );
  }
}
