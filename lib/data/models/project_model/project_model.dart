import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectModel {
  final String projectName;
  final String cartImageURL;
  final String description;
  final List technology;
  final List imagesURLs;
  final String date;
  final String gitHupLink;
  final int index;
  ProjectModel({
    required this.index,
    required this.projectName,
    required this.cartImageURL,
    required this.description,
    required this.technology,
    required this.date,
    required this.gitHupLink,
    required this.imagesURLs,
  });
  factory ProjectModel.fromSnapshot(DocumentSnapshot snap) {
    return ProjectModel(
      projectName: snap['projectName'],
      cartImageURL: snap['cartImageURL'],
      description: snap['description'],
      technology: snap['technology'],
      date: snap['date'],
      gitHupLink: snap['gitHupLink'],
      imagesURLs: snap['imagesURLs'],
      index: snap['index'],
    );
  }
}

// List<ProjectModel> projects = [
//   ProjectModel(
//       index: 1,
//       projectName: 'Flash Chat ⚡️',
//       cartImageURL: 'assets/images/Chat/cart.png',
//       description:
//           'A modern messaging app where users can sign up and log in to chat.',
//       technology: ['Firebase', 'Clean Code', 'GitHub'],
//       date: 'Dec 22, 2023',
//       gitHupLink: 'https://github.com/MahmoudAboHebil/flash_app_flutter.git',
//       imagesURLs: [
//         'assets/images/Chat/v.gif',
//         'assets/images/Chat/1.png',
//         'assets/images/Chat/2.png',
//         'assets/images/Chat/3.png',
//         // 'assets/images/Clima/Group 11.png',
//       ]),
//   ProjectModel(
//       index: 2,
//       projectName: 'Todoey App',
//       cartImageURL: 'assets/images/Todoey/cart.png',
//       description: 'A todolist app to keep track of all your tasks.',
//       technology: ['Provider', 'Clean Code', 'GitHub'],
//       date: 'Dec 22, 2023',
//       gitHupLink: 'https://github.com/MahmoudAboHebil/todoey_app_flutter.git',
//       imagesURLs: [
//         'assets/images/Todoey/v.gif',
//         'assets/images/Todoey/1.png',
//         'assets/images/Todoey/2.png',
//         // 'assets/images/Clima/Group 11.png',
//       ]),
//   ProjectModel(
//       index: 3,
//       projectName: 'Clima App',
//       cartImageURL: 'assets/images/Clima/cover.png',
//       description:
//           'Find out the live weather data in the current location of the device as well as the weather for any city you can think of!',
//       technology: ['API', 'Clean Code', 'GitHub'],
//       date: 'Aug 9, 2023',
//       gitHupLink: 'https://github.com/MahmoudAboHebil/weather_app_flutter.git',
//       imagesURLs: [
//         'assets/images/Clima/v.gif',
//         'assets/images/Clima/1.png',
//         'assets/images/Clima/2.png',
//         'assets/images/Clima/3.png',
//         'assets/images/Clima/4.png',
//       ]),
//   ProjectModel(
//       index: 4,
//       projectName: 'BMI Calculator',
//       cartImageURL: 'assets/images/BMI/cart.png',
//       description:
//           'Calculate your body mass index (BMI) ,Check your BMI to find out if you\'re a healthy weight for your height. It is a multi screen app with simple functionality but full-on custom styling.',
//       technology: ['Flutter', 'Clean Code', 'GitHub'],
//       date: 'Jul 25, 2023',
//       gitHupLink:
//           'https://github.com/MahmoudAboHebil/bmi_calculator_app_flutter.git',
//       imagesURLs: [
//         'assets/images/BMI/1.png',
//         'assets/images/BMI/2.png',
//       ]),
//   ProjectModel(
//       index: 5,
//       projectName: 'Bitcoin App',
//       cartImageURL: 'assets/images/Bitcoin/cart.png',
//       description:
//           'A crypto currency price checking app,using API ,Cupertino and Material Widgets in parallel and providing a different user interface depending on the platform.',
//       technology: ['API', 'JSON', 'http', 'Clean Code', 'GitHub'],
//       date: 'Dec 18, 2023',
//       gitHupLink: 'https://github.com/MahmoudAboHebil/bitcoin_app_flutter.git',
//       imagesURLs: [
//         'assets/images/Bitcoin/v.gif',
//         // 'assets/images/Clima/Group 9.png',
//         // 'assets/images/Clima/Group 10.png',
//         // 'assets/images/Clima/Group 11.png',
//       ]),
// ];
