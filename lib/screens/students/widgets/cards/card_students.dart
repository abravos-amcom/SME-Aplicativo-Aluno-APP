import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sme_app_aluno/utils/string_support.dart';

class CardStudent extends StatelessWidget {
  final String name;
  final String schoolName;
  final String schooType;
  final String studentGrade;
  final Function onPress;
  final Image avatar;

  CardStudent(
      {@required this.name,
      @required this.schoolName,
      @required this.studentGrade,
      @required this.onPress,
      @required this.schooType,
      this.avatar});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenHeight = (size.height - MediaQuery.of(context).padding.top) / 100;

    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(screenHeight * 2),
        margin: EdgeInsets.only(bottom: screenHeight * 1.5),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 2),
              blurRadius: 2,
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(screenHeight * 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: screenHeight * 1.5),
                    child: avatar != null
                        ? avatar
                        : ClipOval(
                            child: Image.asset(
                              "assets/images/avatar_estudante.png",
                              width: screenHeight * 8,
                              height: screenHeight * 8,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AutoSizeText(
                          StringSupport.truncateEndString(name, 30),
                          maxFontSize: 12,
                          minFontSize: 10,
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: screenHeight * 0.3,
                        ),
                        AutoSizeText(
                          "$schooType ${StringSupport.truncateEndString(schoolName, 30)}",
                          maxFontSize: 10,
                          minFontSize: 8,
                          style: TextStyle(color: Color(0xff666666)),
                        ),
                        SizedBox(
                          height: screenHeight * 0.3,
                        ),
                        AutoSizeText(
                          "TURMA $studentGrade",
                          maxFontSize: 10,
                          minFontSize: 8,
                          style: TextStyle(color: Color(0xffBBBDC9)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              FontAwesomeIcons.chevronRight,
              color: Color(0xffffd037),
              size: screenHeight * 3,
            )
          ],
        ),
      ),
    );
  }
}
