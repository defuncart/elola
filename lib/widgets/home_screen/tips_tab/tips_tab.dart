import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:elola/localizations.dart';
import 'package:elola/widgets/home_screen/content_tab.dart';

class TipsTab extends StatelessWidget {
  const TipsTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentTab(
      title: AppLocalizations.tipsTabTitle,
      child: Html(
        data: """
<div>
  <h1>Demo Page</h1>
  <p>This is a fantastic nonexistent product that you should buy!</p>
  <h2>Pricing</h2>
  <p>Lorem ipsum <b>dolor</b> sit amet.</p>
  <h2>The Team</h2>
  <p>There isn't <i>really</i> a team...</p>
  <h2>Installation</h2>
  <p>You <u>cannot</u> install a nonexistent product!</p>
  <table style="width:100%">
    <tr>
      <th></th>
      <th>Masculine</th>
      <th>Feminine</th> 
      <th>Neuter</th>
    </tr>
    <tr>
      <th>Singular</th>
      <td>el</td>
      <td>la</td>
      <td>lo</td>
    </tr>
    <tr>
      <th>Plural</th>
      <td>los</td>
      <td>las</td>
      <td>-</td>
    </tr>
  </table>
</div>
      """,
      ),
    );
  }
}
