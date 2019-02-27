import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new RandomWords(),
    );
//    final wordPair = new WordPair.random(); // Add this line.
//    return new MaterialApp(
//      title: 'Welcome to Flutter',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Center(    // Change "const" to "new".
//          //child: const Text('Hello World'),   // Replace this text...
//
//          child: new RandomWords(),  // With this text.
//        ),
//      ),
//    );
  }
}


class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => new RandomWordsState();
    // TODO: implement createState


}


class  RandomWordsState extends State<RandomWords>
{
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  @override                                  // Add from this line ...
  Widget build(BuildContext context) {
//    final WordPair wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
    return new Scaffold (                   // Add from here...
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );                                      // ... to here.
  }




  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),

        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return new Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }


  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

}


