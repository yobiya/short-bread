import 'package:flutter/widgets.dart';

class ColumnSpaceLayoutView extends StatelessWidget {
  final List<Widget> _contents;
  final double _space;
  final double _paddingLeft;
  final double _paddingRight;

  ColumnSpaceLayoutView(this._contents, this._space, this._paddingLeft, this._paddingRight);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];

    for (int i = 0; i < _contents.length; i++) {
      if (i == 0) {
        // 最初の要素
        children.add(Padding(
          padding: EdgeInsets.fromLTRB(_paddingLeft, _space, _paddingRight, _space),
          child: _contents[i],
        ));
      } else if (i == _contents.length - 1) {
        // 最後の要素
        children.add(Padding(
          padding: EdgeInsets.fromLTRB(_paddingLeft, 0, _paddingRight, _space),
          child: _contents[i],
        ));
      } else {
        children.add(Padding(
          padding: EdgeInsets.fromLTRB(_paddingLeft, _space, _paddingRight, 0),
          child: _contents[i],
        ));
      }
    }

    children.add(Expanded(child: Container()));

    return Column(children: children);
  }
}
