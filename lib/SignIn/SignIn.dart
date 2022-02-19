import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salamtak_university_project/Api/auth.dart';
import 'package:salamtak_university_project/utilities/topClipper.dart';

import 'SignInForm.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SalamtakAppBar(
        height: MediaQuery.of(context).size.height * 0.16,
      ),
      backgroundColor: Colors.black,
      body: SigninForm(
      ),
    );
  }
}
