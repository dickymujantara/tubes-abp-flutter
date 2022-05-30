import 'package:flutter/material.dart';
import 'visitlist.dart';
import 'detail_list.dart';
import 'note.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List Tempat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListScreen(),
    );
  }
}

class ListScreen extends StatefulWidget {
  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
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
      appBar: AppBar(
        title: Text('List Tempat'),
      ),
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
