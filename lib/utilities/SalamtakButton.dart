import 'package:flutter/material.dart';

class SalamtakButton extends StatelessWidget {
  final String? buttonText;
  final Function? onpressed;
  final Color? colors;

  const SalamtakButton(
      {Key? key, this.buttonText, this.onpressed, this.colors = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: -1,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          primary: this.colors,
          elevation: 5,
        ),
        child: Text(
          this.buttonText!,
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          onpressed!();
        },
      ),
    );
  }
}
