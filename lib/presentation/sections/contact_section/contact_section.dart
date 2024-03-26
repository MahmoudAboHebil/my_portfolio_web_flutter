import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_2/logic/cubit_info/cubit_info.dart';
import 'package:portfolio_2/logic/cubit_info/cubit_info_state.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../locator.dart';
import '../../app_colors/app_colors.dart';
import '../../components/section_title/section_title.dart';
import '../../constants/constants.dart';
import '../../routing/navigtion_service.dart';
import '../../routing/route_names.dart';

class ContactSection extends StatefulWidget {
  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void initState() {
    locator<NavigationService>().navigatorTo(ContactRoute);
    streamController.add(4);
    setState(() {
      isPressed = false;
    });
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

    _firstName_controller.clear();
    _lasttName_controller.clear();
    _description_controller.clear();
    _email_controller.clear();
    super.dispose();
  }

  Widget contactContent(Size size) {
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
                  SectionTitle('Get in Touch', 'CONTACT', 60, 30),
                  SizedBox(
                    height: 30,
                  ),
                  ContactForm(
                    size: size,
                  )
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
                  SectionTitle('Get in Touch', 'CONTACT', 60, 28),
                  SizedBox(
                    height: 30,
                  ),
                  ContactForm(
                    size: size,
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
                  SectionTitle('Get in Touch', 'CONTACT', 60, 20),
                  SizedBox(
                    height: 30,
                  ),
                  ContactForm(
                    size: size,
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
              color: Colors.transparent,
              width: size.width < 1046 && size.width >= 650 ? 650 : size.width,
              child: contactContent(size),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageDetailsContact extends StatefulWidget {
  final Size size;
  final int layout;

  ImageDetailsContact(this.size, this.layout);

  @override
  State<ImageDetailsContact> createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetailsContact> {
  bool isHover = false;
  double getHight(int layout) {
    if (layout == 1) {
      return widget.size.width / 3.3;
    } else if (layout == 2) {
      return 280;
    } else {
      return widget.size.width / 2.5;
    }
  }

  double getWidth(int layout) {
    if (layout == 1) {
      return widget.size.width / 1.5;
    } else if (layout == 2) {
      return 650;
    } else {
      return widget.size.width;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(widget.layout),
      height: getHight(widget.layout),
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/port.png',
          ),
        ),
      ),
    );
  }
}

final TextEditingController _firstName_controller = TextEditingController();
final TextEditingController _lasttName_controller = TextEditingController();
final TextEditingController _description_controller = TextEditingController();
final TextEditingController _email_controller = TextEditingController();
bool isPressed = false;

class ContactForm extends StatefulWidget {
  ContactForm({super.key, required this.size});
  final Size size;

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }

  String? isEmpty(TextEditingController controller) {
    var text = controller.text;
    if ((text.isEmpty || text.trim().isEmpty) && isPressed) {
      return '';
    }

    return null;
  }

  String? isVaildEmail(TextEditingController controller) {
    var text = controller.text;
    if (text.isNotEmpty && isPressed) {
      return EmailValidator.validate(text)
          ? null
          : "Please enter a valid email";
    }

    return null;
  }

  Future sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    String serviceId = 'service_030rmj2';
    String templateId = 'template_s4t3w2a';
    String userId = '8hp_Mrh8pXhclrhs8';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_message': message
        }
      }),
    );
    print(response.body);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Size : ${widget.size.width}');
    isVaildEmail(_email_controller);
    Widget cardResp(Size size) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultButton(
            icon: Icons.send,
            iconSize: 16,
            text: "Send Message",
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 36),
            isHover: true,
            press: () {
              setState(() {
                isPressed = true;
                isVaildEmail(_email_controller);
              });
              if (isEmpty(_firstName_controller) == null &&
                  isEmpty(_lasttName_controller) == null &&
                  isEmpty(_email_controller) == null &&
                  isVaildEmail(_email_controller) == null &&
                  isEmpty(_description_controller) == null) {
                sendEmail(
                  name:
                      '${_firstName_controller.text}${_lasttName_controller.text}',
                  email: _email_controller.text,
                  subject: 'portfolio Message',
                  message: _description_controller.text,
                );
                setState(() {
                  isPressed = false;

                  _firstName_controller.clear();
                  _lasttName_controller.clear();
                  _email_controller.clear();
                  _description_controller.clear();
                });
              }
            },
          ),
          SizedBox(
            height: 8,
          ),
          BlocBuilder<CubitInfo, CubitInfoState>(
            bloc: BlocProvider.of<CubitInfo>(context),
            builder: (context, state) {
              if (state is LoadedData) {
                return DefaultButton(
                  icon: FontAwesomeIcons.whatsapp,
                  iconSize: 22,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  isHover: false,
                  text: "Phone!",
                  press: () {
                    _launchUrl(state.info.watSapURL);
                  },
                );
              } else {
                return DefaultButton(
                  icon: FontAwesomeIcons.whatsapp,
                  iconSize: 22,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  isHover: false,
                  text: "Phone!",
                  press: () {},
                );
              }
            },
          ),
        ],
      );
    }

    return Form(
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  // decoration: BoxDecoration(boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.white30,
                  //       blurRadius: 2,
                  //       spreadRadius: 0.1,
                  //       offset: Offset(1, 1)),
                  // ]),
                  child: Material(
                    color: Provider.of<AppColors>(context).backgroundColor,
                    elevation: 3,
                    shadowColor: Provider.of<AppColors>(context).isDarkState
                        ? Colors.transparent
                        : Color.fromRGBO(156, 163, 175, .5),

                    //
                    child: TextFormField(
                      controller: _firstName_controller,
                      style: GoogleFonts.mulish(
                          color: Provider.of<AppColors>(context)
                              .backgroundBox2Color,
                          fontSize: 16),
                      onChanged: (value) {
                        setState(() {
                          isEmpty(_firstName_controller);
                        });
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isEmpty(_firstName_controller) == null
                                ? Color.fromRGBO(156, 163, 175, .5)
                                : Colors.redAccent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isEmpty(_firstName_controller) == null
                                ? Color.fromRGBO(156, 163, 175, .5)
                                : Colors.redAccent,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isEmpty(_firstName_controller) == null
                                ? Color.fromRGBO(156, 163, 175, .5)
                                : Colors.redAccent,
                          ),
                        ),
                        labelText: "First Name",
                        hintText: "First Name",
                        labelStyle: GoogleFonts.mulish(
                            color: Provider.of<AppColors>(context).text1Color,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                        hintStyle: GoogleFonts.mulish(
                            fontSize: 16,
                            color: Provider.of<AppColors>(context).text1Color,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Material(
                    color: Provider.of<AppColors>(context).backgroundColor,
                    elevation: 3,
                    shadowColor: Provider.of<AppColors>(context).isDarkState
                        ? Colors.transparent
                        : Color.fromRGBO(156, 163, 175, .5),
                    child: TextFormField(
                      controller: _lasttName_controller,
                      style: GoogleFonts.mulish(
                          color: Provider.of<AppColors>(context)
                              .backgroundBox2Color,
                          fontSize: 16),
                      onChanged: (value) {
                        setState(() {
                          isEmpty(_lasttName_controller);
                        });
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isEmpty(_lasttName_controller) == null
                                ? Color.fromRGBO(156, 163, 175, .5)
                                : Colors.redAccent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isEmpty(_lasttName_controller) == null
                                ? Color.fromRGBO(156, 163, 175, .5)
                                : Colors.redAccent,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isEmpty(_lasttName_controller) == null
                                ? Color.fromRGBO(156, 163, 175, .5)
                                : Colors.redAccent,
                          ),
                        ),
                        labelText: "Last Name",
                        hintText: "Last Name",
                        labelStyle: GoogleFonts.mulish(
                            color: Provider.of<AppColors>(context).text1Color,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                        hintStyle: GoogleFonts.mulish(
                            fontSize: 16,
                            color: Provider.of<AppColors>(context).text1Color,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Material(
                  color: Provider.of<AppColors>(context).backgroundColor,
                  elevation: 3,
                  shadowColor: Provider.of<AppColors>(context).isDarkState
                      ? Colors.transparent
                      : Color.fromRGBO(156, 163, 175, .5),
                  child: TextFormField(
                    controller: _email_controller,
                    style: GoogleFonts.mulish(
                        color:
                            Provider.of<AppColors>(context).backgroundBox2Color,
                        fontSize: 16),
                    onChanged: (value) {
                      setState(() {
                        isEmpty(_email_controller);
                        isVaildEmail(_email_controller);
                      });
                    },
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.mulish(
                          color: Provider.of<AppColors>(context).text1Color,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                      hintStyle: GoogleFonts.mulish(
                          fontSize: 16,
                          color: Provider.of<AppColors>(context).text1Color,
                          fontWeight: FontWeight.w400),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: isEmpty(_email_controller) == null &&
                                  isVaildEmail(_email_controller) == null
                              ? Color.fromRGBO(156, 163, 175, .5)
                              : Colors.redAccent,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: isEmpty(_email_controller) == null &&
                                  isVaildEmail(_email_controller) == null
                              ? Color.fromRGBO(156, 163, 175, .5)
                              : Colors.redAccent,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: isEmpty(_email_controller) == null &&
                                  isVaildEmail(_email_controller) == null
                              ? Color.fromRGBO(156, 163, 175, .5)
                              : Colors.redAccent,
                        ),
                      ),
                      labelText: "Email Address",
                      hintText: "Enter your email address",
                    ),
                  ),
                ),
              ),
              isVaildEmail(_email_controller) == null
                  ? Container()
                  : Text(
                      "Please enter a valid email",
                      style: TextStyle(color: Colors.redAccent, fontSize: 12),
                    )
            ],
          ),
          SizedBox(
            child: Material(
              color: Provider.of<AppColors>(context).backgroundColor,
              elevation: 3,
              shadowColor: Provider.of<AppColors>(context).isDarkState
                  ? Colors.transparent
                  : Color.fromRGBO(156, 163, 175, .5),
              child: TextFormField(
                controller: _description_controller,
                style: GoogleFonts.mulish(
                    color: Provider.of<AppColors>(context).backgroundBox2Color,
                    fontSize: 16),
                onChanged: (value) {
                  setState(() {
                    isEmpty(_description_controller);
                  });
                },
                maxLines: 10,
                minLines: 10,
                decoration: InputDecoration(
                  // errorBorder: OutlineInputBorder(
                  //
                  //   borderSide: BorderSide(),
                  // ),
                  labelStyle: GoogleFonts.mulish(
                      color: Provider.of<AppColors>(context).text1Color,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  hintStyle: GoogleFonts.mulish(
                      fontSize: 16,
                      color: Provider.of<AppColors>(context).text1Color,
                      fontWeight: FontWeight.w400),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isEmpty(_description_controller) == null
                          ? Color.fromRGBO(156, 163, 175, .5)
                          : Colors.redAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isEmpty(_description_controller) == null
                          ? Color.fromRGBO(156, 163, 175, .5)
                          : Colors.redAccent,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isEmpty(_description_controller) == null
                          ? Color.fromRGBO(156, 163, 175, .5)
                          : Colors.redAccent,
                    ),
                  ),
                  labelText: "Description",
                  alignLabelWithHint: true,
                  hintText: "Write some description",
                ),
              ),
            ),
          ),
          // SizedBox(height: 0),
          cardResp(widget.size)
        ],
      ),
    );
  }
}

