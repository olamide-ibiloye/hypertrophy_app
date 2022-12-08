import 'package:flutter/material.dart';
import 'package:hypertrophy_app/add_new_exercise/exercise_bank.dart';
import 'package:hypertrophy_app/components/image_board_header.dart';
import 'package:hypertrophy_app/components/exercise_tiles_generator.dart';

class AnteriorThighScreen extends StatefulWidget {
  const AnteriorThighScreen({Key? key}) : super(key: key);

  static String id = 'anterior_thigh_screen';

  @override
  State<AnteriorThighScreen> createState() => _AnteriorThighScreenState();
}

class _AnteriorThighScreenState extends State<AnteriorThighScreen> {
  double imageHeaderHeight = 200.0;
  ExerciseBank exerciseBank = ExerciseBank();
  late List<String> exerciseNames = exerciseBank.anteriorThighKeysFinder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ImageBoardHeader(
              imageName: 'thigh.png', exerciseName: 'ANTERIOR THIGH'),
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return ExerciseTile(
                    exerciseName: exerciseNames[index],
                    getExerciseVideoID:
                        exerciseBank.getAnteriorThighExerciseVideoID);
              },
              itemCount: exerciseNames.length,
            ),
          ),
          const SizedBox(
            height: 30.0,
          )
        ],
      ),
    );
  }
}
