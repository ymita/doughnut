import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SearchState();
  }
}

class SearchState extends State<Search> {
  final TextEditingController _controller = new TextEditingController();

  List<SearchResult> _searchResults = [];

  Future<List<SearchResult>> fetchWords(String query) async {

    final firstChar = query[0];
    final loadedFile = await rootBundle.loadString('assets/$firstChar.json');
    final json = new JsonDecoder().convert(loadedFile);
    final list = new List<SearchResult>();

    (json as Map<String, dynamic>).forEach((key, value) {
      if(key.toLowerCase().startsWith(query)){
        list.add(new SearchResult(
          word: value["word"],
          englishSentence: value["wordset_id"])
        );
      }
    });

    return list;
  }

  void _search(String inputValue) {
    if (inputValue.isEmpty) { return; }

    final String query = inputValue.toLowerCase();
    this.fetchWords(query).then((_list) {
      setState(() {
        _searchResults = _list.where((item) {
          return item.word.toLowerCase().startsWith(query) ? true : false;
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new TextField(
          controller: _controller,
          decoration: new InputDecoration(hintText: 'Type word'),
          onSubmitted: _search
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
