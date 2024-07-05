import 'package:cloud_firestore/cloud_firestore.dart';

class EduAndExpModel {
  final int index;
  final String type;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String? certifUrl;
  final String? linkedUrl;
  final String? url;

  EduAndExpModel({
    required this.index,
    required this.type,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.certifUrl,
    required this.linkedUrl,
    required this.url,
  });

  factory EduAndExpModel.fromSnapshot(DocumentSnapshot snap) {
    Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
    return EduAndExpModel(
      index: snap['index'],
      type: snap['type'],
      title: snap['title'],
      description: snap['description'],
      startDate: snap['startDate'],
      endDate: snap['endDate'],
      certifUrl: data.containsKey('certifUrl') ? data['certifUrl'] : null,
      linkedUrl: data.containsKey('linkedUrl') ? data['linkedUrl'] : null,
      url: data.containsKey('url') ? data['url'] : null,
    );
  }
}
