import 'dart:convert';
import 'dart:async' show Future;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:xml/xml.dart' as xml;
import 'package:tts/tts.dart';

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
      if (key.toLowerCase().startsWith(query)) {
        list.add(new SearchResult(
            word: value["word"], englishSentence: value["wordset_id"]));
      }
    });

    return list;
  }

  Future<List<SearchResult>> fetchSentences(String query) async {
    //sentences returned to _search
    final list = new List<SearchResult>();
    //Service URL
    var url =
        'https://www.dictionaryapi.com/api/v1/references/learners/xml/$query?key=d89a06d2-eff1-4f07-b08f-869850bc8b57';
    var httpClient = new HttpClient();

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        //Transform response data into XmlDocument
        var content = await response.transform(UTF8.decoder).join();
        var document = xml.parse(content);

        //retrieve example sentences for the word
        var sentences = document.findAllElements('vi');

        //add the sentences to the list
        sentences.forEach((value) {
          list.add(new SearchResult(
              word: value.toString(), englishSentence: value.toString()));
        });
      } else {
        print("error : ${response.statusCode}");
      }
    } catch (exception) {
      print("failed");
    }

    return list;
  }

  void _search(String inputValue) {
    if (inputValue.isEmpty) {
      return;
    }

    final String query = inputValue.toLowerCase();
    this.fetchSentences(query).then((_list) {
      setState(() {
        _searchResults = _list;
      });
    });
  }

  RichText formatString(String rawString) {
    //construct the structure of content embedded into ListTile
    var rt = new RichText(
      text: new TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[],
      ),
    );

    //style the word that you are learning
    var chunks = rawString
        .replaceAll(new RegExp(r'(\[)(.+)(\])'), "")
        .replaceAll(new RegExp("<vi>|</vi>"), "")
        .replaceAll("  ", " ")
        .split(new RegExp(
            "(?=(<it>))|(?=(</it>))|(?=(<phrase>))|(?=(</phrase>))"));

    for (int i = 0; i < chunks.length; i++) {
      var chunk = chunks[i];

      if (chunk.contains(new RegExp("<it>"))) {
        rt.text.children.add(new TextSpan(
            text: chunk.replaceAll(new RegExp("<it>"), ""),
            style: new TextStyle(color: Colors.red)));
      } else if (chunk.contains(new RegExp("<phrase>"))) {
        rt.text.children.add(new TextSpan(
            text: chunk.replaceAll(new RegExp("<phrase>"), ""),
            style: new TextStyle(color: Colors.blue)));
      } else {
        rt.text.children.add(new TextSpan(
            text: chunk.replaceAll(new RegExp("</it>|</phrase>"), "")));
      }
    }

    return rt;
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new TextField(
            controller: _controller,
            decoration: new InputDecoration(hintText: 'Type word'),
            onSubmitted: _search),
        new Expanded(
            child: new ListView(
                children: ListTile
                    .divideTiles(
                        context: context,
                        tiles: _searchResults.map((SearchResult searchResult) {
                          return new ListTile(
                            title: formatString(searchResult.word),
                            trailing: 
                               new Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  new IconButton(
                                    icon: new Icon(Icons.save_alt, color: Colors.red),
                                    onPressed: () async{
                                      
                                    },
                                  ),
                                  new IconButton(
                                    icon: new Icon(Icons.volume_up),
                                    tooltip: searchResult.englishSentence,
                                    onPressed: () async {
                                      //Set English explicitly
                                      await Tts.setLanguage('en-us');
                                      //Speak
                                      Tts.speak(searchResult.englishSentence
                                          .replaceAll(
                                              new RegExp(r'(\[)(.+)(\])'), "")
                                          .replaceAll(new RegExp("<[^>]*>"), ""));
                                    },
                                    color: Colors.black,
                                  ),
                                ],
                                
                              ),
                          );
                        }).toList())
                    .toList()))
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
