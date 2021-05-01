import 'package:flutter/material.dart';
import 'controller/box/SBBoxController.dart';
import 'view-data/card/SBCardViewData.dart';
import 'view/card/SBCardListView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  final SBBoxController sbBoxController = SBBoxController();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var cardViewData = <SBCardViewData>[
      SBCardViewData('Card1', 'Path1'),
      SBCardViewData('Card2', 'Path2'),
      SBCardViewData('Card3', 'Path3'),
      SBCardViewData('Card4', 'Path4'),
      SBCardViewData('Card5', 'Path5'),
    ];

    var dividerTheme = Theme.of(context).dividerTheme;
    var divider = VerticalDivider(
      color: dividerTheme.color,
      thickness: dividerTheme.thickness,
      indent: dividerTheme.indent,
      endIndent: dividerTheme.endIndent,
    );

    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: widget.sbBoxController.createView()),
          divider,
          Expanded(child: SBCardListView(cardViewData)),
          divider,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
