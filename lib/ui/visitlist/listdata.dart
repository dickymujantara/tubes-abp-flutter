import 'package:flutter/material.dart';
import 'package:tubes_flutter/detail_list.dart';
import 'package:tubes_flutter/note.dart';

class VisitList extends StatefulWidget {
  const VisitList({Key? key}) : super(key: key);

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<VisitList> {
  final List<Note> _noteList = [
    Note(title: 'Raisul', content: 'Ranca Upas', color: Colors.blue),
    // Note(
    //   title: 'Tubes 2',
    //   content: 'Mobile App With Flutter',
    //   color: Colors.orange,
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _noteList.length,
          itemBuilder: (context, index) {
            final note = _noteList[index];
            return ListTile(
              leading: (CircleAvatar(
                backgroundColor: _noteList[index].color,
              )),
              title: Text(
                _noteList[index].title,
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(_noteList[index]),
                  ),
                );
              },
            );
          }),
    );
  }
}
