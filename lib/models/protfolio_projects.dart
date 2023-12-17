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
      projectName: 'Clima App',
      cartImageURL: 'assets/images/Clima/cover.png',
      description:
          'Find out the live weather data in the current location of the device as well as the weather for any city you can think of!',
      technology: ['API', 'Clean Code', 'GitHub'],
      data: 'Aug 9, 2023',
      gitHupLink: 'https://github.com/MahmoudAboHebil/weather_app_flutter.git',
      imagesURLs: [
        'assets/images/Clima/Climaf.gif',
        // 'assets/images/Clima/Group 9.png',
        // 'assets/images/Clima/Group 10.png',
        // 'assets/images/Clima/Group 11.png',
      ]),
];
