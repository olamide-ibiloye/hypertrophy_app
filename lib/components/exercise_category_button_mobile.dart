import 'package:flutter/material.dart';
import '../constants.dart';

class ExerciseCategoryButtonMobile extends StatelessWidget {
  const ExerciseCategoryButtonMobile(
      {super.key,
      required this.onTap,
      required this.categoryName,
      required this.imageName,
      required this.categoryFontSize});

  final Function() onTap;
  final String categoryName;
  final String imageName;
  final double categoryFontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/$imageName'),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            height: MediaQuery.of(context).size.height / 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 20.0),
                  child: Text(
                    categoryName,
                    style: kExerciseCategoryTextStyle.copyWith(
                      fontSize: categoryFontSize,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
