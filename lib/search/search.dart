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
  var loadedFile;
  List<SearchResult> _searchResults;

    Future<List<SearchResult>> loadAsset() async {
      
      loadedFile = await rootBundle.loadString('assets/a.json');
      final json = new JsonDecoder().convert(loadedFile);
      var list = new List<SearchResult>();

      (json as Map<String, dynamic>).forEach((key, value){
        print(value);
        list.add(new SearchResult(
          word: value["word"],
          englishSentence:  value["wordset_id"])
        );
      });

      return list;
    }

  @override
  void initState() {
    super.initState();

    _searchResults = new List<SearchResult>();
    this.loadAsset().then((_list) {
      setState(() {
        _searchResults = _list;
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
