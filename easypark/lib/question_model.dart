class Question {
  final String questionText;
  final List<Answer> answerList;
  Question(this.questionText, this.answerList);
}

class Answer {
  final String answerText;
  final bool isCorrect;
  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];

  list.add(Question(
    "question1",
    [
      Answer("choice1", true),
      Answer("choice2", true),
      Answer("choice3", true),
      Answer("choice4", true),
    ],
  ));
  list.add(Question(
    "question2",
    [
      Answer("choice1", true),
      Answer("choice2", true),
      Answer("choice3", true),
      Answer("choice4", true),
    ],
  ));
  list.add(Question(
    "question3",
    [
      Answer("choice1", true),
      Answer("choice2", true),
      Answer("choice3", true),
      Answer("choice4", true),
    ],
  ));

  return list;
}
