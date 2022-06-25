import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tubes_flutter/model/story_create.dart';
import 'package:tubes_flutter/provider/user_provider.dart';
import 'package:tubes_flutter/ui/story/story.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tubes_flutter/provider/story_provider.dart';
import 'package:provider/provider.dart';


class UpdateStory extends StatelessWidget {
  const UpdateStory({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UpdateCeritaPage(),
    );
  }
}

class UpdateCeritaPage extends StatefulWidget {
  const UpdateCeritaPage({Key? key}) : super(key: key);

  @override
  UpdateCeritaPageState createState() => UpdateCeritaPageState();
}

class UpdateCeritaPageState extends State<UpdateCeritaPage> {
  File? image;

  Future pickImage() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    print(image);
    if(image == null) return;

    final imageTemp = File(image.path);
    setState(() => this.image = imageTemp);
  }

  TextEditingController textNamaController = TextEditingController();
  TextEditingController textTitleController = TextEditingController();
  TextEditingController textContentController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _onSend = false;

  Future<void> _updateStory() async{
    setState(() => _onSend = true);
    try {
      StoryProvider provider = context.read<StoryProvider>();
      UserProvider userProvider = context.read<UserProvider>();
      String idUser = userProvider.id!;
      StoryCreate create = await provider.updateStory(
        idUser: idUser,
        title: textTitleController.text, 
        content: textContentController.text, 
        image: image!, 
        likeCount: "0");

      setState(() => _onSend = false);

      showDialog(
        context: context, 
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Upload Story is Success!'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
      );
    } catch (e) {
      log('message : $e');
      showDialog(
        context: context, 
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Upload Story is Failed!'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
      );
    }
    
    setState(() => _onSend = false);
  }

  void kirimdata(){
    AlertDialog alert = AlertDialog(
      title: Text(textNamaController.text),
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Judul: ${textTitleController.text}"),
            Text("Content: ${textContentController.text}"),
            Image.file(image!)
          ]
        )
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Story(),
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
        title: const Text('Ubah Cerita'),
        actions: [
          IconButton(
            onPressed: () {
              // _createStory();
              Navigator.of(context).pop();
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
              // TextField(
              //   controller: textNamaController,
              //   decoration: InputDecoration(
              //     hintText: "Nama Lengkap",
              //     labelText: "Nama Lengkap",
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(20.0)
              //     )
              //   ),
              // ),
              const Padding(padding: EdgeInsets.only(top: 10.0),),
              TextField(
                controller: textTitleController,
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
                controller: textContentController,
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
                  _updateStory();
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