import 'package:flutter/material.dart';
import 'package:tubes_flutter/model/story_dummy.dart';

var informationTextStyle = TextStyle(fontFamily: 'Oswald');

class DetailScreenStory extends StatelessWidget {
  final Stories story;

  DetailScreenStory({required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Text("adsada")
      ),
    );
  }
}