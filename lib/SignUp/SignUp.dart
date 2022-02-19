import 'package:flutter/material.dart';
import 'package:salamtak_university_project/Api/auth.dart';
import 'package:salamtak_university_project/utilities/topClipper.dart';

import 'SignUpForm.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SalamtakAppBar(
        height: MediaQuery.of(context).size.height * 0.16,
      ),
      backgroundColor: Colors.black,
      body: SignupForm(),
    );
  }
}
