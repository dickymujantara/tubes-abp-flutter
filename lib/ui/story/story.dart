import 'package:flutter/material.dart';
import 'package:tubes_flutter/model/story_response.dart';
import 'package:tubes_flutter/ui/story/add_story.dart';
import 'package:tubes_flutter/ui/story/detail_story.dart';
import 'package:tubes_flutter/provider/story_provider.dart';
import 'package:provider/provider.dart';

class Story extends StatefulWidget{
  const Story({Key? key}) : super(key: key);

  @override
  _StoryState createState() => _StoryState();
}
class _StoryState extends State<Story> {
  
  @override
  Widget build(BuildContext context) {
    StoryProvider  storyProvider = Provider.of<StoryProvider>(context);
    return Scaffold(
      body: FutureBuilder(
        future: storyProvider.getStory(),
        builder: (_, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            StoryResponse storyResponse = snapshot.data as StoryResponse;
            List<Datum> stories = storyResponse.data;

            if (stories.isEmpty) {
              return const Center(
                child: Text("Tidak ada riwayat"),
              );
            }

            return Scrollbar(
              isAlwaysShown: true,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  shrinkWrap: true,
                  children: stories.map((story) {
                    return InkWell(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return DetailScreenStory(story: story);
                        // }));
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Text(story.title),
                              // child: Image.network(
                              //   story.image,
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          } else{
            return const Center(child: CircularProgressIndicator(),);
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const TambahCeritaPage(),
          ));
        },
        child: const Icon(Icons.add),
      )
    );
  }
}

// class StoryList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: storyList.length,
//       shrinkWrap: true,
//       itemBuilder: (BuildContext context, int index) {
//         final Stories story = storyList[index];
//         return InkWell(
//           onTap: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return DetailScreenStory(story: story);
//             }));
//           },
//           child: Card(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expanded(
//                   flex: 1,
//                   child: Image.asset(
//                       'assets/'+story.imageAsset
//                   ),
//                 ),
//                 Expanded(
//                     flex: 2,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Text(
//                             story.judul,
//                             style: TextStyle(
//                                 fontSize: 16
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text(story.content)
//                         ],
//                       ),
//                     )
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class StoryGrid extends StatelessWidget {
//   final int gridCount;

//   StoryGrid({required this.gridCount});

//   @override
//   Widget build(BuildContext context) {
//     return Scrollbar(
//       isAlwaysShown: true,
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: GridView.count(
//           crossAxisCount: gridCount,
//           crossAxisSpacing: 2,
//           mainAxisSpacing: 2,
//           shrinkWrap: true,
//           children: storyList.map((story) {
//             return InkWell(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return DetailScreenStory(story: story);
//                 }));
//               },
//               child: Card(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: <Widget>[
//                     Expanded(
//                       child: Image.asset(
//                         'assets/'+story.imageAsset,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }