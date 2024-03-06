import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_2/data/models/project_model/project_model.dart';
import 'package:portfolio_2/logic/cubit_projects/cubit_projects.dart';
import 'package:portfolio_2/logic/cubit_projects/cubit_projects_state.dart';
import 'package:provider/provider.dart';
import '../../../locator.dart';
import '../../app_colors/app_colors.dart';
import '../../components/hover_animation_icon/hover_animation_icon.dart';
import '../../components/section_title/section_title.dart';
import '../../routing/navigtion_service.dart';
import 'components/arrow_skill.dart';
import 'components/image_details.dart';

class DetailsSection extends StatefulWidget {
  // final String projectName;
  // final String cartImageURL;
  // final String description;
  // final List technology;
  // final List images;
  // final String data;
  // final String gitHupLink;
  final int projectNumber;

  DetailsSection({required this.projectNumber});
  @override
  State<DetailsSection> createState() => _DetailsSectionState();
}

class _DetailsSectionState extends State<DetailsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void initState() {
    locator<NavigationService>().navigatorTo("/DetailsRoute_0");
    streamController.add(3);

    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1, milliseconds: 500),
    );
    animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    Timer(
      Duration(milliseconds: 200),
      () => _animationController.forward(),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  Widget detailsContent(Size size, ProjectModel project) {
    if (size.width >= 1046) {
      return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              width: size.width > 1046 ? 900 : 775,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle('project Informations', 'DETAILS', 60, 30),
                  SizedBox(
                    height: 20,
                  ),
                  ImageDetails(size, 1, project.cartImageURL),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    project.projectName,
                    style: GoogleFonts.montserrat(
                      color:
                          Provider.of<AppColors>(context).backgroundBox2Color,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Details',
                    style: GoogleFonts.mulish(
                        color: Provider.of<AppColors>(context).text1Color,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            project.description,
                            style: GoogleFonts.mulish(
                                // color: rgba(75,85,99,.8),
                                color:
                                    Provider.of<AppColors>(context).text1Color,
                                height: 1.6,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                wordSpacing: 1.8),
                            maxLines: 15,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    // width: 600,
                    child: GridView.count(
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      childAspectRatio: 0.49,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                      padding: EdgeInsets.all(10),

                      // Generate 100 widgets that display their index in the List.
                      children:
                          List.generate(project.imagesURLs.length, (index) {
                        return Container(
                          width: 261,
                          height: 531,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Image.network(
                            project.imagesURLs[index],
                            fit: BoxFit.cover,
                            frameBuilder: (context, child, frame,
                                wasSynchronouslyLoaded) {
                              return child;
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Technology Used',
                    style: GoogleFonts.mulish(
                        color:
                            Provider.of<AppColors>(context).backgroundBox2Color,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: List.generate(
                        project.technology.length,
                        (index) =>
                            ArrowSkill(skill: project.technology[index])),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: size.width / 4.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Data',
                              style: GoogleFonts.mulish(
                                  color: Provider.of<AppColors>(context)
                                      .backgroundBox2Color,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              project.date,
                              style: GoogleFonts.montserrat(
                                color:
                                    Provider.of<AppColors>(context).text1Color,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'More',
                              style: GoogleFonts.mulish(
                                  color: Provider.of<AppColors>(context)
                                      .backgroundBox2Color,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                // HoverAnimationIcon(
                                //     FontAwesomeIcons.externalLink, 18),
                                // SizedBox(
                                //   width: 20,
                                // ),
                                HoverAnimationIcon(FontAwesomeIcons.github, 22,
                                    project.gitHupLink),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else if (size.width < 1046 && size.width >= 650) {
      return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle('project Informations', 'DETAILS', 60, 28),
                  SizedBox(
                    height: 20,
                  ),
                  ImageDetails(size, 2, project.cartImageURL),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    project.projectName,
                    style: GoogleFonts.montserrat(
                      color:
                          Provider.of<AppColors>(context).backgroundBox2Color,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Details',
                    style: GoogleFonts.mulish(
                        color: Provider.of<AppColors>(context).text1Color,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          project.description,
                          style: GoogleFonts.mulish(
                              // color: rgba(75,85,99,.8),
                              color: Provider.of<AppColors>(context).text1Color,
                              height: 1.6,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              wordSpacing: 1.8),
                          maxLines: 15,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 500,
                    child: GridView.count(
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      childAspectRatio: 0.49,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                      padding: EdgeInsets.all(10),

                      // Generate 100 widgets that display their index in the List.
                      children:
                          List.generate(project.imagesURLs.length, (index) {
                        return Container(
                          width: ((261 * 400) / 531),
                          height: 400,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Image.network(
                            project.imagesURLs[index],
                            fit: BoxFit.cover,
                            frameBuilder: (context, child, frame,
                                wasSynchronouslyLoaded) {
                              return child;
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Technology Used',
                    style: GoogleFonts.mulish(
                        color:
                            Provider.of<AppColors>(context).backgroundBox2Color,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: List.generate(
                        project.technology.length,
                        (index) =>
                            ArrowSkill(skill: project.technology[index])),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: size.width / 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Data',
                              style: GoogleFonts.mulish(
                                  color: Provider.of<AppColors>(context)
                                      .backgroundBox2Color,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              project.date,
                              style: GoogleFonts.montserrat(
                                color:
                                    Provider.of<AppColors>(context).text1Color,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'More',
                              style: GoogleFonts.mulish(
                                  color: Provider.of<AppColors>(context)
                                      .backgroundBox2Color,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                // HoverAnimationIcon(
                                //     FontAwesomeIcons.externalLink, 18),
                                // SizedBox(
                                //   width: 20,
                                // ),
                                HoverAnimationIcon(FontAwesomeIcons.github, 22,
                                    project.gitHupLink),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SectionTitle('project Informations', 'DETAILS', 60, 20),
                  SizedBox(
                    height: 20,
                  ),
                  ImageDetails(size, 3, project.cartImageURL),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    project.projectName,
                    style: GoogleFonts.montserrat(
                      color:
                          Provider.of<AppColors>(context).backgroundBox2Color,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Details',
                    style: GoogleFonts.mulish(
                        color: Provider.of<AppColors>(context).text1Color,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          project.description,
                          style: GoogleFonts.mulish(
                              // color: rgba(75,85,99,.8),
                              color: Provider.of<AppColors>(context).text1Color,
                              height: 1.6,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              wordSpacing: 1.8),
                          maxLines: 15,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: GridView.count(
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      childAspectRatio: 0.49,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                      padding: EdgeInsets.all(10),

                      // Generate 100 widgets that display their index in the List.
                      children:
                          List.generate(project.imagesURLs.length, (index) {
                        return Container(
                          width: ((261 * 400) / 531),
                          height: 400,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Image.network(
                            project.imagesURLs[index],
                            fit: BoxFit.cover,
                            frameBuilder: (context, child, frame,
                                wasSynchronouslyLoaded) {
                              return child;
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Technology Used',
                    style: GoogleFonts.mulish(
                        color:
                            Provider.of<AppColors>(context).backgroundBox2Color,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: List.generate(
                        project.technology.length,
                        (index) =>
                            ArrowSkill(skill: project.technology[index])),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: size.width / 1.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Data',
                              style: GoogleFonts.mulish(
                                  color: Provider.of<AppColors>(context)
                                      .backgroundBox2Color,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              project.date,
                              style: GoogleFonts.montserrat(
                                color:
                                    Provider.of<AppColors>(context).text1Color,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'More',
                              style: GoogleFonts.mulish(
                                  color: Provider.of<AppColors>(context)
                                      .backgroundBox2Color,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                // HoverAnimationIcon(
                                //     FontAwesomeIcons.externalLink, 18),
                                // SizedBox(
                                //   width: 20,
                                // ),
                                HoverAnimationIcon(FontAwesomeIcons.github, 22,
                                    project.gitHupLink),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      primary: true,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-0.1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: FadeTransition(
          opacity: animation,
          child: Container(
            color: Provider.of<AppColors>(context).backgroundColor,
            alignment: size.width < 1046 && size.width >= 650
                ? Alignment.center
                : Alignment.topLeft,
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: AnimatedContainer(
                duration: Duration(seconds: 1, milliseconds: 500),
                alignment: Alignment.center,
                width:
                    size.width < 1046 && size.width >= 650 ? 650 : size.width,
                child: BlocBuilder<CubitProjects, CubitProjectsState>(
                  bloc: BlocProvider.of<CubitProjects>(context),
                  builder: (context, state) {
                    if (state is LoadedData) {
                      return detailsContent(
                          size, state.projects[widget.projectNumber]);
                    } else {
                      return Container(
                        width: size.width,
                        alignment: Alignment.center,
                        height: size.height / 1.3,
                        child: Center(
                          child: Image.asset('assets/images/loading2.gif',
                              width: 100),
                        ),
                      );
                    }
                  },
                )),
          ),
        ),
      ),
    );
  }
}
