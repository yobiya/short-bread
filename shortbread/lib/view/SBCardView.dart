import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SBCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Card',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Path',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      ]),
    );
  }
}
