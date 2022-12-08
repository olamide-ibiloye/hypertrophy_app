import 'package:flutter/material.dart';
import 'package:hypertrophy_app/constants.dart';

class ExerciseButton extends StatelessWidget {
  const ExerciseButton(
      {super.key,
      required this.exerciseName,
      required this.exerciseDetails,
      required this.exerciseVideo});

  final String exerciseName;
  final Function() exerciseDetails;
  final Function() exerciseVideo;

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextButton(
        onPressed: exerciseVideo,
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          height: currentHeight / 10,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: kBrandColor,
                    size: currentHeight / 40,
                  ),
                  onPressed: exerciseDetails,
                ),
                const SizedBox(
                  width: 40.0,
                ),
                Expanded(
                  child: Text(
                    exerciseName,
                    style: kExerciseTextStyle.copyWith(
                      fontSize: currentHeight / 40,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
