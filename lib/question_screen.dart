import 'package:flutter/material.dart';
import 'package:adv_basic/answer_buton.dart';
import 'package:adv_basic/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQustionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    //currentQuestionIndex += 1;
    setState(() {
      currentQustionIndex++; //increase the value by 1 and only 1, not 2.
    });
  }

  @override
  Widget build(context) {
    final currentQuestions = questions[currentQustionIndex];

    return Container(
      margin: const EdgeInsets.all(35), //margin = space between bottons
      child: SizedBox(
        width: double.infinity, //be as wide as possible
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestions.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 201, 157, 251),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // we have to spread this (below)
            ...currentQuestions.getShuffledAnswers().map(
              (answer) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(answer);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
