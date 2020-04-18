import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elola/enums/category.dart';
import 'package:elola/models/noun.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/widgets/common/buttons/favorite_noun_button.dart';
import 'package:elola/widgets/common/buttons/listen_noun_button.dart';

class NounsScreen extends StatelessWidget {
  const NounsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nounsDatabase = Provider.of<INounDatabase>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Category.values.length,
          itemBuilder: (_, index) {
            final category = Category.values[index];
            final nouns = nounsDatabase.getNouns(category: category);
            nouns.sort((a, b) => a.withoutArticle.compareTo(b.withoutArticle));

            return _CategoryTile(
              category: category,
              nouns: nouns,
              initiallyExpanded: index == 0,
            );
          },
        ),
      ),
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
        for (final noun in nouns)
          ListTile(
            leading: Text(
              noun.emoji,
              style: TextStyle(fontSize: 40),
            ),
            title: Text(noun.inFull),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                NounListenButton(noun: noun),
                FavoriteListenButton(noun: noun),
              ],
            ),
          ),
      ],
      initiallyExpanded: initiallyExpanded,
    );
  }
}
