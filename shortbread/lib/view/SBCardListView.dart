import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ColumnSpaceLayoutView.dart';

class SBCardListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ColumnSpaceLayoutView(
        [],
        4,
        2,
        2,
      ),
    );
  }
}
