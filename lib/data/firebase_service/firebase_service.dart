import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final _firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference getProjectsCollection() {
    return _firebaseFirestore.collection('projects');
  }
}
