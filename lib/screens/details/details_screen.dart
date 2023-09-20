import 'package:dictionary/model/dictionary_response_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final DictionaryResponse dictionaryResponse;

  DetailScreen(this.dictionaryResponse);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      body: Container(
        padding: const EdgeInsets.all(32),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "${dictionaryResponse.word}",
              style: TextStyle(color: Colors.white, fontSize: 36),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final meaning = dictionaryResponse.meanings[index];
                  final definations = meaning.definitions;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meaning.partOfSpeech,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ListView.separated(
                        itemBuilder: (context, index) => Column(
                          children: [
                            Text(
                              "Definition of the Word : " +
                                  definations[index].definition,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              " Example Sentence  : ${definations[index].example}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 8,
                        ),
                        itemCount: definations.length,
                        shrinkWrap: true,
                      )
                    ],
                  );
                },
                itemCount: dictionaryResponse.meanings.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 32,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
