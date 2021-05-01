import 'package:flutter/widgets.dart';

class ColumnSpaceLayoutView extends StatelessWidget {
  final Iterable<Widget> _contents;
  final double _space;
  final double _paddingLeft;
  final double _paddingRight;

  ColumnSpaceLayoutView(this._contents, this._space, this._paddingLeft, this._paddingRight);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];

    double topPadding = _space;
    for (var content in _contents) {
      children.add(Padding(
        padding: EdgeInsets.fromLTRB(_paddingLeft, topPadding, _paddingRight, _space),
        child: content,
      ));

      topPadding = 0;
    }

    children.add(Expanded(child: Container()));

    return Column(children: children);
  }
}
