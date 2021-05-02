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
  final SBBoxController sbBoxController = SBBoxController();
  final SBCardController sbCardController = SBCardController();

  MainPage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState(sbBoxController.selectedId);
}

class _MyHomePageState extends State<MainPage> {
  int _selectedBoxId;

  _MyHomePageState(int selectedBoxId) {
    _selectedBoxId = selectedBoxId;
  }

  @override
  Widget build(BuildContext context) {
    widget.sbBoxController.showDialog = _showDialog;
    widget.sbBoxController.closeDialog = _closeDialog;
    widget.sbBoxController.onChangedSelectedBox = _changeSelectedBox;

    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: widget.sbBoxController.buildView()),
          VerticalDivider(),
          Expanded(child: widget.sbCardController.createView(_selectedBoxId)),
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

  void _showDialog(WidgetBuilder dialogBuilder) {
    showDialog(context: context, builder: dialogBuilder);
  }

  void _closeDialog() {
    Navigator.of(context).pop(context);
  }

  void _changeSelectedBox(int boxId) {
    setState(() {
      _selectedBoxId = boxId;
    });
  }
}
