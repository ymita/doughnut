import 'package:flutter/material.dart';

class Learning extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LearningState();
  }
}

class LearningState extends State<Learning> {

  List<LearningItem> _learningList;

  @override
  void initState() {
    super.initState();

    _learningList = new List<LearningItem>();

    for (var i = 0; i < 100; i++) {
      _learningList.add(new LearningItem(
        word: 'word$i',
        englishSentence: 'englishSentence $i',
        japaneseSentence: '日本語文 $i')
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: _learningList.map((LearningItem learningItem) {
        return new Container(
          padding: const EdgeInsets.fromLTRB(32.0, 4.0, 32.0, 4.0),
          decoration: new BoxDecoration(
            border: new Border(bottom: new BorderSide(
              color: Colors.grey,
              width: 1.0
            ))
          ),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  learningItem.word,
                  style: new TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new Container(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: new Text(
                  learningItem.englishSentence,
                ),
              ),
              new Container(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: new Text(
                  learningItem.japaneseSentence,
                ),
              ),
            ],
          )
        );
      }).toList(),
    );
  }
}

class LearningItem {
  const LearningItem({this.word, this.englishSentence, this.japaneseSentence});

  final String word;
  final String englishSentence;
  final String japaneseSentence;
}
