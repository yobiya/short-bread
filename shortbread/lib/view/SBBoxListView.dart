import 'package:flutter/material.dart';
import 'package:shortbread/view/SBBoxView.dart';
import 'package:shortbread/view/ExpandedSpace.dart';

class SBBoxListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: _buildSBBoxesColumn(),
    );
  }

  Column _buildSBBoxesColumn() {
    var contents = <Widget>[];

    contents.add(SBBoxView());
    contents.add(SBBoxView());
    contents.add(ExpandedSpace());

    return Column(children: contents);
  }
}
