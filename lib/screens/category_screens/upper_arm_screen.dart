import 'package:flutter/material.dart';
import 'package:hypertrophy_app/add_new_exercise/exercise_bank.dart';
import 'package:hypertrophy_app/components/image_board_header.dart';
import 'package:hypertrophy_app/components/exercise_tiles_generator.dart';

class UpperArmScreen extends StatefulWidget {
  const UpperArmScreen({Key? key}) : super(key: key);

  static String id = 'upper_arm_screen';

  @override
  State<UpperArmScreen> createState() => _UpperArmScreenState();
}

class _UpperArmScreenState extends State<UpperArmScreen> {
  double imageHeaderHeight = 200.0;
  ExerciseBank exerciseBank = ExerciseBank();
  late List<String> exerciseNames = exerciseBank.upperArmKeysFinder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ImageBoardHeader(
              imageName: 'arm.png', exerciseName: 'UPPER ARM'),
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return ExerciseTile(
                    exerciseName: exerciseNames[index],
                    getExerciseVideoID:
                        exerciseBank.getUpperArmExerciseVideoID);
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
