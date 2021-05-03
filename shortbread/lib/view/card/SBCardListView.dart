import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/common/utility/CollectionUtility.dart';
import 'package:shortbread/data/card/SBCardData.dart';
import 'package:shortbread/view/card/SBNoteCardView.dart';
import 'package:shortbread/common/definition/CardDefinitions.dart';

class SBCardListView extends StatelessWidget {
  final Iterable<SBCardBaseData> _dataCollection;
  final int _selectedId;
  final void Function(int) _onSelectCard;
  final void Function() _onCreateNoteCard;
  final void Function(SBNoteCardData) _onEditNoteCard;

  SBCardListView(
    this._dataCollection,
    this._selectedId,
    this._onSelectCard,
    this._onCreateNoteCard,
    this._onEditNoteCard,
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
        itemBuilder: buildCreateCardMenuItem,
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
      return SBNoteCardView(data, selected, onSelect, () => _onEditNoteCard(data));
    }

    return Container();
  }

  List<PopupMenuItem<String>> buildCreateCardMenuItem(BuildContext context) {
    return <PopupMenuItem<String>>[
      PopupMenuItem<String>(
        value: SBCardTypes.note,
        child: Text('Note card'),
      ),
    ];
  }

  void _onSelectedCreateCardMenuItem(String cardType) {
    switch (cardType) {
      case SBCardTypes.note:
        _onCreateNoteCard();
        break;
    }
  }
}
