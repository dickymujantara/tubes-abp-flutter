import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tubes_flutter/model/story_response.dart';
import 'package:tubes_flutter/provider/story_provider.dart';
import 'package:tubes_flutter/ui/story/update_story.dart';
import 'package:provider/provider.dart';

var informationTextStyle = TextStyle(fontFamily: 'Oswald');

class DetailScreenStory extends StatelessWidget {
  final Datum story;

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
                story.title, 
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Image.memory(
                base64Decode(story.image),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Text(
                story.content,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              Row(
                children: [
                  FavoriteButton(),
                  Text(story.likeCount.toString()),
                  const Padding(padding: EdgeInsets.all(5)),
                  RaisedButton(
                    onPressed: (){
                      StoryProvider provider = context.read<StoryProvider>();
                      provider.setStory(idStory: story.id.toString());
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UpdateCeritaPage(),
                      ));
                    },
                    child: const Text(
                      "Update", style: TextStyle(color: Colors.white,),
                    ),
                    color: Colors.blue,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}