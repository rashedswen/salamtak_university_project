import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salamtak_university_project/SignIn/SignIn.dart';
import 'package:salamtak_university_project/utilities/SalamtakButton.dart';
import 'package:salamtak_university_project/utilities/textFieldSalamtak.dart';

import '../Api/auth.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    Key? key,
  }) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthServices>(context);
    return LayoutBuilder(
      builder: (context, size) => SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Card(
            color: Color(0xff232323),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.maxHeight * 0.08,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: SalamtakTextField(
                    label: 'id_number',
                    iconData: Icon(Icons.perm_identity),
                    textEditingController: _emailController,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: SalamtakTextField(
                    label: 'full name',
                    iconData: Icon(Icons.perm_identity),
                    textEditingController: _fullNameController,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: SalamtakTextField(
                    label: 'address',
                    iconData: Icon(Icons.perm_identity),
                    textEditingController: _addressController,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: SalamtakTextField(
                    label: 'age',
                    iconData: Icon(Icons.perm_identity),
                    textEditingController: _ageController,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SalamtakTextField(
                    label: 'password',
                    iconData: Icon(Icons.lock),
                    textEditingController: _passwordController,
                    isPassword: true,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                      if (value.length <= 7) {
                        return 'password length too short';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already have account',
                      ),
                      TextButton(onPressed: () {}, child: const Text('Sign Up'))
                    ],
                  ),
                ),
                loading
                    ? const CircularProgressIndicator()
                    : SalamtakButton(
                        buttonText: 'Sign up',
                        onpressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => loading = true);
                            dynamic result = await user.signup(
                                _emailController.text,
                                _passwordController.text,
                                _fullNameController.text,
                                _addressController.text,
                                _ageController.text);
                            if (result == null) {
                              setState(() {
                                loading = false;
                                error =
                                    'Could not sign in with those credentials';
                              });
                            }
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
