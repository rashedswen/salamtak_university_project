import 'package:flutter/material.dart';

class SalamtakSettingsButtons extends StatelessWidget {
  const SalamtakSettingsButtons({
    Key? key,
    @required this.title,
    this.subTitle,
    this.icon,
  }) : super(key: key);

  final String? title;
  final String? subTitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      subTitle!,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
