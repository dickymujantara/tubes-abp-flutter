import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_flutter/provider/visit_provider.dart';
import 'package:tubes_flutter/provider/user_provider.dart';
import 'package:tubes_flutter/model/create_visit_response.dart';

class Visitlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController textDate = TextEditingController();


    Future<void> kirimdata() async{
      try {
        UserProvider userProvider = context.read<UserProvider>();
        VisitProvider provider = context.read<VisitProvider>();
        String idUser = userProvider.id!;
        CreateVisitResponse create = await provider.createVisit(
          idUser: idUser,
          visitDate: textDate.text
        );

        showDialog(
          context: context, 
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Alert'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Visit List Saved!'),
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
                    Text('Visit List Fail to save!'),
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
