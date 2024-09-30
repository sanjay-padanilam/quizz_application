import 'package:flutter/material.dart';
import 'package:quizz_application/Dummydb.dart';
import 'package:quizz_application/utils/colorconstants.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int Questionindex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colorconstants.Scaffoldbgcolor,
        appBar: AppBar(
          backgroundColor: Colorconstants.Scaffoldbgcolor,
          actions: [
            Text(
              "1/13",
              style: TextStyle(color: Colorconstants.textColor),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colorconstants.Questionsbgcolor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
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
              Column(
                children: List.generate(
                  4,
                  (Index) => Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colorconstants.textColor,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Dummydb.Questionslist[Questionindex]["Options"]
                                [Index],
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
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Questionindex = Questionindex + 1;
                  if (Questionindex > 5) {
                    Questionindex = 0;
                  }

                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
}
