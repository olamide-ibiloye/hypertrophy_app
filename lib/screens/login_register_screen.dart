import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/auth.dart';
import '../constants.dart';
import '../components/rounded_button.dart';
import 'package:hypertrophy_app/screens/reset_password_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginAndRegisterPage extends StatefulWidget {
  const LoginAndRegisterPage({Key? key}) : super(key: key);

  static String id = 'login_page';

  @override
  State<LoginAndRegisterPage> createState() => _LoginAndRegisterPageState();
}

class _LoginAndRegisterPageState extends State<LoginAndRegisterPage> {
  String? errorMessage = '';
  bool isLogin = true;
  bool showSpinner = false;

  final TextEditingController _controllerFullName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Column loginForm() {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.emailAddress,
          controller: _controllerEmail,
          decoration: kTextFieldDecoration.copyWith(
            hintText: 'Enter your email',
            prefixIcon: const Icon(Icons.email),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        TextField(
          obscureText: true,
          controller: _controllerPassword,
          decoration: kTextFieldDecoration.copyWith(
            hintText: 'Enter your password',
            prefixIcon: const Icon(Icons.password),
          ),
        )
      ],
    );
  }

  Column registerForm() {
    return Column(
      children: [
        TextField(
          controller: _controllerFullName,
          decoration: kTextFieldDecoration.copyWith(
            hintText: 'Enter your full name',
            prefixIcon: const Icon(Icons.supervised_user_circle),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        TextField(
          keyboardType: TextInputType.emailAddress,
          controller: _controllerEmail,
          decoration: kTextFieldDecoration.copyWith(
            hintText: 'Enter your email',
            prefixIcon: const Icon(Icons.email),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        TextField(
          obscureText: true,
          controller: _controllerPassword,
          decoration: kTextFieldDecoration.copyWith(
            hintText: 'Enter your password',
            prefixIcon: const Icon(Icons.password),
          ),
        )
      ],
    );
  }


  Future<void> signInWithEmailAndPassword() async {
    try {
      setState(() {
        showSpinner = !showSpinner;
      });

      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );

      setState(() {
        showSpinner = !showSpinner;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
        showSpinner = !showSpinner;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      setState(() {
        showSpinner = !showSpinner;
      });

      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );

      setState(() {
        showSpinner = !showSpinner;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
        showSpinner = !showSpinner;
      });
    }
  }

  @override
  void dispose() {
    _controllerPassword;
    _controllerEmail;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        progressIndicator: const CircularProgressIndicator(
          color: kBrandAccentColor,
        ),
        child: Center(
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
                    height: 200.0,
                    child: Image.asset(isLogin
                        ? 'images/indoor_bike.png'
                        : 'images/personal_trainer.png'),
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                isLogin ? loginForm() : registerForm(),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, ResetPassword.id);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text('Forgot password?'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(errorMessage ?? ''),
                Flexible(
                  child: RoundedButton(
                    color: kBrandAccentColor,
                    textColor: Colors.white,
                    onPressed: isLogin
                        ? signInWithEmailAndPassword
                        : createUserWithEmailAndPassword,
                    title: isLogin ? 'Login' : 'Register',
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
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child:
                        Text(isLogin ? 'New user? Register now' : 'Login instead'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
