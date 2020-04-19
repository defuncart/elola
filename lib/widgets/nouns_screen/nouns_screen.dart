import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elola/enums/category.dart';
import 'package:elola/models/noun.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/widgets/common/buttons/noun_favorite_button.dart';
import 'package:elola/widgets/common/buttons/noun_listen_button.dart';

class NounsScreen extends StatelessWidget {
  final List<Noun> nouns;
  final String title;

  const NounsScreen({this.nouns, this.title, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title != null ? Text(title) : null,
      ),
      body: SafeArea(
        child: nouns != null && nouns.length > 0 ? _NounsList(nouns: nouns) : _CategoryList(),
      ),
    );
  }
}

class _NounsList extends StatelessWidget {
  final List<Noun> nouns;

  const _NounsList({@required this.nouns, Key key})
      : assert(nouns != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: nouns.length,
      itemBuilder: (_, index) {
        nouns.sort((a, b) => a.withoutArticle.compareTo(b.withoutArticle));

        return _NounTile(
          noun: nouns[index],
        );
      },
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nounsDatabase = Provider.of<INounDatabase>(context);
    return ListView.builder(
      itemCount: Category.values.length,
      itemBuilder: (_, index) {
        final category = Category.values[index];
        final nouns = nounsDatabase.getNounsByCategory(category);
        nouns.sort((a, b) => a.withoutArticle.compareTo(b.withoutArticle));

        return _CategoryTile(
          category: category,
          nouns: nouns,
          initiallyExpanded: index == 0,
        );
      },
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final Category category;
  final Iterable<Noun> nouns;
  final bool initiallyExpanded;

  const _CategoryTile({
    @required this.category,
    @required this.nouns,
    @required this.initiallyExpanded,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: PageStorageKey(category.toString()),
      title: Text(category.localizedName),
      children: <Widget>[
        for (final noun in nouns) _NounTile(noun: noun),
      ],
      initiallyExpanded: initiallyExpanded,
    );
  }
}

class _NounTile extends StatelessWidget {
  final Noun noun;

  const _NounTile({
    Key key,
    @required this.noun,
  })  : assert(noun != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        noun.emoji,
        style: TextStyle(fontSize: 40),
      ),
      title: Text(noun.inFull),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          NounListenButton(noun: noun),
          NounFavoriteButton(noun: noun),
        ],
      ),
    );
  }
}
