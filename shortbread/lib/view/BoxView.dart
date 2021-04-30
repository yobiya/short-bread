import 'package:flutter/material.dart';

class BoxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
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
