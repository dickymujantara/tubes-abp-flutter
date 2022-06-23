import 'package:flutter/material.dart';
import 'package:tubes_flutter/model/tourist_attraction.dart';
import 'package:tubes_flutter/network/api_service.dart';
import 'package:tubes_flutter/network/remote_data_source.dart';
import 'package:tubes_flutter/ui/home/detail_screen.dart';
import 'package:tubes_flutter/model/tourism_place.dart';

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//           if (constraints.maxWidth <= 600) {
//             return TourismPlaceList();
//           } else if (constraints.maxWidth <= 1200) {
//             return TourismPlaceGrid(gridCount: 4);
//           } else {
//             return TourismPlaceGrid(gridCount: 6);
//           }
//         },
//       ),
//     );
//   }
// }

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _AttractionState createState() => _AttractionState();
}

class _AttractionState extends State<Home> {
  late List<Attraction> _touristModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _touristModel = (await ApiService().getTourists())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _touristModel == null || _touristModel.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _touristModel.length,
              itemBuilder: (BuildContext context, int index) {
                // final TourismPlace place = _touristModel;
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen(place: _touristModel[index]);
                    }));
                  },
                  child: Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Image.network(_touristModel[index].imageurl,
                              errorBuilder: (context, error, stackTrace) {
                            return Image.asset('images/error.jpg');
                          }),
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
                                    _touristModel[index].name.toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(_touristModel[index].address.toString())
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// class TourismPlaceList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: tourismPlaceList.length,
//       itemBuilder: (BuildContext context, int index) {
//         final TourismPlace place = tourismPlaceList[index];
//         return InkWell(
//           onTap: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return DetailScreen(place: place);
//             }));
//           },
//           child: Card(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expanded(
//                   flex: 1,
//                   child: Image.asset(place.imageAsset),
//                 ),
//                 Expanded(
//                     flex: 2,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Text(
//                             place.name,
//                             style: TextStyle(fontSize: 16),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text(place.location)
//                         ],
//                       ),
//                     ))
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class TourismPlaceGrid extends StatelessWidget {
//   final int gridCount;

//   TourismPlaceGrid({required this.gridCount});

//   @override
//   Widget build(BuildContext context) {
//     return Scrollbar(
//       isAlwaysShown: true,
//       child: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: GridView.count(
//           crossAxisCount: gridCount,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//           children: tourismPlaceList.map((place) {
//             return InkWell(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return DetailScreen(place: place);
//                 }));
//               },
//               child: Card(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: <Widget>[
//                     Expanded(
//                       child: Image.asset(
//                         place.imageAsset,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8),
//                       child: Text(
//                         place.name,
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
//                       child: Text(
//                         place.location,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
