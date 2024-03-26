import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final _firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference getProjectsCollection() {
    return _firebaseFirestore.collection('projects');
  }

  CollectionReference getPathsCollection() {
    return _firebaseFirestore.collection('paths');
  }

  CollectionReference getInfoCollection() {
    return _firebaseFirestore.collection('info');
  }
}
