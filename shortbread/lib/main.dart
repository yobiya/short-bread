import 'package:flutter/material.dart';
import 'controller/box/SBBoxController.dart';
import 'controller/card/SBCardController.dart';

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
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  final SBCardController sbCardController = SBCardController();

  MainPage({Key key}) : super(key: key);

  @override
  _MainPageController createState() => _MainPageController();
}

class _MainPageController extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var sbBoxControllerView = SBBoxControllerView();

    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: sbBoxControllerView),
          VerticalDivider(),
          Expanded(child: widget.sbCardController.createView(1)),
          VerticalDivider(),
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
