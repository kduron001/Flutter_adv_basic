import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Flutter extends StatelessWidget {
  const Flutter(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assests/images/quizlogo.png",
          width: 300,
          color: const Color.fromARGB(
              170, 255, 255, 255), // this can add a color overlay on an image,
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 30,
          child: Text(
            "Learn Flutter the Fun way!",
            style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        OutlinedButton.icon(
          onPressed: () {
            startQuiz();
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.cyan[50],
          ),
          icon: const Icon(
            Icons.arrow_right_alt,
          ),
          label: const Text(
            "Start Quiz",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
