import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart'; // for random words

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new RandomWord()
    );
  }
}
class RandomWord extends StatefulWidget {
  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFonts = const TextStyle(fontSize: 16.0);
  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(18.0),

      itemBuilder: (BuildContext _context, int i){
        if (i.isOdd) {
          return new Divider();
        }

       int index = i ~/ 2;
       if (index >= _suggestions.length) {
         _suggestions.addAll(generateWordPairs().take(10));
       }

       return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair){
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFonts,
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
}