class DefaultButton extends StatefulWidget {
  const DefaultButton({
    required this.icon,
    required this.text,
    required this.iconSize,
    required this.padding,
    required this.isHover,
    required this.press,
  });

  final IconData icon;
  final double iconSize;
  final String text;
  final EdgeInsetsGeometry padding;
  final Function press;
  final bool isHover;

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: TextButton(
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        onPressed: () {
          widget.press();
        },
        style: ButtonStyle(
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
          padding: MaterialStatePropertyAll(EdgeInsets.symmetric()),
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          padding: widget.padding,
          alignment: Alignment.center,
          color: Provider.of<AppColors>(context).backgroundBox2Color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 350),
                curve: Curves.linear,
                style: isHover && widget.isHover
                    ? GoogleFonts.mulish(
                        color: Provider.of<AppColors>(context).text3Color,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: 3,
                      )
                    : GoogleFonts.mulish(
                        color: Provider.of<AppColors>(context).text3Color,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                child: Text(
                  widget.text,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                widget.icon,
                color: Provider.of<AppColors>(context).text3Color,
                size: widget.iconSize,
              )
            ],
          ),
        ),
      ),
    );
    // return TextButton(
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStatePropertyAll(backgroundColor),
    //     padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
    //       vertical: kDefaultPadding,
    //       horizontal: kDefaultPadding * 2.5,
    //     )),
    //     shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(50),
    //     )),
    //   ),
    //   onPressed: () {
    //     press();
    //   },
    //   child: Row(
    //     children: [
    //       Image.asset(imageSrc, height: 40),
    //       SizedBox(width: kDefaultPadding),
    //       Text(text),
    //     ],
    //   ),
    // );
  }
}
// SizedBox(
//   width: 470,
//   child: TextFormField(
//     onChanged: (value) {},
//     decoration: InputDecoration(
//       labelText: "Project Type",
//       hintText: "Select Project Type",
//     ),
//   ),
// ),
// SizedBox(
//   width: 470,
//   child: TextFormField(
//     onChanged: (value) {},
//     decoration: InputDecoration(
//       labelText: "Project Budget",
//       hintText: "Select Project Budget",
//     ),
//   ),
// ),
