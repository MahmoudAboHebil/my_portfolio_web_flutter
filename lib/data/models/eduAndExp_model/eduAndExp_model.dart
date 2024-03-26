import 'package:cloud_firestore/cloud_firestore.dart';

class EduAndExpModel {
  final int index;
  final String type;
  final String title;
  final String description;
  final String startDate;
  final String endDate;

  EduAndExpModel({
    required this.index,
    required this.type,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
  });

  factory EduAndExpModel.fromSnapshot(DocumentSnapshot snap) {
    return EduAndExpModel(
      index: snap['index'],
      type: snap['type'],
      title: snap['title'],
      description: snap['description'],
      startDate: snap['startDate'],
      endDate: snap['endDate'],
    );
  }
}
