import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_flutter/model/tourist_attraction.dart';
import 'package:tubes_flutter/provider/tourist_provider.dart';
import 'package:tubes_flutter/ui/home/detail_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _AttractionState createState() => _AttractionState();
}

class _AttractionState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    TouristProvider provider = context.read<TouristProvider>();
    return Scaffold(
      body: FutureBuilder(
        future: provider.getTourist(),
        builder: (_,snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            TouristAttractionResponse response = snapshot.data as TouristAttractionResponse;
            List<Datum> tourists = response.data;

            if (tourists.isEmpty) {
              return const Center(
                child: Text("Tidak ada riwayat"),
              );
            }

            return ListView.builder(
              itemCount: tourists.length,
              itemBuilder: (BuildContext context, int index) {
                // final TourismPlace place = _touristModel;
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen(place: tourists[index]);
                    }));
                  },
                  child: Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child:Image.memory(
                            base64Decode(tourists[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    tourists[index].name.toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(tourists[index].address.toString())
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              },
            );

          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        }
      ),
    );
  }
}