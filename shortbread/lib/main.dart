import 'package:flutter/material.dart';
import 'common/utility/Delegate.dart';
import 'controller/box/SBBoxViewController.dart';
import 'controller/card/SBCardViewController.dart';
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
  final FileModel _fileModel = FileModel();
  SBBoxModel _boxModel;
  SBCardModel _cardModel;

  _MainPageState() {
    _boxModel = SBBoxModel(_fileModel);
    _cardModel = SBCardModel(_fileModel);
  }

  @override
  Widget build(BuildContext context) {
    final boxDataCollection = _boxModel.getDataCollection();
    final startSelectedBoxId = boxDataCollection.isEmpty ? SBBoxModel.invalidId : boxDataCollection.first.id;
    final cardDataCollection = _cardModel.getDataCollection(startSelectedBoxId);
    final startSelectedCardId = cardDataCollection.isEmpty ? SBCardModel.invalidId : cardDataCollection.first.id;

    final onChangedBoxId = Delegate<int>();

    final boxViewControllerDeleagets = SBBoxViewControllerDelegates(onChangedBoxId);
    final sbBoxViewController = SBBoxViewController(boxViewControllerDeleagets, _boxModel, startSelectedBoxId);

    final cardViewControllerDelegates = SBCardViewControllerDelegates(onChangedBoxId);
    final sbCardViewController = SBCardViewController(cardViewControllerDelegates, _cardModel, startSelectedBoxId, startSelectedCardId);

    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: sbBoxViewController),
          VerticalDivider(),
          Expanded(child: sbCardViewController),
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
