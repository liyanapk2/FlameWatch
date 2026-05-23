// import 'dart:convert';
//
//
//
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
//
//
// import 'package:shared_preferences/shared_preferences.dart';
//
//
//
//
// class viewnotification extends StatefulWidget {
//   const viewnotification({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<viewnotification> createState() => _viewnotification();
// }
//
//
// class _viewnotification extends State<viewnotification> {
//   int _counter = 0;
//
//   _viewnotification() {
//     view_college();
//   }
//
//
//
//   List<String> id_ = <String>[];
//   List<String> alert_ = <String>[];
//   List<String> forestofficer_ = <String>[];
//   List<String> longitude_ = <String>[];
//   List<String> latitude_ = <String>[];
//
//
//
//
//   Future<void> view_college() async {
//     List<String> id = <String>[];
//     List<String> alert = <String>[];
//     List<String> forestofficer = <String>[];
//     List<String> longitude = <String>[];
//     List<String> latitude = <String>[];
//
//
//
//
//
//
//     try {
//       final pref=await SharedPreferences.getInstance();
//       String lid= pref.getString("lid").toString();
//       String ip= pref.getString("url").toString();
//       // String lid= pref.getString("lid").toString();
//
//       String url=ip+"viewnotification";
//       print(url);
//       var data = await http.post(Uri.parse(url), body: {
//         'lid':lid
//       });
//
//       var jsondata = json.decode(data.body);
//       String status = jsondata['status'];
//
//       var arr = jsondata["data"];
//
//       print(arr);
//
//       print(arr.length);
//
//       for (int i = 0; i < arr.length; i++) {
//         print("okkkkkkkkkkkkkkkkkkkkkkkk");
//         id.add(arr[i]['id'].toString());
//         alert.add(arr[i]['alert'].toString());
//         forestofficer.add(arr[i]['forestofficer'].toString());
//         longitude.add(arr[i]['longitude'].toString());
//         latitude.add(arr[i]['latitude'].toString());
//         print("ppppppppppppppppppp");
//       }
//
//       setState(() {
//         id_ = id;
//         alert_ = alert;
//         forestofficer_ = forestofficer;
//         longitude_=longitude;
//         latitude_=latitude;
//
//       });
//
//       print(id_.length);
//       print("+++++++++++++++++++++");
//       print(status);
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//       //there is error during converting file image to base64 encoding.
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//         appBar: AppBar(
//             title: new Text(
//               "View All  Bus",
//               style: new TextStyle(color: Colors.white),
//             ),
//             leading: new IconButton(
//               icon: new Icon(Icons.arrow_back),
//               onPressed: () {
//                 Navigator.pop(context);
//                 // Navigator.pushNamed(context, '/home');
//                 // Navigator.push(context, MaterialPageRoute(builder: (context) => const  MyHomePage(title: '',)),);
//                 print("Hello");
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => ThirdScreen()),
//                 // );
//               },
//             )
//         ),
//
//         body:
//
//
//
//
//         ListView.builder(
//           physics: BouncingScrollPhysics(),
//           // padding: EdgeInsets.all(5.0),
//           // shrinkWrap: true,
//           itemCount: id_.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               onLongPress: () {
//                 print("long press" + index.toString());
//               },
//               title: Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Column(
//                     children: [
//
//
//                       Container(
//                         width: MediaQuery. of(context). size. width,
//                         height: 200,
//                         child: Card(
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           child: Column(
//                             children: [
//
//
//
//
//
//
//
//                               SizedBox(height: 16,),
//                               Row(
//
//                                 children: [
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//
//                                   Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("alert")])),
//                                   Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(alert_[index])])),
//
//                                   // Text("Place"),
//                                   // Text(place_[index])
//                                 ],
//                               ),
//                               SizedBox(height: 16,),
//                               Row(
//
//                                 children: [
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//
//                                   Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("forestofficer")])),
//                                   Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(forestofficer_[index])])),
//
//                                   // Text("Place"),
//                                   // Text(place_[index])
//                                 ],
//                               ),
//                               SizedBox(height: 16,),
//                               Row(
//
//                                 children: [
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//
//                                   Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("longitude")])),
//                                   Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(longitude_[index])])),
//
//                                   // Text("Place"),
//                                   // Text(place_[index])
//                                 ],
//                               ),
//                               SizedBox(height: 16,),
//                               Row(
//
//                                 children: [
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//
//                                   Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("latitude")])),
//                                   Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(latitude_[index])])),
//
//                                   // Text("Place"),
//                                   // Text(place_[index])
//                                 ],
//                               ),
//
//
//
//                               // SizedBox(height: 9,),
//                               //
//                               // Container(
//                               //   padding: EdgeInsets.all(5.0),
//                               //   child:   Row(
//                               //
//                               //     children: [
//                               //
//                               //
//                               //       SizedBox(width: 10.0,),
//                               //       ElevatedButton(
//                               //         onPressed: () async {
//                               //
//                               //           SharedPreferences prefs = await SharedPreferences.getInstance();
//                               //           prefs.setString('bid', cid_[index]);
//                               //
//                               //
//                               //
//                               //           Navigator.push(
//                               //             context,
//                               //
//                               //             MaterialPageRoute(builder: (context) => PaymentScreen()),
//                               //           );
//                               //
//                               //         },
//                               //         child: Text('pay'),
//                               //       ),
//                               //
//                               //     ],
//                               //   ),
//                               // )
//
//
//                               // Column(
//                               //     mainAxisAlignment: MainAxisAlignment.start,
//                               //     crossAxisAlignment: CrossAxisAlignment.start,
//                               //     children:[
//                               //   Text('Title'),
//                               //   Text('Subtitle')
//                               // ])
//                             ],
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           elevation: 5,
//                           margin: EdgeInsets.all(10),
//                         ),
//                       ),
//
//
//                     ],
//                   )),
//             );
//           },
//
//         )
//
//
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
//
//
//
//
//
//
// }
//
//
//




//

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ViewNotification extends StatefulWidget {
//   const ViewNotification({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<ViewNotification> createState() => _ViewNotificationState();
// }
//
// class _ViewNotificationState extends State<ViewNotification> {
//   int _counter = 0;
//
//   _ViewNotificationState() {
//     viewCollege();
//   }
//
//   List<String> id_ = <String>[];
//   List<String> alert_ = <String>[];
//   List<String> forestofficer_ = <String>[];
//   List<String> longitude_ = <String>[];
//   List<String> latitude_ = <String>[];
//
//   Future<void> viewCollege() async {
//     List<String> id = <String>[];
//     List<String> alert = <String>[];
//     List<String> forestofficer = <String>[];
//     List<String> longitude = <String>[];
//     List<String> latitude = <String>[];
//
//     try {
//       final pref = await SharedPreferences.getInstance();
//       String lid = pref.getString("lid").toString();
//       String ip = pref.getString("url").toString();
//
//       String url = ip + "viewnotification";
//       print(url);
//       var data = await http.post(Uri.parse(url), body: {
//         'lid': lid
//       });
//
//       var jsondata = json.decode(data.body);
//       String status = jsondata['status'];
//
//       var arr = jsondata["data"];
//
//       print(arr);
//
//       print(arr.length);
//
//       for (int i = 0; i < arr.length; i++) {
//         print("okkkkkkkkkkkkkkkkkkkkkkkk");
//         id.add(arr[i]['id'].toString());
//         alert.add(arr[i]['alert'].toString());
//         forestofficer.add(arr[i]['forestofficer'].toString());
//         longitude.add(arr[i]['longitude'].toString());
//         latitude.add(arr[i]['latitude'].toString());
//         print("ppppppppppppppppppp");
//       }
//
//       setState(() {
//         id_ = id;
//         alert_ = alert;
//         forestofficer_ = forestofficer;
//         longitude_ = longitude;
//         latitude_ = latitude;
//       });
//
//       print(id_.length);
//       print("+++++++++++++++++++++");
//       print(status);
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "View All Notifications",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Colors.green[800], // Dark green for AppBar
//         elevation: 0,
//       ),
//       body: ListView.builder(
//         physics: BouncingScrollPhysics(),
//         itemCount: id_.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//             margin: EdgeInsets.all(10),
//             elevation: 5,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             color: Colors.green[50], // Light green background for cards
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Alert",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green[900], // Dark green for headings
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     alert_[index],
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.green[800], // Medium green for content
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Forest Officer",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green[900], // Dark green for headings
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     forestofficer_[index],
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.green[800], // Medium green for content
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Location",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green[900], // Dark green for headings
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Icon(Icons.location_on, size: 16, color: Colors.green[800]), // Green icon
//                       SizedBox(width: 8),
//                       Text(
//                         "${latitude_[index]}",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.green[800], // Medium green for content
//                         ),
//                       ),
//
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Icon(Icons.location_on, size: 16, color: Colors.green[800]), // Green icon
//                       SizedBox(width: 8),
//                       Text(
//                         " ${longitude_[index]}",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.green[800], // Medium green for content
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       backgroundColor: Colors.green[100], // Light green for the background
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewNotification extends StatefulWidget {
  const ViewNotification({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ViewNotification> createState() => _ViewNotificationState();
}

class _ViewNotificationState extends State<ViewNotification> {
  _ViewNotificationState() {
    viewCollege();
  }

  List<String> id_ = <String>[];
  List<String> alert_ = <String>[];
  List<String> forestofficer_ = <String>[];
  List<String> longitude_ = <String>[];
  List<String> latitude_ = <String>[];

  Future<void> viewCollege() async {
    List<String> id = <String>[];
    List<String> alert = <String>[];
    List<String> forestofficer = <String>[];
    List<String> longitude = <String>[];
    List<String> latitude = <String>[];

    try {
      final pref = await SharedPreferences.getInstance();
      String lid = pref.getString("lid").toString();
      String ip = pref.getString("url").toString();

      String url = ip + "viewnotification";
      var data = await http.post(Uri.parse(url), body: {'lid': lid});

      var jsondata = json.decode(data.body);
      String status = jsondata['status'];
      var arr = jsondata["data"];

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        alert.add(arr[i]['alert'].toString());
        forestofficer.add(arr[i]['forestofficer'].toString());
        longitude.add(arr[i]['longitude'].toString());
        latitude.add(arr[i]['latitude'].toString());
      }

      setState(() {
        id_ = id;
        alert_ = alert;
        forestofficer_ = forestofficer;
        longitude_ = longitude;
        latitude_ = latitude;
      });
    } catch (e) {
      print("Error: " + e.toString());
    }
  }

  void _launchMap(String lat, String lon) async {
    final Uri googleMapUrl = Uri.parse(
      "http://maps.google.com?q=$lat,$lon",
    );


      await launchUrl(googleMapUrl, mode: LaunchMode.externalApplication);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View All Notifications",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.green[800],
        elevation: 0,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: id_.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.green[50],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alert",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    alert_[index],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green[800],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Forest Officer",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    forestofficer_[index],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green[800],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          size: 16, color: Colors.green[800]),
                      SizedBox(width: 8),
                      Text(
                        latitude_[index],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green[800],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          size: 16, color: Colors.green[800]),
                      SizedBox(width: 8),
                      Text(
                        longitude_[index],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green[800],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _launchMap(
                            latitude_[index], longitude_[index]);
                      },
                      icon: Icon(Icons.map),
                      label: Text("Track"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.green[100],
    );
  }
}
