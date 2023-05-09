import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({Key? key}) : super(key: key);

  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  List<Map<String, dynamic>> questions = [];

  @override
  void initState() {
    super.initState();
    _getQuestionsFromFirestore();
  }

  Future<void> _getQuestionsFromFirestore() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('questionnaire').get();

    setState(() {
      questions = snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  void handleAnswer(int index) {
    bool isCorrect =
        questions[currentQuestionIndex]['options'][index]['isCorrect'];
    if (isCorrect) {
      score++;
    }
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Quiz Results'),
            content: Text('You scored $score out of ${questions.length}!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Questionnaire'),
        backgroundColor: Colors.blue[600],
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1} of ${questions.length}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(
              questions[currentQuestionIndex]['question'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: questions.isNotEmpty
                    ? questions[currentQuestionIndex]['options']?.length ?? 0
                    : 0,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        handleAnswer(index);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(color: Colors.blue[600]!),
                        ),
                      ),
                      child: Text(
                        questions[currentQuestionIndex]['options'] != null
                            ? questions[currentQuestionIndex]['options'][index]
                                ['text']
                            : '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
