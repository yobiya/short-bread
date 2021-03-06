import 'package:flutter/material.dart';
import 'common/utility/Delegate.dart';
import 'controller/box/SBBoxController.dart';
import 'controller/card/SBCardController.dart';
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
  _MainPageController createState() => _MainPageController();
}

class _MainPageController extends State<MainPage> {
  final FileModel _fileModel = FileModel();
  SBBoxModel _boxModel;
  SBCardModel _cardModel;

  _MainPageController() {
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

    final boxControllerDeleagets = SBBoxControllerDeleagets(onChangedBoxId);
    final sbBoxControllerView = SBBoxControllerView(boxControllerDeleagets, _boxModel, startSelectedBoxId);

    final cardControllerDelegates = SBCardControllerDelegates(onChangedBoxId);
    final sbCardControllerView = SBCardControllerView(cardControllerDelegates, _cardModel, startSelectedBoxId, startSelectedCardId);

    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: sbBoxControllerView),
          VerticalDivider(),
          Expanded(child: sbCardControllerView),
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
