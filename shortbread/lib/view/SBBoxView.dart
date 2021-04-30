import 'package:flutter/material.dart';

class SBBoxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Box",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
