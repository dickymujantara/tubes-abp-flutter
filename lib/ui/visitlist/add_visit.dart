import 'package:flutter/material.dart';
// import 'package:tubes_flutter/listdata.dart';

class Visitlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController textNama = TextEditingController();
    TextEditingController textTempat = TextEditingController();
    TextEditingController textDate = TextEditingController();
    void kirimdata() {
      AlertDialog alert = AlertDialog(
        title: Text("${textNama.text}"),
        content: Column(
          children: [
            Text("${textTempat.text}"),
            Text("${textDate.text}"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => ListScreen()));
            },
            child: Text(
              'Lihat List',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Kembali',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      );
      showDialog(context: context, builder: (BuildContext context) => alert);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Visit List'),
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: textNama,
                decoration: InputDecoration(
                    hintText: "Nama Lengkap",
                    labelText: "Nama Lengkap",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              TextField(
                controller: textTempat,
                decoration: InputDecoration(
                    hintText: "Nama Tempat",
                    labelText: "Nama Tempat",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              TextField(
                controller: textDate,
                decoration: InputDecoration(
                    hintText: "Visit Date",
                    labelText: "Visit Date",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
              RaisedButton(
                onPressed: () {
                  kirimdata();
                },
                child: Text("Tambahkan"),
              ),
            ],
          )),
    );
  }
}
