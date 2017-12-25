import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SearchState();
  }
}

class SearchState extends State<Search> {
  final TextEditingController _controller = new TextEditingController();

  List<SearchResult> _searchResults;

  @override
  void initState() {
    super.initState();

    _searchResults = new List<SearchResult>();

    for (var i = 0; i < 100; i++) {
      _searchResults.add(new SearchResult(
        word: 'word$i',
        englishSentence: 'englishSentence $i',
        japaneseSentence: '日本語文 $i'
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new TextField(
          controller: _controller,
          decoration: new InputDecoration(hintText: 'Type word'),
        ),
        new Expanded(
          child: new ListView(
            children: _searchResults.map((SearchResult searchResult) {
              return new ListTile(
                leading: const Icon(Icons.assignment_ind),
                title: new Text(searchResult.word),
                trailing: new IconButton(
                  icon: new Icon(Icons.volume_up),
                  tooltip: searchResult.englishSentence,
                  onPressed: () {
                    print(searchResult.japaneseSentence);
                  }
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}

class SearchResult {
  const SearchResult({this.word, this.englishSentence, this.japaneseSentence});

  final String word;
  final String englishSentence;
  final String japaneseSentence;
}
