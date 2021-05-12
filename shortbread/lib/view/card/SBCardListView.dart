import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/common/utility/CollectionUtility.dart';
import 'package:shortbread/data/card/SBCardData.dart';
import 'package:shortbread/view/card/SBFolderCardView.dart';
import 'package:shortbread/view/card/SBNoteCardView.dart';
import 'package:shortbread/common/definition/CardDefinitions.dart';
import 'package:shortbread/view/card/SBUrlCardView.dart';

class SBCardListView extends StatelessWidget {
  final Iterable<SBCardBaseData> _dataCollection;
  final int _selectedId;
  final void Function(int) _onSelectCard;
  final void Function() _onCreateNoteCard;
  final void Function(SBNoteCardData) _onEditNoteCard;
  final void Function() _onCreateUrlCard;
  final void Function(SBUrlCardData) _onEditUrlCard;
  final void Function() _onCreateFolderCard;
  final void Function(SBFolderCardData) _onEditFolderCard;
  final void Function(SBCardBaseData) _onDeleteCard;
  final Future<bool> Function(String) _onOpenBrowser;
  final Future<bool> Function(String) _onOpenFolder;

  SBCardListView(
    this._dataCollection,
    this._selectedId,
    this._onSelectCard,
    this._onCreateNoteCard,
    this._onEditNoteCard,
    this._onCreateUrlCard,
    this._onEditUrlCard,
    this._onCreateFolderCard,
    this._onEditFolderCard,
    this._onDeleteCard,
    this._onOpenBrowser,
    this._onOpenFolder,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Scrollbar(
          child: ListView(
            padding: EdgeInsets.all(8),
            children: _buildContents(),
          ),
        ),
      ),
      floatingActionButton: PopupMenuButton<String>(
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: null,
        ),
        padding: EdgeInsets.zero,
        onSelected: _onSelectedCreateCardMenuItem,
        itemBuilder: buildCreateCardMenuItemList,
      ),
    );
  }

  List<Widget> _buildContents() {
    var boxViewCollection = _dataCollection.map(
      (data) => buildCardView(
        data,
        (_selectedId == data.id),
        () => _onSelectCard(data.id),
      ),
    );

    return CollectionUtility.insertBetweenAll(
      boxViewCollection,
      Container(height: 8),
    ).toList();
  }

  Widget buildCardView(SBCardBaseData data, bool selected, void Function() onSelect) {
    if (data is SBNoteCardData) {
      var delegates = SBNoteCardViewDelegates(
        onSelect,
        () => _onEditNoteCard(data),
        () => _onDeleteCard(data),
      );

      return SBNoteCardView(
        data,
        selected,
        delegates,
      );
    }

    if (data is SBUrlCardData) {
      var delegates = SBUrlCardViewDelegates(
        onSelect,
        () => _onEditUrlCard(data),
        () => _onDeleteCard(data),
        () => _onOpenBrowser(data.url),
      );

      return SBUrlCardView(
        data,
        selected,
        delegates,
      );
    }

    if (data is SBFolderCardData) {
      var delegates = SBFolderCardViewDelegates(
        onSelect,
        () => _onEditFolderCard(data),
        () => _onDeleteCard(data),
        () => _onOpenFolder(data.path),
      );

      return SBFolderCardView(
        data,
        selected,
        delegates,
      );
    }

    return Container();
  }

  List<PopupMenuItem<String>> buildCreateCardMenuItemList(BuildContext context) {
    return <PopupMenuItem<String>>[
      PopupMenuItem<String>(
        value: SBCardTypes.note,
        child: Text('Note card'),
      ),
      PopupMenuItem<String>(
        value: SBCardTypes.url,
        child: Text('URL card'),
      ),
      PopupMenuItem<String>(
        value: SBCardTypes.folder,
        child: Text('Folder card'),
      ),
    ];
  }

  void _onSelectedCreateCardMenuItem(String cardType) {
    switch (cardType) {
      case SBCardTypes.note:
        _onCreateNoteCard();
        break;
      case SBCardTypes.url:
        _onCreateUrlCard();
        break;
      case SBCardTypes.folder:
        _onCreateFolderCard();
        break;
    }
  }
}
