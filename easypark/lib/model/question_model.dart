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
      Answer("0: Normal: Not at all (no problems).", true),
      Answer(
          "1: Slight: I am slow, but I do not need any help handling my food and have not had food spills while eating.",
          true),
      Answer(
          "2: Mild: I am slow with my eating and have occasional food spills. I may need help with a few tasks such as cutting meat",
          true),
      Answer(
          "3: Moderate: I need help with many eating tasks but can manage some alone",
          true),
      Answer("4: Severe: I need help for most or all eating tasks.", true),
    ],
  ));
  list.add(Question(
    "2.5-Over the past week, have you usually had problems dressing? For example, are you slow or do you need help with buttoning, using zippers, putting on or taking off your clothes or jewelry?",
    [
      Answer("0: Normal: Not at all (no problems).", true),
      Answer("1: Slight: I am slow, but I do not need help.", true),
      Answer(
          "2: Mild: I am slow and need help for a few dressing tasks (buttons, bracelets).",
          true),
      Answer("3: Moderate: I need help for many dressing tasks.", true),
      Answer("4: Severe: I need help for most or all dressing tasks.", true),
    ],
  ));
  list.add(Question(
    "2.6-Over the past week, have you usually been slow or do you need help with washing, bathing, shaving, brushing teeth, combing your hair, or with other personal hygiene?",
    [
      Answer("0: Normal: Not at all (no problems).", true),
      Answer("1: Slight: I am slow, but I do not need any help.", true),
      Answer("2: Mild: I need someone else to help me with some hygiene tasks.",
          true),
      Answer("3: Moderate: I need help for many hygiene tasks.", true),
      Answer(
          "4: Severe: I need help for most or all of my hygiene tasks.", true),
    ],
  ));

  list.add(Question(
    "2.7-Over the past week, have people usually had trouble reading your handwriting?",
    [
      Answer("0: Normal: Not at all (no problems).", true),
      Answer(
          "1: Slight: My writing is slow, clumsy or uneven, but all words are clear.",
          true),
      Answer("2: Mild: Some words are unclear and difficult to read.", true),
      Answer(
          "3: Moderate: Many words are unclear and difficult to read.", true),
      Answer("4: Severe: Most or all words cannot be read.", true),
    ],
  ));

  list.add(Question(
    "2.8-Over the past week, have you usually had trouble doing your hobbies or other things that you like to do?",
    [
      Answer("0: Normal: Not at all (no problems).", true),
      Answer(
          "1: Slight: I am a bit slow but do these activities easily.", true),
      Answer("2: Mild: I have some difficulty doing these activities.", true),
      Answer(
          "3: Moderate: I have major problems doing these activities, but still do most",
          true),
      Answer("4: Severe: I am unable to do most or all of these activities.",
          true),
    ],
  ));

  list.add(Question(
    "2.9-Over the past week, do you usually have trouble turning over in bed?",
    [
      Answer("0: Normal: Not at all (no problems).", true),
      Answer(
          "1: Slight: I have a bit of trouble turning, but I do not need any help.",
          true),
      Answer(
          "2: Mild I have a lot of trouble turning and need occasional help from someone else.",
          true),
      Answer("3: Moderate: To turn over I often need help from someone else.",
          true),
      Answer(
          "4: Severe: I am unable to turn over without help from someone else.",
          true),
    ],
  ));

  list.add(Question(
    "2.10-Over the past week, have you usually had shaking or tremor?",
    [
      Answer("0: Normal: Not at all. I have no shaking or tremor.", true),
      Answer(
          "1: Slight: Shaking or tremor occurs but does not cause problems with any activities",
          true),
      Answer(
          "2: Mild: Shaking or tremor causes problems with only a few activities",
          true),
      Answer(
          "3: Moderate: Shaking or tremor causes problems with many of my daily activities.",
          true),
      Answer(
          "4: Severe: Shaking or tremor causes problems with most or all activities.",
          true),
    ],
  ));

  list.add(Question(
    "2.11-Over the past week, have you usually had trouble getting out of bed, a car seat, or a deep chair?",
    [
      Answer("0: Normal: Not at all.", true),
      Answer(
          "1: Slight: I am slow or awkward, but I usually can do it on my first try.",
          true),
      Answer(
          "2: Mild: I need more than one try to get up or need occasional help",
          true),
      Answer(
          "3: Moderate: I sometimes need help to get up, but most times I can still do it on my own.",
          true),
      Answer("4: Severe: I need help most or all of the time.", true),
    ],
  ));

  list.add(Question(
    "2.12-Over the past week, have you usually had problems with balance and walking?",
    [
      Answer("0: Normal: Not at all.", true),
      Answer(
          "1: Slight: I am slightly slow or may drag a leg. I never use a walking aid.",
          true),
      Answer(
          "2: Mild: I occasionally use a walking aid, but I do not need any help from another person",
          true),
      Answer(
          "3: Moderate: I usually use a walking aid (cane, walker) to walk safely without falling. However, I do not usually need the support of another person.",
          true),
      Answer(
          "4: Severe: I usually use the support of another person to walk safely without falling.",
          true),
    ],
  ));

  list.add(Question(
    "2.13-Over the past week, on your usual day when walking, do you suddenly stop or freeze as if your feet are stuck to the floor?",
    [
      Answer("0: Normal: Not at all.", true),
      Answer(
          "1: Slight: I briefly freeze, but I can easily start walking again. I do not need help from someone else or a walking aid (cane or walker) because of freezing.",
          true),
      Answer(
          "2: Mild: I freeze and have trouble starting to walk again, but I do not need someone’s help or a walking aid (cane or walker) because of freezing.",
          true),
      Answer(
          "3: Moderate: When I freeze I have a lot of trouble starting to walk again and, because of freezing, I sometimes need to use a walking aid or need someone else’s help.",
          true),
      Answer(
          "4: Severe: Because of freezing, most or all of the time, I need to use a walking aid or someone’s help.",
          true),
    ],
  ));

  //part2

  return list;
}
