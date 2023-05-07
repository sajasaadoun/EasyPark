import 'package:flutter/material.dart';
import 'package:easypark/model/questionnaire_questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  List<Question> questionlist = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(children: [
          const Text(
            "Questionnaire",
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
          _questionWidget(),
          _answerList(),
          _nextButton(),
        ]),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Severity Level Questionnaire ${currentQuestionIndex + 1}/${questionlist.length.toString()}",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.blue[600],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionlist[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionlist[currentQuestionIndex]
          .answerList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 48,
        child: ElevatedButton(
          child: Text(answer.answerText),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: isSelected ? Colors.blue[600] : Colors.white,
            onPrimary: isSelected ? Colors.white : Colors.black,
          ),
          onPressed: () {
            if (selectedAnswer == null) {
              if (answer.isCorrect) {
                score++;
              }
            }

            setState(() {
              selectedAnswer = answer;
            });
          },
        ));
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionlist.length - 1) {
      isLastQuestion = true;
    }
    return Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 48,
        child: ElevatedButton(
          child: Text(isLastQuestion ? "finish" : "next"),
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: Colors.blueAccent,
            onPrimary: Colors.white,
          ),
          onPressed: () {
            if (isLastQuestion) {
            } else {
              setState(() {
                selectedAnswer = null;
                currentQuestionIndex++;
              });
            }
          },
        ));
  }
}
