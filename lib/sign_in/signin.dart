import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_project/sign_in/components/email_widget.dart';
import 'package:food_project/sign_in/components/password_widget.dart';
import 'package:food_project/sign_in/components/signin_social.dart';
import 'package:food_project/sign_in/home_page.dart';

import 'components/back_widget.dart';
import 'components/signin_widget.dart';
import 'dialog.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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
            'Sign in with your email or phone munber',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
      );
    }

    Widget buildEmailPhone() {
      return const EmailWidget(hintText: 'Email');
    }

    Widget buildPassword() {
      return PasswordWidget(
        hintText: 'Enter Your Password',
        onTap: () {
          _obscureText = !_obscureText;
          setState(() {});
        },
        obscureText: _obscureText,
      );
    }

    Widget buildForgetPassword() {
      return Container(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          onPressed: () => print('Forget password?'),
          child: const Text(
            'Forget password?',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      );
    }

    Widget buildSignin() {
      return SigninWidget (onTap:  () async {
        final result = await createUserWithEmailAndPassword();
        if(result){
         Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        }else(
          // Navigator.push(context, MaterialPageRoute(builder: (context) => AlertDialogExampleApp()))
        );
      },);
    }

    Widget buildGmail() {
      return const SigninSocial(
        image: "assets/gmail.svg",
        content: 'Sign in with Gmail',
      );
    }

    Widget buildFacebook() {
      return const SigninSocial(
        image: "assets/Facebook.svg",
        content: 'Sign in with Facebook',
      );
    }

    Widget buildApple() {
      return const SigninSocial(
        image: "assets/Apple.svg",
        content: 'Sign in with Apple',
      );
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
        buildPassword(),
        buildForgetPassword(),
        const SizedBox(
          height: 30,
        ),
        buildSignin(),
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          child: const Text(
            '--------------------------or--------------------------',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        buildGmail(),
        const SizedBox(
          height: 20,
        ),
        buildFacebook(),
        const SizedBox(
          height: 20,
        ),
        buildApple(),
        const SizedBox(
          height: 20,
        ),
        buildEnd(),
      ],
    ));
  }
}
