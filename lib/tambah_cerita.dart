// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tubes_flutter/cerita.dart';

class TambahCerita extends StatelessWidget {
  const TambahCerita({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TambahCeritaPage(),
    );
  }
}

class TambahCeritaPage extends StatefulWidget {
  const TambahCeritaPage({Key? key}) : super(key: key);

  @override
  TambahCeritaPageState createState() => TambahCeritaPageState();
}

class TambahCeritaPageState extends State<TambahCeritaPage> {
  File? image;

  Future pickImage() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;

    final imageTemp = File(image.path);
    setState(() => this.image = imageTemp);
  }

  TextEditingController textNama = TextEditingController();
  TextEditingController textTitle = TextEditingController();
  TextEditingController textContent = TextEditingController();

  void kirimdata(){
    AlertDialog alert = AlertDialog(
      title: Text(textNama.text),
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Judul: ${textTitle.text}"),
            Text("Content: ${textContent.text}"),
            Image.file(image!)
          ]
        )
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Cerita(),
            ));
          },
          child: const Text('YES', style: TextStyle(color: Colors.blue),),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('NO', style: TextStyle(color: Colors.red),),
        ),
      ],
    );
    showDialog(context: context, builder: (BuildContext context) =>
          alert);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Cerita'),
        actions: [
          IconButton(
            onPressed: () {
              kirimdata();
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: textNama,
                decoration: InputDecoration(
                  hintText: "Nama Lengkap",
                  labelText: "Nama Lengkap",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  )
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10.0),),
              TextField(
                controller: textTitle,
                decoration: InputDecoration(
                  hintText: "Judul",
                  labelText: "Judul",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  )
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10.0),),
              TextField(
                controller: textContent,
                maxLength: 255,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Content",
                  labelText: "Content",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  )
                ),
              ),
              const SizedBox(height: 10,),
              image !=null ? Image.file(image!): const Text("Gambar Belum Dipilih"),
              RaisedButton(
                onPressed: () async{
                  await pickImage();
                },
                child: const Text(
                  "Image"
                ),
              ),
              RaisedButton(
                onPressed: (){
                  kirimdata();
                },
                child: const Text(
                  "Simpan", style: TextStyle(color: Colors.white,),
                ),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}