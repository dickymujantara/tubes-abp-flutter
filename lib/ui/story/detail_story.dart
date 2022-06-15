import 'package:flutter/material.dart';
import 'package:tubes_flutter/model/story_dummy.dart';

var informationTextStyle = TextStyle(fontFamily: 'Oswald');

class DetailScreenStory extends StatelessWidget {
  final Stories story;

  DetailScreenStory({required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Cerita'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(5)),
              Text(
                story.judul, 
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Image.asset(
                'assets/'+story.imageAsset,
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Text(
                story.content,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}