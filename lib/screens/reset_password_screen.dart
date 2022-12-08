import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/auth.dart';
import '../constants.dart';
import '../components/rounded_button.dart';
import 'package:hypertrophy_app/components/widget_tree.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  static String id = 'reset_password_page';

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  String? errorMessage = '';
  bool resetDone = false;
  Icon emailIcon = const Icon(Icons.email);

  final TextEditingController _controllerEmail = TextEditingController();

  Future<void> resetPassword() async {
    try {
      await Auth().sendPasswordResetEmail(
        email: _controllerEmail.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Scaffold resetDoneMessage() {
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: double.infinity,
          width: currentWidth < kMobileWidth ? double.infinity : currentWidth / 1.5,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: SizedBox(
                  width: double.infinity,
                  height: 250.0,
                  child: Image.asset('images/personal_email.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              const Text(
                'Check your email inbox or spam folder for the password reset link',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Flexible(
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, WidgetTree.id);
                  },
                  child: const Text('Go home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Scaffold resetPage() {
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: double.infinity,
          width: currentWidth < kMobileWidth ? double.infinity : 500,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: SizedBox(
                  width: double.infinity,
                  height: 250.0,
                  child: Image.asset('images/hiking.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _controllerEmail,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                  prefixIcon: emailIcon,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(errorMessage ?? ''),
              Flexible(
                child: RoundedButton(
                  color: kBrandAccentColor,
                  textColor: Colors.white,
                  onPressed: () {
                    resetPassword();
                    setState(() {
                      resetDone = !resetDone;
                    });
                  },
                  title: 'Reset password',
                ),
              ),
              Flexible(
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Log in instead'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return resetDone ? resetDoneMessage() : resetPage();
  }
}
