import 'package:flutter/material.dart';
import 'package:hypertrophy_app/screens/category_screens/abdominals_screen.dart';
import 'package:hypertrophy_app/screens/category_screens/anterior_thigh_screen.dart';
import 'package:hypertrophy_app/screens/category_screens/back_screen.dart';
import 'package:hypertrophy_app/screens/category_screens/chest_screen.dart';
import 'package:hypertrophy_app/screens/category_screens/hip_screen.dart';
import 'package:hypertrophy_app/screens/category_screens/lower_leg_screen.dart';
import 'package:hypertrophy_app/screens/category_screens/posterior_thigh_screen.dart';
import 'package:hypertrophy_app/screens/category_screens/shoulder_screen.dart';
import 'package:hypertrophy_app/screens/category_screens/upper_arm_screen.dart';
import 'package:hypertrophy_app/add_new_exercise/exercise_bank.dart';

const Color kBrandColor = Color(0xff4055b1);
const Color kBrandAccentColor = Color(0xffFF5724);

const kMobileWidth = 450;

const kHeaderTextStyle = TextStyle(
  fontFamily: 'Bebas_Neue',
  fontSize: 25.0,
  color: Colors.white,
  letterSpacing: 1.0,
);

const kExerciseCategoryTextStyle = TextStyle(
  fontFamily: 'Bebas_Neue',
  fontSize: 20.0,
  color: Colors.white,
  letterSpacing: 1.0,
);

const kExerciseTextStyle = TextStyle(
  fontFamily: 'Bebas_Neue',
  fontSize: 20.0,
  color: kBrandColor,
  letterSpacing: 1.0,
);

List<String> kAllExercise = ExerciseBank().allExercisesKeysFinder();

List<String> kExerciseCategories = [
  'ABDOMINALS',
  'ANTERIOR THIGH',
  'BACK',
  'CHEST',
  'HIP',
  'LOWER LEG',
  'POSTERIOR THIGH',
  'SHOULDER',
  'UPPER ARM'
];

List<String> kExerciseCategoryRouteNames = [
  AbdominalsScreen.id,
  AnteriorThighScreen.id,
  BackScreen.id,
  ChestScreen.id,
  HipScreen.id,
  LowerLegScreen.id,
  PosteriorThighScreen.id,
  ShoulderScreen.id,
  UpperArmScreen.id
];

List<String> kExerciseCategoryImageNames = [
  'abdominals.png',
  'thigh.png',
  'back.png',
  'chest.png',
  'hip.png',
  'leg.png',
  'thigh.png',
  'shoulder.png',
  'arm.png'
];

const kTextFieldDecoration = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: kBrandColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: kBrandColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

BoxDecoration topImage({required String imageName}) {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage('images/$imageName'),
      fit: BoxFit.cover,
    ),
  );
}