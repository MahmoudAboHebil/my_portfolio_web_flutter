import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_2/logic/cubit_projects/cubit_projects.dart';
import 'package:portfolio_2/logic/cubit_projects/cubit_projects_state.dart';
import 'package:provider/provider.dart';
import '../../../locator.dart';
import '../../app_colors/app_colors.dart';
import '../../components/section_title/section_title.dart';
import '../../routing/navigtion_service.dart';
import '../../routing/route_names.dart';
import 'components/card_portfolio.dart';

class PortfolioSection extends StatefulWidget {
  @override
  State<PortfolioSection> createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void initState() {
    locator<NavigationService>().navigatorTo(PortfolioRoute);
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

  Widget portfolioContent(Size size, CubitProjectsState state) {
    if (state is LoadedData) {
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
                    SectionTitle('Creative Portfolio', 'PORTFOLIO', 60, 20),
                    SizedBox(
                      height: 30,
                    ),
                    GridView.count(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0),
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      children: List.generate(state.projects.length, (index) {
                        return CardPortfolio(
                            size, 1, index, state.projects[index].cartImageURL);
                      }),
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
                    SectionTitle(
                      'Creative Portfolio',
                      'PORTFOLIO',
                      60,
                      20,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    size.width >= 800
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GridView.count(
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                shrinkWrap: true,
                                padding: EdgeInsets.all(0),
                                crossAxisCount: 2,
                                childAspectRatio: 1.5,
                                children: List.generate(state.projects.length,
                                    (index) {
                                  return CardPortfolio(size, 1, index,
                                      state.projects[index].cartImageURL);
                                }),
                              ),
                            ],
                          )
                        : Container(
                            width: 600,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GridView.count(
                                  scrollDirection: Axis.vertical,
                                  physics: NeverScrollableScrollPhysics(),
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.all(0),
                                  crossAxisCount: 1,
                                  childAspectRatio: 1.75,
                                  children: List.generate(state.projects.length,
                                      (index) {
                                    return CardPortfolio(
                                      size,
                                      1,
                                      index,
                                      state.projects[index].cartImageURL,
                                    );
                                  }),
                                ),
                              ],
                            ),
                          )
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
                    SectionTitle('Creative Portfolio', 'PORTFOLIO', 60, 20),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GridView.count(
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(0),
                          crossAxisCount: 1,
                          childAspectRatio: 1.8,
                          children:
                              List.generate(state.projects.length, (index) {
                            return CardPortfolio(size, 1, index,
                                state.projects[index].cartImageURL);
                          }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        );
      }
    } else {
      return Container(
        width: size.width,
        alignment: Alignment.center,
        height: size.height / 1.3,
        child: Center(
          child: Image.asset('assets/images/loading2.gif', width: 100),
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
              width: size.width < 1046 && size.width >= 650 ? 700 : size.width,
              child: Column(
                children: [
                  BlocBuilder<CubitProjects, CubitProjectsState>(
                    bloc: BlocProvider.of<CubitProjects>(context),
                    builder: (context, state) {
                      return portfolioContent(size, state);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// state.projects[widget.projectNumber].cartImageURL
