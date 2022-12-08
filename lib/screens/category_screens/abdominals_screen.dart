import 'package:flutter/material.dart';
import 'package:hypertrophy_app/add_new_exercise/exercise_bank.dart';
import 'package:hypertrophy_app/components/image_board_header.dart';
import 'package:hypertrophy_app/components/exercise_tiles_generator.dart';

class AbdominalsScreen extends StatefulWidget {
  const AbdominalsScreen({Key? key}) : super(key: key);

  static String id = 'abdominals_screen';

  @override
  State<AbdominalsScreen> createState() => _AbdominalsScreenState();
}

class _AbdominalsScreenState extends State<AbdominalsScreen> {
  double imageHeaderHeight = 200.0;
  ExerciseBank exerciseBank = ExerciseBank();
  late List<String> exerciseNames = exerciseBank.abdominalsKeysFinder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ImageBoardHeader(
              imageName: 'abdominals.png', exerciseName: 'ABNOMINALS'),
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return ExerciseTile(
                    exerciseName: exerciseNames[index],
                    getExerciseVideoID:
                        exerciseBank.getAbdominalsExerciseVideoID);
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
