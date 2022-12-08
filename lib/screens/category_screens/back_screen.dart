import 'package:flutter/material.dart';
import 'package:hypertrophy_app/add_new_exercise/exercise_bank.dart';
import 'package:hypertrophy_app/components/image_board_header.dart';
import 'package:hypertrophy_app/components/exercise_tiles_generator.dart';

class BackScreen extends StatefulWidget {
  const BackScreen({Key? key}) : super(key: key);

  static String id = 'back_screen';

  @override
  State<BackScreen> createState() => _BackScreenState();
}

class _BackScreenState extends State<BackScreen> {
  double imageHeaderHeight = 200.0;
  ExerciseBank exerciseBank = ExerciseBank();
  late List<String> exerciseNames = exerciseBank.backKeysFinder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ImageBoardHeader(
              imageName: 'back.png', exerciseName: 'BACK'),
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return ExerciseTile(
                    exerciseName: exerciseNames[index],
                    getExerciseVideoID:
                        exerciseBank.getBackExerciseVideoID);
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
