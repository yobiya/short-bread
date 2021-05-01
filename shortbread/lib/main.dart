import 'package:flutter/material.dart';

import 'model/box/SBBoxModel.dart';
import 'view-data/card/SBCardViewData.dart';
import 'view/box/SBBoxListView.dart';
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
      home: MyHomePage(title: 'Short-bread'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var boxModel = SBBoxModel();

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
          Expanded(child: SBBoxListView(boxModel.getViewData())),
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
