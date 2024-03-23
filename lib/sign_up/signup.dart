import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/back_widget.dart';
import 'components/password_widget.dart';
import 'components/signup_widget.dart';
import 'components/text_font_filed_widget.dart';
import 'dialog.dart';
import 'home_page.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String msg = '';
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<bool> createUserWithEmailAndPassword() async {
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      if (result.user != null) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget buildBack() {
      return const BackWidget();
    }

    Widget buildLetter() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          alignment: Alignment.bottomLeft,
          child: const Text(
            'Sign up with your email or phone munber',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
      );
    }

    Widget buildEmailPhone() {
      return const TextFontFieldWidget(hintText: 'Email');
    }

    Widget buildFullName() {
      return const TextFontFieldWidget(hintText: 'Full Name');
    }

    Widget buildPassword() {
      return PasswordWidget(
        hintText: 'Password',
        onTap: () {
          _obscureText = !_obscureText;
          setState(() {});
        },
        obscureText: _obscureText,
      );
    }

    Widget buildConnfirmPassword() {
      return PasswordWidget(
        hintText: 'Confirm Password',
        onTap: () {
          _obscureText = !_obscureText;
          setState(() {});
        },
        obscureText: _obscureText,
      );
    }

    Widget buildSignup() {
      return SignupWidget (onTap:  () async {
        final result = await createUserWithEmailAndPassword();
        if(result){
         Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        }else(
          // Navigator.push(context, MaterialPageRoute(builder: (context) => AlertDialogExampleApp()))
        );
      },);
    }

    Widget buildEnd() {
      return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Already have an account?'),
          Text(
            ' Sign in',
            style: TextStyle(color: Colors.green),
          )
        ],
      );
    }

    return Scaffold(
        body: ListView(
      key: _formKey,
      children: [
        buildBack(),
        const SizedBox(
          height: 30,
        ),
        buildLetter(),
        const SizedBox(
          height: 30,
        ),
        buildEmailPhone(),
        const SizedBox(
          height: 30,
        ),
        buildFullName(),
        const SizedBox(
          height: 30,
        ),
        buildPassword(),
        const SizedBox(
          height: 30,
        ),
        // buildConnfirmPassword(),
        const SizedBox(
          height: 30,
        ),
        buildSignup(),
        buildEnd(),
      ],
    ));
  }
}
