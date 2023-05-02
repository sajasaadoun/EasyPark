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
    "1.1Over the past week have you had problems remembering things, following conversations, paying attention, thinking clearly, or finding your way around the house or in town?",
    [
      Answer("0: Normal: No cognitive impairment", true),
      Answer(
          "1: Slight: Impairment appreciated by patient or caregiver with no concrete interference with the patient’s ability to carry out normal activities and social interactions",
          true),
      Answer(
          "2: Mild: Clinically evident cognitive dysfunction, but only minimal interference with the patient’s ability to carry out normal activities and social interactions.",
          true),
      Answer(
          "3: Moderate: Cognitive deficits interfere with but do not preclude the patient’s ability to carry out normal activities and social interactions.",
          true),
      Answer(
          "4: Severe: Cognitive dysfunction precludes the patient’s ability to carry out normal activities and social interactions.",
          true),
    ],
  ));
  list.add(Question(
    "1.2 Over the past week have you seen, heard, smelled, or felt things that were not really there?",
    [
      Answer("0: Normal: No hallucinations or psychotic behavior.", true),
      Answer(
          "1: Slight: Illusions or non-formed hallucinations, but patient recognizes them without loss of insight.",
          true),
      Answer(
          "2: Mild: Formed hallucinations independent of environmental stimuli. No loss of insight.",
          true),
      Answer("3: Moderate: Formed hallucinations with loss of insight.", true),
      Answer("4: Severe: Patient has delusions or paranoia", true),
    ],
  ));
  list.add(Question(
    "1.3 Over the past week have you felt low, sad, hopeless, or unable to enjoy things? If yes, was this feeling for longer than one day at a time? Did it make it difficult for you carry out your usual activities or to be with people?",
    [
      Answer("0: Normal: No depressed mood.", true),
      Answer(
          "1: Slight: Episodes of depressed mood that are not sustained for more than one day at a time. No interference with patient’s ability to carry out normal activities and social interactions.",
          true),
      Answer(
          "2: Mild: Depressed mood that is sustained over days, but without interference with normal activities and social interactions.",
          true),
      Answer(
          "3: Moderate: Depressed mood that interferes with, but does not preclude the patient’s ability to carry out normal activities and social interactions.",
          true),
      Answer(
          "4: Severe: Depressed mood precludes patient’s ability to carry out normal activities and social interactions.",
          true),
    ],
  ));

  list.add(Question(
    "1.4 Over the past week have you felt nervous, worried, or tense? If yes, was this feeling for longer than one day at a time? Did it make it difficult for you to follow your usual activities or to be with other people?",
    [
      Answer("0: Normal: No anxious feelings.", true),
      Answer(
          "1: Slight: Anxious feelings present but not sustained for more than one day at a time. No interference with patient’s ability to carry out normal activities and social interactions.",
          true),
      Answer(
          "2: Mild: Anxious feelings are sustained over more than one day at a time, but without interference with patient’s ability to carry out normal activities and social interactions.",
          true),
      Answer(
          "3: Moderate: Anxious feelings interfere with, but do not preclude, the patient’s ability to carry out normal activities and social interactions.",
          true),
      Answer(
          "4: Severe: Anxious feelings preclude patient’s ability to carry out normal activities and social interactions.",
          true),
    ],
  ));

  list.add(Question(
    "1.5 Over the past week, have you felt indifferent to doing activitiesor being with people?",
    [
      Answer("0: Normal: No apathy.", true),
      Answer(
          "1: Slight: Apathy appreciated by patient and/or caregiver, but no interference with daily activities and social interactions.",
          true),
      Answer(
          "2: Mild: Apathy interferes with isolated activities and social interactions.",
          true),
      Answer(
          "3: Moderate: Apathy interferes with most activities and social interactions.",
          true),
      Answer("4: Severe: Passive and withdrawn, complete loss of initiative.",
          true),
    ],
  ));

  list.add(Question(
    "1.6 Over the past week, have you had unusually strong urges that are hard to control? Do you feel driven to do or think about something and find it hard to stop?",
    [
      Answer("0: Normal: No problems present.", true),
      Answer(
          "1: Slight: Problems are present but usually do not cause any difficulties for the patient or family/caregiver",
          true),
      Answer(
          "2: Mild: Problems are present and usually cause a few difficulties in the patient’s personal and family life.",
          true),
      Answer(
          "3: Moderate: Problems are present and usually cause a lot of difficulties in the patient’s personal and family life.",
          true),
      Answer(
          "4: Severe: Problems are present and preclude the patient’s ability to carry out normal activities or social interactions or to maintain previous standards in personal and family life.",
          true),
    ],
  ));

  list.add(Question(
    "1.7 Over the past week, have you had trouble going to sleep at night or staying asleep through the night?",
    [
      Answer("0: Normal: No problems.", true),
      Answer(
          "1: Slight: Sleep problems are present but usually do not cause trouble getting a full night of sleep.",
          true),
      Answer(
          "2: Mild: Sleep problems usually cause some difficulties getting a full night of sleep.",
          true),
      Answer(
          "3: Moderate: Sleep problems cause a lot of difficulties getting a full nigh",
          true),
      Answer("4: Severe: I usually do not sleep for most of the night.", true),
    ],
  ));

  list.add(Question(
    "1.8 Over the past week, have you had trouble staying awake during the daytime?",
    [
      Answer("0: Normal: No daytime sleepiness.", true),
      Answer(
          "1: Slight: Daytime sleepiness occurs, but I can resist and I stay awake.",
          true),
      Answer(
          "2: Mild: Sometimes I fall asleep when alone and relaxing. For example, while reading or watching TV.",
          true),
      Answer(
          "3: Moderate: I sometimes fall asleep when I should not. For example, while eating or talking with other people.",
          true),
      Answer(
          "4: Severe: I often fall asleep when I should not. For example, while eating or talking with other people",
          true),
    ],
  ));

  list.add(Question(
    "1.9 Over the past week, have you had uncomfortable feelings in your body like pain, aches, tingling, or cramps?",
    [
      Answer("0: Normal: No uncomfortable feelings.", true),
      Answer(
          "1: Slight: I have these feelings. However, I can do things and be with other people without difficulty.",
          true),
      Answer(
          "2: Mild: These feelings cause some problems when I do things or am with other people.",
          true),
      Answer(
          "3: Moderate: These feelings cause a lot of problems, but they do not stop me from doing things or being with other people.",
          true),
      Answer(
          "4: Severe: These feelings stop me from doing things or being with other people.",
          true),
    ],
  ));

  list.add(Question(
    "1.10 Over the past week, have you had trouble with urine control? For example, an urgent need to urinate, a need to urinate too often, or urine accidents?",
    [
      Answer("0: Normal: No urine control problems.", true),
      Answer(
          "1: Slight: I need to urinate often or urgently. However, these problems do not cause difficulties with my daily activities.",
          true),
      Answer(
          "2: Mild: Urine problems cause some difficulties with my daily activities.However, I do not have urine accidents.",
          true),
      Answer(
          "3: Moderate: Urine problems cause a lot of difficulties with my daily activities, including urine accidents.",
          true),
      Answer(
          "4: Severe: I cannot control my urine and use a protective garment or have a bladder tube.",
          true),
    ],
  ));

  list.add(Question(
    "1.11 Over the past week have you had constipation troubles that cause you difficulty moving your bowels?",
    [
      Answer("0: Normal: No constipation.", true),
      Answer(
          "1: Slight: I have been constipated. I use extra effort to move my bowels.However, this problem does not disturb my activities or my being comfortable.",
          true),
      Answer(
          "2: Mild: Constipation causes me to have some troubles doing things or being comfortable.",
          true),
      Answer(
          "3: Moderate: Constipation causes me to have a lot of trouble doing things or being comfortable. However, it does not stop me from doing anything.",
          true),
      Answer(
          "4: Severe: I usually need physical help from someone else to empty my bowels.",
          true),
    ],
  ));
  list.add(Question(
    "1.12 Over the past week, have you felt faint, dizzy, or foggy when you stand up after sitting or lying down?",
    [
      Answer("0: Normal: No dizzy or foggy feelings.", true),
      Answer(
          "1: Slight: Dizzy or foggy feelings occur. However, they do not cause me troubles doing things.",
          true),
      Answer(
          "2: Mild: Dizzy or foggy feelings cause me to hold on to something, but I do not need to sit or lie back down.",
          true),
      Answer(
          "3: Moderate: Dizzy or foggy feelings cause me to sit or lie down to avoid fainting or falling.",
          true),
      Answer("4: Severe: Dizzy or foggy feelings cause me to fall or faint.",
          true),
    ],
  ));

  list.add(Question(
    "1.13 Over the past week, have you usually felt fatigued? This feeling is not part of being sleepy or sad",
    [
      Answer("0: Normal: No fatigue.", true),
      Answer(
          "1: Slight: Fatigue occurs. However it does not cause me troubles doing things or being with people.",
          true),
      Answer(
          "2: Mild: Fatigue causes me some troubles doing things or being with people.",
          true),
      Answer(
          "3: Moderate: Fatigue causes me a lot of troubles doing things or being with people. However, it does not stop me from doing anything.",
          true),
      Answer(
          "4: Severe: Fatigue stops me from doing things or being with people.",
          true),
    ],
  ));

  list.add(Question(
    "2.1-Over the past week, have you had problems with your speech?",
    [
      Answer("0: Normal: Not at all (no problems).", true),
      Answer(
          "1: Slight: My speech is soft, slurred or uneven, but it does not cause others to ask me to repeat myself.",
          true),
      Answer(
          "2: Mild: My speech causes people to ask me to occasionally repeat myself, but not every day.",
          true),
      Answer(
          "3: Moderate: My speech is unclear enough that others ask me to repeat myself every day even though most of my speech is understood.",
          true),
      Answer("4: Severe: Most or all of my speech cannot be understood.", true),
    ],
  ));

  list.add(Question(
    "2.2-Over the past week, have you usually had too much saliva during when you are awake or when you sleep?",
    [
      Answer("0: Normal: Not at all (no problems).", true),
      Answer("1: Slight: I have too much saliva, but do not drool.", true),
      Answer(
          "2: Mild: I have some drooling during sleep, but none when I am awake.",
          true),
      Answer(
          "3: Moderate: I have some drooling when I am awake, but I usually do not need tissues or a handkerchief.",
          true),
      Answer(
          "4: Severe: I have so much drooling that I regularly need to use tissues or a handkerchief to protect my clothes.",
          true),
    ],
  ));
  list.add(Question(
    "2.3-Over the past week, have you usually had problems swallowing pills or eating meals? Do you need your pills cut or crushed or your meals to be made soft, chopped, or blended to avoid choking?",
    [
      Answer("0: Normal: No problems.", true),
      Answer(
          "1: Slight: I am aware of slowness in my chewing or increased effort at swallowing, but I do not choke or need to have my food specially prepared.",
          true),
      Answer(
          "2: Mild: I need to have my pills cut or my food specially prepared because of chewing or swallowing problems, but I have not choked over the past week.",
          true),
      Answer("3: Moderate. I choked at least once in the past week.", true),
      Answer(
          "4: Severe: Because of chewing and swallowing problems, I need a feeding tube.",
          true),
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
          "2: Mild: I am slow with my eating and have occasional food spills. I may need help with a few tasks such as cutting meat.",
          true),
      Answer(
          "3: Moderate: I need help with many eating tasks but can manage some alone.",
          true),
      Answer("4: Severe: I need help for most or all eating tasks.", true),
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
