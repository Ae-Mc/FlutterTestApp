import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpaceElementWidget extends StatelessWidget {
  final TextStyle font;
  final String firstWord, secondWord;

  SpaceElementWidget(this.firstWord, this.secondWord, {this.font});

  @override
  Widget build(BuildContext context) {
    final w700 = TextStyle(fontWeight: FontWeight.w700);

    return RichText(
      text: TextSpan(style: Theme.of(context).textTheme.headline6, children: [
        TextSpan(style: font, children: [
          TextSpan(text: firstWord, style: w700),
          TextSpan(text: secondWord)
        ])
      ]),
    );
  }
}