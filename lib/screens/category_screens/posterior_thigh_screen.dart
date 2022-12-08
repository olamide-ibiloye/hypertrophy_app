import 'package:flutter/material.dart';
import 'package:hypertrophy_app/add_new_exercise/exercise_bank.dart';
import 'package:hypertrophy_app/components/image_board_header.dart';
import 'package:hypertrophy_app/components/exercise_tiles_generator.dart';

class PosteriorThighScreen extends StatefulWidget {
  const PosteriorThighScreen({Key? key}) : super(key: key);

  static String id = 'posterior_thigh_screen';

  @override
  State<PosteriorThighScreen> createState() => _PosteriorThighScreenState();
}

class _PosteriorThighScreenState extends State<PosteriorThighScreen> {
  double imageHeaderHeight = 200.0;
  ExerciseBank exerciseBank = ExerciseBank();
  late List<String> exerciseNames = exerciseBank.posteriorThighKeysFinder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ImageBoardHeader(
              imageName: 'thigh.png', exerciseName: 'POSTERIOR THIGH'),
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return ExerciseTile(
                    exerciseName: exerciseNames[index],
                    getExerciseVideoID:
                        exerciseBank.getPosteriorThighExerciseVideoID);
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
