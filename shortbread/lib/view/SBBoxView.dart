import 'package:flutter/material.dart';

class SBBoxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Box",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Description",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      ]),
    );
  }
}
