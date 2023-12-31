class Project {
  final String projectName;
  final String cartImageURL;
  final String description;
  final List<String> technology;
  final List<String> imagesURLs;
  final String data;
  final String gitHupLink;
  Project({
    required this.projectName,
    required this.cartImageURL,
    required this.description,
    required this.technology,
    required this.data,
    required this.gitHupLink,
    required this.imagesURLs,
  });
}

List<Project> projects = [
  Project(
      projectName: 'Flash Chat ⚡️',
      cartImageURL: 'assets/images/Chat/cart.png',
      description:
          'A modern messaging app where users can sign up and log in to chat.',
      technology: ['Firebase', 'Clean Code', 'GitHub'],
      data: 'Dec 22, 2023',
      gitHupLink: 'https://github.com/MahmoudAboHebil/flash_app_flutter.git',
      imagesURLs: [
        'assets/images/Chat/v.gif',
        'assets/images/Chat/1.png',
        'assets/images/Chat/2.png',
        'assets/images/Chat/3.png',
        // 'assets/images/Clima/Group 11.png',
      ]),
  Project(
      projectName: 'Todoey App',
      cartImageURL: 'assets/images/Todoey/cart.png',
      description: 'A todolist app to keep track of all your tasks.',
      technology: ['Provider', 'Clean Code', 'GitHub'],
      data: 'Dec 22, 2023',
      gitHupLink: 'https://github.com/MahmoudAboHebil/todoey_app_flutter.git',
      imagesURLs: [
        'assets/images/Todoey/3.gif',
        'assets/images/Todoey/1.png',
        'assets/images/Todoey/2.png',
        // 'assets/images/Clima/Group 11.png',
      ]),
  Project(
      projectName: 'Clima App',
      cartImageURL: 'assets/images/Clima/cover.png',
      description:
          'Find out the live weather data in the current location of the device as well as the weather for any city you can think of!',
      technology: ['API', 'Clean Code', 'GitHub'],
      data: 'Aug 9, 2023',
      gitHupLink: 'https://github.com/MahmoudAboHebil/weather_app_flutter.git',
      imagesURLs: [
        'assets/images/Clima/Climaf.gif',
        'assets/images/Clima/Group 8.png',
        'assets/images/Clima/Group 9.png',
        'assets/images/Clima/Group 10.png',
        'assets/images/Clima/Group 11.png',
      ]),
  Project(
      projectName: 'BMI Calculator',
      cartImageURL: 'assets/images/BMI/cart.png',
      description:
          'Calculate your body mass index (BMI) ,Check your BMI to find out if you\'re a healthy weight for your height. It is a multi screen app with simple functionality but full-on custom styling.',
      technology: ['Flutter', 'Clean Code', 'GitHub'],
      data: 'Jul 25, 2023',
      gitHupLink:
          'https://github.com/MahmoudAboHebil/bmi_calculator_app_flutter.git',
      imagesURLs: [
        'assets/images/BMI/Group 1.png',
        'assets/images/BMI/Group 3.png',
      ]),
  Project(
      projectName: 'Bitcoin App',
      cartImageURL: 'assets/images/Bitcoin/Group 132.png',
      description:
          'A crypto currency price checking app,using API ,Cupertino and Material Widgets in parallel and providing a different user interface depending on the platform.',
      technology: ['API', 'JSON', 'http', 'Clean Code', 'GitHub'],
      data: 'Dec 18, 2023',
      gitHupLink: 'https://github.com/MahmoudAboHebil/bitcoin_app_flutter.git',
      imagesURLs: [
        'assets/images/Bitcoin/cart.gif',
        // 'assets/images/Clima/Group 9.png',
        // 'assets/images/Clima/Group 10.png',
        // 'assets/images/Clima/Group 11.png',
      ]),
];
