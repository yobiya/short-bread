import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/view/SBCardView.dart';
import 'ColumnSpaceLayoutView.dart';

class SBCardListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ColumnSpaceLayoutView(
        [
          SBCardView(),
          SBCardView(),
          SBCardView(),
          SBCardView(),
        ],
        4,
        2,
        2,
      ),
    );
  }
}
