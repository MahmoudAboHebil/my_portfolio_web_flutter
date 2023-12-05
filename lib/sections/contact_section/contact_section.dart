import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/section_title/section_title.dart';
import '../../constants.dart';

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
                  ContactForm()
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
            color: Color(0xfff5f5f4),
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
  String skill;
  ArrowSkill({
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

class ImageDetails extends StatefulWidget {
  Size size;
  int layout;

  ImageDetails(this.size, this.layout);

  @override
  State<ImageDetails> createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails> {
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
  const ContactForm({super.key});

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
    isVaildEmail(_email_controller);
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
          SizedBox(height: kDefaultPadding * 2),
          Center(
            child: FittedBox(
              child: DefaultButton(
                imageSrc: "assets/images/contact_icon.png",
                text: "Contact Me!",
                press: () {
                  setState(() {
                    isPressed = true;
                    isVaildEmail(_email_controller);
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    required this.imageSrc,
    required this.text,
    required this.press,
  });

  final String imageSrc, text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Color(0xFFE8F0F9)),
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
