import 'package:flutter/material.dart';
import 'package:tubes_flutter/model/story_dummy.dart';
import 'package:tubes_flutter/ui/story/add_story.dart';
import 'package:tubes_flutter/ui/story/detail_story.dart';

class Story extends StatelessWidget {
  const Story({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(10)),
              const CircleAvatar(
                radius: 50,
                child: Text("N", style: TextStyle(fontSize: 20),), 
              ),
              const Padding(padding: EdgeInsets.all(5)),
              const Text(
                "Nama Lengkap", 
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const Text(
                "Banyaknya Cerita: 20",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if(constraints.maxWidth <= 200){
                    return StoryList();
                  } else if(constraints.maxWidth <= 1200) {
                    return StoryGrid(gridCount: 3);
                  } else {
                    return StoryGrid(gridCount: 6);
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const TambahCeritaPage(),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class StoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: storyList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final Stories story = storyList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreenStory(story: story);
            }));
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.asset(
                      story.imageAsset
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            story.judul,
                            style: TextStyle(
                                fontSize: 16
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(story.content)
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class StoryGrid extends StatelessWidget {
  final int gridCount;

  StoryGrid({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          shrinkWrap: true,
          children: storyList.map((story) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreenStory(story: story);
                }));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        story.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}