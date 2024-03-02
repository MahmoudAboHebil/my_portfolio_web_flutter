import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
              width: 650,
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
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: contactContent(size),
          ),
        ),
      ),
    );
  }
}

class ArrowSkill extends StatelessWidget {
  final String skill;
  const ArrowSkill({
    required this.skill,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.arrow_right,
          size: 24,
        ),
        SizedBox(
          width: 1,
        ),
        Text(
          skill,
          style: GoogleFonts.montserrat(
            color: Color.fromRGBO(75, 85, 99, .9),
            fontSize: 16,
          ),
        )
      ],
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

class ContactForm extends StatefulWidget {
  ContactForm({super.key, required this.size});
  final Size size;

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  bool isPressed = false;
  TextEditingController _firstName_controller = TextEditingController();
  TextEditingController _lasttName_controller = TextEditingController();
  TextEditingController _description_controller = TextEditingController();
  TextEditingController _email_controller = TextEditingController();
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

  @override
  void dispose() {
    _firstName_controller.dispose();
    _lasttName_controller.dispose();
    _description_controller.dispose();
    _email_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Size : ${widget.size.width}');
    isVaildEmail(_email_controller);
    Widget cardResp(Size size) {
      if (size.width < 1046 && size.width >= 650) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  child: DefaultButton(
                    imageSrc: "assets/images/contact_icon.png",
                    text: "Send Message",
                    backgroundColor: Color(0xFFE8F0F9),
                    press: () {
                      setState(() {
                        isPressed = true;
                        isVaildEmail(_email_controller);
                      });
                    },
                  ),
                ),
                FittedBox(
                  child: DefaultButton(
                    imageSrc: "assets/images/whatsapp.png",
                    text: "Phone!",
                    backgroundColor: Color(0xFFE4FFC7),
                    press: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            FittedBox(
              child: DefaultButton(
                imageSrc: "assets/images/messanger.png",
                text: "Messenger",
                backgroundColor: Color(0xFFE4FFC7),
                press: () {},
              ),
            )
          ],
        );
      } else if (size.width >= 1046) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  child: DefaultButton(
                    imageSrc: "assets/images/contact_icon.png",
                    text: "Send Message",
                    backgroundColor: Color(0xFFE8F0F9),
                    press: () {
                      setState(() {
                        isPressed = true;
                        isVaildEmail(_email_controller);
                      });
                    },
                  ),
                ),
                FittedBox(
                  child: DefaultButton(
                    imageSrc: "assets/images/whatsapp.png",
                    text: "Phone!",
                    backgroundColor: Color(0xFFE4FFC7),
                    press: () {},
                  ),
                ),
                FittedBox(
                  child: DefaultButton(
                    imageSrc: "assets/images/messanger.png",
                    text: "Messenger",
                    backgroundColor: Color(0xFFE4FFC7),
                    press: () {
                      setState(() {
                        isPressed = true;
                        isVaildEmail(_email_controller);
                      });
                    },
                  ),
                )
              ],
            ),
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: DefaultButton(
                imageSrc: "assets/images/contact_icon.png",
                text: "Send Message",
                backgroundColor: Color(0xFFE8F0F9),
                press: () {
                  setState(() {
                    isPressed = true;
                    isVaildEmail(_email_controller);
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FittedBox(
              child: DefaultButton(
                imageSrc: "assets/images/messanger.png",
                text: "Messenger",
                backgroundColor: Color(0xFFE4FFC7),
                press: () {},
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FittedBox(
              child: DefaultButton(
                imageSrc: "assets/images/whatsapp.png",
                text: "Phone!",
                backgroundColor: Color(0xFFE4FFC7),
                press: () {},
              ),
            ),
          ],
        );
      }
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
                  child: TextFormField(
                    controller: _firstName_controller,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    onChanged: (value) {
                      setState(() {
                        isEmpty(_firstName_controller);
                      });
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: isEmpty(_firstName_controller) == null
                              ? Colors.grey.shade500
                              : Colors.redAccent,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: isEmpty(_firstName_controller) == null
                              ? Colors.grey.shade500
                              : Colors.redAccent,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: isEmpty(_firstName_controller) == null
                              ? Colors.grey.shade500
                              : Colors.redAccent,
                        ),
                      ),
                      labelText: "First Name",
                      hintText: "First Name",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: TextFormField(
                    controller: _lasttName_controller,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    onChanged: (value) {
                      setState(() {
                        isEmpty(_lasttName_controller);
                      });
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: isEmpty(_lasttName_controller) == null
                              ? Colors.grey.shade500
                              : Colors.redAccent,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: isEmpty(_lasttName_controller) == null
                              ? Colors.grey.shade500
                              : Colors.redAccent,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: isEmpty(_lasttName_controller) == null
                              ? Colors.grey.shade500
                              : Colors.redAccent,
                        ),
                      ),
                      labelText: "Last Name",
                      hintText: "Last Name",
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
                child: TextFormField(
                  controller: _email_controller,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  onChanged: (value) {
                    setState(() {
                      isEmpty(_email_controller);
                      isVaildEmail(_email_controller);
                    });
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: isEmpty(_email_controller) == null &&
                                isVaildEmail(_email_controller) == null
                            ? Colors.grey.shade500
                            : Colors.redAccent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: isEmpty(_email_controller) == null &&
                                isVaildEmail(_email_controller) == null
                            ? Colors.grey.shade500
                            : Colors.redAccent,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: isEmpty(_email_controller) == null &&
                                isVaildEmail(_email_controller) == null
                            ? Colors.grey.shade500
                            : Colors.redAccent,
                      ),
                    ),
                    labelText: "Email Address",
                    hintText: "Enter your email address",
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
            child: TextFormField(
              controller: _description_controller,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (value) {
                setState(() {
                  isEmpty(_description_controller);
                });
              },
              maxLines: 10,
              minLines: 10,
              decoration: InputDecoration(
                // errorBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(20),
                //   borderSide: BorderSide(),
                // ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: isEmpty(_description_controller) == null
                        ? Colors.grey.shade500
                        : Colors.redAccent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: isEmpty(_description_controller) == null
                        ? Colors.grey.shade500
                        : Colors.redAccent,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: isEmpty(_description_controller) == null
                        ? Colors.grey.shade500
                        : Colors.redAccent,
                  ),
                ),
                labelText: "Description",
                alignLabelWithHint: true,
                hintText: "Write some description",
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

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {required this.imageSrc,
      required this.text,
      required this.press,
      required this.backgroundColor});

  final String imageSrc, text;
  final Function press;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
          vertical: kDefaultPadding,
          horizontal: kDefaultPadding * 2.5,
        )),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        )),
      ),
      onPressed: () {
        press();
      },
      child: Row(
        children: [
          Image.asset(imageSrc, height: 40),
          SizedBox(width: kDefaultPadding),
          Text(text),
        ],
      ),
    );
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
