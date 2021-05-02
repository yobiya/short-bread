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
      title: 'Flutter Demo',
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
    _cardModel = SBCardModel();
  }

  @override
  Widget build(BuildContext context) {
    var boxDataCollection = _boxModel.getDataCollection();
    int startSelectedBoxId = boxDataCollection.isEmpty ? 0 : boxDataCollection.first.id;

    var onChangedBoxId = Delegate<int>();

    var boxControllerDeleagets = SBBoxControllerDeleagets(onChangedBoxId);
    var sbBoxControllerView = SBBoxControllerView(boxControllerDeleagets, _boxModel, startSelectedBoxId);

    var cardControllerDelegates = SBCardControllerDelegates(onChangedBoxId);
    var sbCardControllerView = SBCardControllerView(cardControllerDelegates, _cardModel, startSelectedBoxId);

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
