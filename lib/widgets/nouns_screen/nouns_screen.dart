import 'package:elola/extensions/category_extensions.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/widgets/common/tiles/noun_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NounsScreen extends StatelessWidget {
  final String title;

  const NounsScreen({this.title, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nounsDatabase = Provider.of<INounDatabase>(context);

    return Scaffold(
      appBar: AppBar(
        title: title != null ? Text(title) : null,
      ),
      body: SafeArea(
        child: ListView.builder(
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
        for (final noun in nouns) NounTile(noun: noun),
      ],
      initiallyExpanded: initiallyExpanded,
    );
  }
}
