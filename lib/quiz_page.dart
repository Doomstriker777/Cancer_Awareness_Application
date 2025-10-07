import 'dart:math';
import 'package:flutter/material.dart';
import 'quiz_data.dart';
import 'quiz_question.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late List<QuizQuestion> selectedQuestions;
  int currentQuestionIndex = 0;
  int score = 0;
  List<int> wrongAnswers = [];

  @override
  void initState() {
    super.initState();
    selectedQuestions = List<QuizQuestion>.from(allQuizQuestions)..shuffle();
    selectedQuestions = selectedQuestions.take(10).toList();
  }

  void _submitAnswer(int selectedIndex) {
    final correctIndex = selectedQuestions[currentQuestionIndex].correctIndex;

    if (selectedIndex == correctIndex) {
      score++;
    } else {
      wrongAnswers.add(currentQuestionIndex);
    }

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= selectedQuestions.length) {
      // Show final score
      return Scaffold(
        appBar: AppBar(title: Text("Quiz Result")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your Score: $score / 10", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              if (wrongAnswers.isNotEmpty)
                Text("Questions you got wrong:", style: TextStyle(fontSize: 18, color: Colors.red)),
              ...wrongAnswers.map((index) {
                final q = selectedQuestions[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text("Q: ${q.question}\nCorrect Answer: ${q.options[q.correctIndex]}", style: TextStyle(fontSize: 16)),
                );
              }),
            ],
          ),
        ),
      );
    }

    final question = selectedQuestions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(title: Text("Question ${currentQuestionIndex + 1}/10")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question.question, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ...List.generate(question.options.length, (i) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                  onPressed: () => _submitAnswer(i),
                  child: Text(question.options[i]),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
