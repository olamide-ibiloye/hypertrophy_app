import 'package:flutter/material.dart';
import 'exercise_button.dart';
import 'package:hypertrophy_app/screens/coach_screen.dart';
import '../add_new_exercise/coach_bank.dart';
import 'package:hypertrophy_app/screens/video_model_screen.dart';

CoachBank coachBank = CoachBank();

class ExerciseTile extends StatelessWidget {
  const ExerciseTile({super.key, required this.exerciseName, required this.getExerciseVideoID});

  final String exerciseName;
  final Function getExerciseVideoID;

  @override
  Widget build(BuildContext context) {
    return ExerciseButton(
      exerciseName: exerciseName,
      exerciseDetails: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => CoachScreen(
            coachPoints:
            coachBank.getExerciseCoach(exerciseName),
            exerciseName: exerciseName,
          ),
        );
      },
      exerciseVideo: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoModel(
                videoID: getExerciseVideoID(
                    exerciseName: exerciseName)),
          ),
        );
      },
    );
  }
}
