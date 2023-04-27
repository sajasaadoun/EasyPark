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
    "Over the past week have you had problems remembering things, following conversations, paying attention, thinking clearly, or finding your way around the house or in town?",
    [
      Answer("0: Normal", true),
      Answer("1: Slight", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));
  list.add(Question(
    "Over the past week have you seen, heard, smelled, or felt things that were not really there?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));
  list.add(Question(
    "Over the past week have you felt low, sad, hopeless, or unable to enjoy things? If yes, was this feeling for longer than one day at a time? Did it make it difficult for you carry out your usual activities or to be with people?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "Over the past week have you felt nervous, worried, or tense? If yes, was this feeling for longer than one day at a time? Did it make it difficult for you to follow your usual activities or to be with other people?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "Over the past week, have you felt indifferent to doing activitiesor being with people?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "Over the past week, have you had unusually strong urges that are hard to control? Do you feel driven to do or think about something and find it hard to stop?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "Over the past week, have you had trouble going to sleep at night or staying asleep through the night?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "Over the past week, have you had trouble staying awake during the daytime?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "Over the past week, have you had uncomfortable feelings in your body like pain, aches, tingling, or cramps?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "Over the past week, have you had trouble with urine control? For example, an urgent need to urinate, a need to urinate too often, or urine accidents?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "Over the past week have you had constipation troubles that cause you difficulty moving your bowels?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));
  list.add(Question(
    "Over the past week, have you felt faint, dizzy, or foggy when you stand up after sitting or lying down?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "Over the past week, have you usually felt fatigued? This feeling is not part of being sleepy or sad",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "2.1-Over the past week, have you had problems with your speech?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "2.2-Over the past week, have you usually had too much saliva during when you are awake or when you sleep?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));
  list.add(Question(
    "2.3-Over the past week, have you usually had problems swallowing pills or eating meals? Do you need your pills cut or crushed or your meals to be made soft, chopped, or blended to avoid choking?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "2.4-Over the past week, have you usually had troubles handling your food and using eating utensils? For example, do you have trouble handling finger foods or using forks, knives, spoons, chopsticks?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));
  list.add(Question(
    "2.5-Over the past week, have you usually had problems dressing? For example, are you slow or do you need help with buttoning, using zippers, putting on or taking off your clothes or jewelry?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));
  list.add(Question(
    "2.6-Over the past week, have you usually been slow or do you need help with washing, bathing, shaving, brushing teeth, combing your hair, or with other personal hygiene?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "2.7-Over the past week, have people usually had trouble reading your handwriting?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "2.8-Over the past week, have you usually had trouble doing your hobbies or other things that you like to do?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "2.9-Over the past week, do you usually have trouble turning over in bed?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "2.10-Over the past week, have you usually had shaking or tremor?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "2.11-Over the past week, have you usually had trouble getting out of bed, a car seat, or a deep chair?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "2.12-Over the past week, have you usually had problems with balance and walking?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  list.add(Question(
    "2.13-Over the past week, on your usual day when walking, do you suddenly stop or freeze as if your feet are stuck to the floor?",
    [
      Answer("0: Normal.", true),
      Answer("1: Slight.", true),
      Answer("2: Mild.", true),
      Answer("3: Moderate.", true),
      Answer("4: Severe.", true),
    ],
  ));

  //part2

  return list;
}
