import 'package:flutter/material.dart';
import 'package:hypertrophy_app/screens/login_register_screen.dart';
import 'package:hypertrophy_app/screens/splash_screen.dart';
import 'screens/category_screens/abdominals_screen.dart';
import 'screens/category_screens/anterior_thigh_screen.dart';
import 'screens/category_screens/back_screen.dart';
import 'screens/category_screens/chest_screen.dart';
import 'screens/category_screens/hip_screen.dart';
import 'screens/category_screens/lower_leg_screen.dart';
import 'screens/category_screens/posterior_thigh_screen.dart';
import 'screens/category_screens/shoulder_screen.dart';
import 'screens/category_screens/upper_arm_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'components/widget_tree.dart';
import 'screens/reset_password_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const HypertrophyApp());
}

class HypertrophyApp extends StatelessWidget {
  const HypertrophyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Personal Trainer',
      initialRoute: SplashPage.id,
      routes: {
        AbdominalsScreen.id : (context) => const AbdominalsScreen(),
        AnteriorThighScreen.id : (context) => const AnteriorThighScreen(),
        BackScreen.id : (context) => const BackScreen(),
        ChestScreen.id : (context) => const ChestScreen(),
        HipScreen.id : (context) => const HipScreen(),
        LowerLegScreen.id : (context) => const LowerLegScreen(),
        PosteriorThighScreen.id : (context) => const PosteriorThighScreen(),
        ShoulderScreen.id : (context) => const ShoulderScreen(),
        UpperArmScreen.id : (context) => const UpperArmScreen(),
        WidgetTree.id : (context) => const WidgetTree(),
        LoginAndRegisterPage.id : (context) => const LoginAndRegisterPage(),
        ResetPassword.id : (context) => const ResetPassword(),
        SplashPage.id : (context) => const SplashPage(),
      },
    );
  }
}
