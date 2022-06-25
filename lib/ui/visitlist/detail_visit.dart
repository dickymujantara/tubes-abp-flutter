import 'package:flutter/material.dart';
import 'package:tubes_flutter/model/visit_response.dart';
import 'note.dart';
import 'dart:convert';

class DetailScreen extends StatefulWidget {
  final Datum visit;

  DetailScreen({required this.visit});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final visit = widget.visit;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8),
              Text(
                visit.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.blue),
              ),
              Text(visit.name),
            ],
          ),
        ),
      ),
    );
  }
}
