import 'package:flutter/material.dart';
import 'package:shortbread/view/BoxView.dart';
import 'package:shortbread/view/ExpandedSpace.dart';

class BoxListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          BoxView(),
          BoxView(),
          ExpandedSpace(),
        ],
      ),
    );
  }
}
