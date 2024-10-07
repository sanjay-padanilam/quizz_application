import 'package:flutter/material.dart';
import 'package:quizz_application/Dummydb.dart';
import 'package:quizz_application/utils/colorconstants.dart';
import 'package:quizz_application/view/questions_screen/questions_screen.dart';

class ResultScreen extends StatefulWidget {
  final int rightaswercount;
  const ResultScreen({super.key, required this.rightaswercount});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    calculatefn();
    super.initState();
  }

  int starcount = 0;
  calculatefn() {
    var percentage =
        widget.rightaswercount / Dummydb.Questionslist.length * 100;

    if (percentage >= 80) {
      starcount = 3;
    } else if (percentage <= 50) {
      starcount = 2;
    } else if (percentage >= 30) {
      starcount = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconstants.Scaffoldbgcolor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15, bottom: index == 1 ? 30 : 0),
                    child: Icon(
                      Icons.star,
                      size: index == 1 ? 80 : 50,
                      color: index < starcount && starcount != 0
                          ? Colorconstants.goldenyellowcolor
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Congratulations",
                style: TextStyle(
                    color: Colorconstants.goldenyellowcolor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Text(
                    "Your score",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colorconstants.textColor),
                  ),
                  Text(
                    "${widget.rightaswercount}/${Dummydb.Questionslist.length}",
                    style: TextStyle(
                        color: Colorconstants.goldenyellowcolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuestionsScreen()));
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colorconstants.textColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.restart_alt,
                        size: 30,
                        weight: 25,
                      ),
                      Text(
                        "Restart",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Color getcolor(colorindex) {
  //   if (starcount != 0 && starcount == 1) {
  //     return colorindex[0] = Colorconstants.goldenyellowcolor;
  //   } else if (starcount == 2) {
  //     return colorindex[starcount - 1] = Colorconstants.goldenyellowcolor;
  //   } else if (starcount == 3) {
  //     return colorindex[starcount - 1] = Colorconstants.goldenyellowcolor;
  //   } else
  //     return Colors.grey;
  // }
}
