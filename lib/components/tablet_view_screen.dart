import 'package:flutter/material.dart';
import 'package:hypertrophy_app/constants.dart';
import 'package:hypertrophy_app/components/exercise_category_button_tablet.dart';

class TabletViewScreen extends StatelessWidget {
  const TabletViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 30,
      child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: kExerciseCategories.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 450,
                childAspectRatio: 2,
                mainAxisSpacing: 0,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExerciseCategoryButtonTablet(
                    onTap: () {
                      Navigator.pushNamed(
                          context, kExerciseCategoryRouteNames[index]);
                    },
                    categoryName: kExerciseCategories[index],
                    imageName: kExerciseCategoryImageNames[index],
                    categoryFontSize: 25,
                  ),
                );
              })
    );
  }
}
