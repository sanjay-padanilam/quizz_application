import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quizz_application/Dummydb.dart';
import 'package:quizz_application/utils/animation_constants.dart';
import 'package:quizz_application/utils/colorconstants.dart';
import 'package:quizz_application/view/result_screen/result_screen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int Questionindex = 0; //index of questionlist for big container
  int? selectedoption; //index of clicked option
  int rightanswercount = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colorconstants.Scaffoldbgcolor,
        appBar: AppBar(
          backgroundColor: Colorconstants.Scaffoldbgcolor,
          actions: [
            Text(
              "${Questionindex + 1}/${Dummydb.Questionslist.length}",
              style: TextStyle(color: Colorconstants.textColor),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colorconstants.Questionsbgcolor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: selectedoption ==
                          Dummydb.Questionslist[Questionindex]["answerindex"]
                      ? Stack(
                          children: [
                            Lottie.asset(AnimationConstants.rightanimation),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  Dummydb.Questionslist[Questionindex]
                                      ["Question"],
                                  style: TextStyle(
                                      color: Colorconstants.textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              Dummydb.Questionslist[Questionindex]["Question"],
                              style: TextStyle(
                                  color: Colorconstants.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                ),
              ),
              Column(
                children: List.generate(
                  4,
                  (optionIndex) => Padding(
                    //optionindex if for index of option list in dummy db
                    padding: const EdgeInsets.only(top: 20),
                    child: InkWell(
                      onTap: () {
                        if (selectedoption == null) {
                          selectedoption = optionIndex;
                          print(selectedoption);

                          setState(() {});
                          if (selectedoption ==
                              Dummydb.Questionslist[Questionindex]
                                  ["answerindex"]) {
                            rightanswercount++;
                          }
                        }
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: getcolor(optionIndex)),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Dummydb.Questionslist[Questionindex]["Options"]
                                  [optionIndex],
                              style: TextStyle(
                                  color: Colorconstants.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                            Icon(
                              Icons.circle_outlined,
                              color: Colorconstants.textColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              selectedoption == null
                  ? SizedBox()
                  : InkWell(
                      onTap: () {
                        if (Questionindex < Dummydb.Questionslist.length - 1) {
                          Questionindex++;

                          selectedoption = null;
                        } else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultScreen(
                                    rightaswercount: rightanswercount),
                              ));
                        }
                        setState(() {});
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colorconstants.textColor),
                        child: Center(
                          child: Text("Next"),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Color getcolor(int currentoptionindex) {
    //currrent option index optionindex
    if (selectedoption != null &&
        currentoptionindex ==
            Dummydb.Questionslist[Questionindex]["answerindex"]) {
      return Colorconstants.rightanserColor;
    }
    if (selectedoption == currentoptionindex) {
      if (selectedoption ==
          Dummydb.Questionslist[Questionindex]["answerindex"]) {
        return Colorconstants.rightanserColor;
      } else {
        return Colorconstants.wronganswerColor;
      }
    } else
      return Colorconstants.textColor;
  }
}
