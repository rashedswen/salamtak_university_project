import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SalamtakTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? label;
  final Icon? iconData;
  final bool? isPassword;
  final bool? isEnabled;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;

  const SalamtakTextField({
    Key? key,
    this.textEditingController,
    this.label,
    this.iconData,
    this.isPassword = false,
    this.isEnabled = false,
    this.textInputAction = TextInputAction.next,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: TextFormField(
          validator: this.validator,
          textInputAction: textInputAction,
          readOnly: this.isEnabled!,
          controller: this.textEditingController,
          decoration: InputDecoration(
            labelText: this.label,
            prefixIcon: this.iconData,
            hintStyle: TextStyle(
              color: Colors.black,
            ),
          ),
          obscureText: this.isPassword!,
          enableSuggestions: this.isPassword! ? false : true,
        ),
      ),
    );
  }
}
