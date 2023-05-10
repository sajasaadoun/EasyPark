import 'package:flutter/material.dart';
// import '../constants.dart';
import '../model/question_model.dart'; // our question model
import '../widgets/question_widget.dart'; // the question widget
import '../widgets/next_buttonEn.dart';
import '../widgets/option_card.dart';
import '../widgets/result_boxEn.dart';
import '../model/db_connect.dart';

// create the HomeScreen widget
// I'm taking the Stateful widget because it's going to be our parent widget and all the functions and variables will be in this widget so we will need to change state of our widget.
class QuestionnaireDb extends StatefulWidget {
  const QuestionnaireDb({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<QuestionnaireDb> {
  // create an object for Dbconnect
  var db = DBconnect();
  // List<Question> _questions = [
  //   Question(
  //     id: '10',
  //     title: 'What is 2 + 2 ?',
  //     options: {'5': false, '30': false, '4': true, '10': false},
  //   ),
  //   Question(
  //     id: '11',
  //     title: 'What is 10 + 20 ?',
  //     options: {'50': false, '30': true, '40': false, '10': false},
  //   )
  // ];
  late Future _questions;

  Future<List<Question>> getData() async {
    return db.fetchQuestions();
  }

  @override
  void initState() {
    _questions = getData();
    super.initState();
  }

  // create an index to loop through _questions
  int index = 0;
  // create a score variable
  int score = 0;
  // create a boolean value to check if the user has clicked
  bool isPressed = false;
  // create a function to display the next question
  bool isAlreadySelected = false;
  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      double finalresult = (score / questionLength);
      int f = finalresult.toInt();
      // this is the block where the questions end.
      showDialog(
          context: context,
          barrierDismissible:
              false, // this will disable the dissmis function on clicking outside of box
          builder: (ctx) => ResultBox(
                result: f, // total points the user got
                questionLength: questionLength, // out of how many questions
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++; // when the index will change to 1. rebuild the app.
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please select any option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  // create a function for changing color
  void checkAnswerAndUpdate(String value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == "0A") {
        score += 0;
      }
      if (value == "1A") {
        score += 1;
      }
      if (value == "2A") {
        score += 2;
      }
      if (value == "3A") {
        score += 3;
      }
      if (value == "4A") {
        score += 4;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  // create a function to start over
  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // use the FutureBuilder Widget
    return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Question>;
            return Scaffold(
              // change the background
              backgroundColor: Colors.blue,
              appBar: AppBar(
                title: const Text('Questionnaire'),
                backgroundColor: Colors.blue,
                shadowColor: Colors.transparent,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Score: $score',
                      style: const TextStyle(fontSize: 15.0),
                    ),
                  ),
                ],
              ),
              body: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 100),
                  child: Column(
                    children: [
                      // add the questionWIdget here
                      QuestionWidget(
                        indexAction: index, // currently at 0.
                        question: extractedData[index]
                            .title, // means the first question in the list.
                        totalQuestions:
                            extractedData.length, // total length of the list
                      ),
                      const Divider(color: Colors.white),
                      // add some space
                      const SizedBox(height: 25.0),
                      for (int i = 0;
                          i < extractedData[index].options.length;
                          i++)
                        GestureDetector(
                          onTap: () => checkAnswerAndUpdate(
                              extractedData[index].options.keys.toList()[i]),
                          child: OptionCard(
                            option:
                                extractedData[index].options.values.toList()[i],
                            color: isPressed
                                // ignore: unrelated_type_equality_checks
                                ? extractedData[index]
                                            .options
                                            .keys
                                            .toList()[i] ==
                                        extractedData[index]
                                    ? Colors.green
                                    : Colors.grey
                                : Colors.white,
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              // use the floating action button
              floatingActionButton: GestureDetector(
                onTap: () => nextQuestion(extractedData.length),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: NextButton(// the above function
                      ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          }
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 20.0),
                Text(
                  'Please wait while the questions load...',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.none,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          );
        }

        return const Center(
          child: Text('No Data '),
        );
      },
    );
  }
}

// import this file to our main.dart file