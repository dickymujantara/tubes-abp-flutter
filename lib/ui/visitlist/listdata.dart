import 'package:flutter/material.dart';
import 'package:tubes_flutter/detail_list.dart';
import 'package:tubes_flutter/model/visit_response.dart';
import 'package:tubes_flutter/note.dart';
import 'package:tubes_flutter/provider/visit_provider.dart';
import 'package:provider/provider.dart';

class VisitList extends StatefulWidget {
  const VisitList({Key? key}) : super(key: key);

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<VisitList> {
  // final List<Note> _noteList = [
  //   //Note(title: 'Raisul', content: 'Ranca Upas', color: Colors.blue),
  //   // Note(
  //   //   title: 'Tubes 2',
  //   //   content: 'Mobile App With Flutter',
  //   //   color: Colors.orange,
  //   // ),
  // ];

  @override
  Widget build(BuildContext context) {
    VisitProvider visitProvider = Provider.of<VisitProvider>(context);
    return Scaffold(
        body: FutureBuilder(
            future: visitProvider.getVisit(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                VisitResponse visitResponse = snapshot.data as VisitResponse;
                List<Datum> visit = visitResponse.data;

                if (visit.isEmpty) {
                  return const Center(
                    child: Text("Tidak ada riwayat"),
                  );
                }

                return ListView.builder(
                    itemCount: visit.length,
                    itemBuilder: (context, index) {
                      // final note = _noteList[index];
                      // final visit = _noteList[index];
                      return ListTile(
                        leading: (CircleAvatar()),
                        title: Text(
                          visit[index].name,
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(note: visit[index]),
                            ),
                          );
                        },
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
