import 'package:flutter/material.dart';
import 'package:hypertrophy_app/constants.dart';
import 'package:hypertrophy_app/components/exercise_category_button_mobile.dart';

class MobileViewScreen extends StatelessWidget {
  const MobileViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 25,
      child: ListView.builder(
              shrinkWrap: true,
              itemCount: kExerciseCategories.length,
              itemBuilder: (context, index) {
                return ExerciseCategoryButtonMobile(
                  onTap: () {
                    Navigator.pushNamed(
                        context, kExerciseCategoryRouteNames[index]);
                  },
                  categoryName: kExerciseCategories[index],
                  imageName: kExerciseCategoryImageNames[index],
                  categoryFontSize: 20,
                );
              })
    );
  }
}
