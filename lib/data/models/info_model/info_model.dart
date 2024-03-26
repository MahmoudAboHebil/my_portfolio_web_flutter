import 'package:cloud_firestore/cloud_firestore.dart';

class InfoModel {
  final String homeImageURL;
  final String aboutImageURL;
  final String cvURL;
  final String facebookURL;
  final String gitHupURL;
  final String watSapURL;
  final String linkedInURL;
  final String completedProject;
  final String linesOfCode;

  InfoModel({
    required this.homeImageURL,
    required this.aboutImageURL,
    required this.cvURL,
    required this.facebookURL,
    required this.watSapURL,
    required this.linkedInURL,
    required this.gitHupURL,
    required this.completedProject,
    required this.linesOfCode,
  });

  factory InfoModel.fromSnapshot(DocumentSnapshot snap) {
    return InfoModel(
        homeImageURL: snap['homeImageURL'],
        aboutImageURL: snap['aboutImageURL'],
        cvURL: snap['cvURL'],
        facebookURL: snap['facebookURL'],
        watSapURL: snap['watSapURL'],
        linkedInURL: snap['linkedInURL'],
        gitHupURL: snap['gitHupURL'],
        completedProject: snap['completedProject'],
        linesOfCode: snap['linesOfCode']);
  }
}
