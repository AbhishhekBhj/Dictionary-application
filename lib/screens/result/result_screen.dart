import 'package:dictionary/model/dictionary_response_model.dart';
import 'package:dictionary/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.words});

  final List<DictionaryResponse> words;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        title: Text("Word(s) Containing the meaning"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))
        ],
      ),
      backgroundColor: Colors.purple[300],
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(words[index]),
                      ));
                },
                title: Text(
                  "${index + 1}. ${words[index].word}".toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          separatorBuilder: (context, index) =>
              Divider(color: Colors.deepPurple),
          itemCount: words.length),
    );
  }
}
