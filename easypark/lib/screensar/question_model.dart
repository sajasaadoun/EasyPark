import 'package:flutter/material.dart';

import '../model/question_DBar.dart';

class QuestionsScreenAr extends StatefulWidget {
  const QuestionsScreenAr({super.key});

  @override
  State<QuestionsScreenAr> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreenAr> {
  List<QuestionAr> questionlist = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  AnswerAr? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(children: [
          const Text(
            "استبيان",
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
          "الاسئلة ${currentQuestionIndex + 1}/${questionlist.length.toString()}",
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

  Widget _answerButton(AnswerAr answerAr) {
    bool isSelected = answerAr == selectedAnswer;

    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 48,
        child: ElevatedButton(
          child: Text(answerAr.answerText),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: isSelected ? Colors.blue[600] : Colors.white,
            onPrimary: isSelected ? Colors.white : Colors.black,
          ),
          onPressed: () {
            if (selectedAnswer == null) {
              if (answerAr.isCorrect) {
                score++;
              }
            }

            setState(() {
              selectedAnswer = answerAr;
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
          child: Text(isLastQuestion ? "انتهاء" : "التالي"),
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
