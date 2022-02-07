import 'package:flutter/material.dart';
import 'common/utility/Delegate.dart';
import 'controller/SBBoxListViewController.dart';
import 'controller/SBCardListViewController.dart';
import 'model/FileModel.dart';
import 'model/box/SBBoxModel.dart';
import 'model/card/SBCardModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Short bread',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _onChangedBoxId = Delegate<int>();
  final FileModel _fileModel = FileModel();
  SBBoxModel _boxModel;
  SBCardModel _cardModel;
  SBBoxListViewController _boxListViewController;
  SBCardListViewController _cardListViewController;

  _MainPageState() {
    _boxModel = SBBoxModel(_fileModel);
    _cardModel = SBCardModel(_fileModel);

    final boxDataCollection = _boxModel.getDataCollection();
    final startSelectedBoxId = boxDataCollection.isEmpty ? SBBoxModel.invalidId : boxDataCollection.first.id;

    var refreshView = () => setState(() => {});
    _boxListViewController = SBBoxListViewController(
      _boxModel,
      startSelectedBoxId,
      refreshView,
      _onChangedBoxId.call,
    );

    _cardListViewController = SBCardListViewController(
      _cardModel,
      startSelectedBoxId,
      refreshView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: _boxListViewController.build(context)),
          VerticalDivider(),
          Expanded(child: _cardListViewController.build(context)),
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
