
import 'package:flutter/material.dart';
import 'package:tubes_flutter/tambah_cerita.dart';

class Cerita extends StatelessWidget {
  const Cerita({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CeritaPage(),
    );
  }
}

class CeritaPage extends StatefulWidget {
  const CeritaPage({Key? key}) : super(key: key);

  @override
  CeritaPageState createState() => CeritaPageState();
}

class CeritaPageState extends State<CeritaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Cerita Kamu')),
      ),
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
              Container(
                margin: const EdgeInsets.fromLTRB(2, 10, 2, 0),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  shrinkWrap: true,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(2),
                      child: Image.network('https://picsum.photos/200?image=1'),
                    ),
                    Container(
                      margin: const EdgeInsets.all(2),
                      child: Image.network('https://picsum.photos/200?image=2'),
                    ),
                    Container(
                      margin: const EdgeInsets.all(2),
                      child: Image.network('https://picsum.photos/200?image=3'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const TambahCerita(),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}