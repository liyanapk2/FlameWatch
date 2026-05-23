// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'ViewAnimal.dart';
// import 'home.dart';
//
// class division extends StatefulWidget {
//   @override
//   _complaintState createState() => _complaintState();
// }
//
// class _complaintState extends State<division> {
//   List<String> ccid_ = <String>[];
//   List<String> name_ = <String>[];
//   List<String> area_ = <String>[];
//   List<String> details_ = <String>[];
//
//   _complaintState() {
//     load();
//   }
//
//   Future<void> load() async {
//     List<String> ccid = <String>[];
//     List<String> name = <String>[];
//     List<String> area = <String>[];
//     List<String> details = <String>[];
//
//     try {
//       final pref = await SharedPreferences.getInstance();
//       String lid = pref.getString("lid").toString();
//       String ip = pref.getString("url").toString();
//
//       String url = ip + "view_userdivision";
//       var data = await http.post(Uri.parse(url), body: {'lid': lid});
//       var jsondata = json.decode(data.body);
//       var arr = jsondata["data"];
//
//       for (int i = 0; i < arr.length; i++) {
//         ccid.add(arr[i]['id'].toString());
//         name.add(arr[i]['name'].toString());
//         area.add(arr[i]['area'].toString());
//         details.add(arr[i]['details'].toString());
//       }
//       setState(() {
//         ccid_ = ccid;
//         name_ = name;
//         area_ = area;
//         details_ = details;
//       });
//     } catch (e) {
//       print("Error: " + e.toString());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Forest Division"),
//         backgroundColor: Colors.green, // Green theme
//       ),
//       body: ListView.builder(
//         physics: const BouncingScrollPhysics(),
//         itemCount: ccid_.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               elevation: 4,
//               child: Stack(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Name: ${name_[index]}",
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black54,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           "Area: ${area_[index]}",
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           "Details: ${details_[index]}",
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Animal icon at the top-right corner
//                   Positioned(
//                     top: 10,
//                     right: 10,
//                     child:
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => AnimalPage(divisionId: ccid_[index]), // Passing division ID
//                           ),
//                         );
//                       },
//                       child: const Icon(
//                         Icons.pets,
//                         color: Colors.green,
//                         size: 30,
//                       ),
//                     ),
//
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   backgroundColor: Colors.green, // Green button
//       //   onPressed: () {
//       //     Navigator.push(
//       //       context,
//       //       MaterialPageRoute(builder: (context) => NewComplaintPage()),
//       //     );
//       //   },
//       //   child: const Icon(Icons.add),
//       // ),
//     );
//   }
// }
//

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'ViewAnimal.dart';
import 'home.dart';

class division extends StatefulWidget {
  @override
  _DivisionState createState() => _DivisionState();
}

class _DivisionState extends State<division> {
  List<String> ccid_ = [];
  List<String> name_ = [];
  List<String> area_ = [];
  List<String> details_ = [];
  List<String> filteredCcid = [];
  List<String> filteredName = [];
  List<String> filteredArea = [];
  List<String> filteredDetails = [];
  TextEditingController searchController = TextEditingController();

  _DivisionState() {
    load();
  }

  Future<void> load() async {
    List<String> ccid = [];
    List<String> name = [];
    List<String> area = [];
    List<String> details = [];

    try {
      final pref = await SharedPreferences.getInstance();
      String lid = pref.getString("lid").toString();
      String ip = pref.getString("url").toString();

      String url = "$ip/view_userdivision";
      var data = await http.post(Uri.parse(url), body: {'lid': lid});
      var jsondata = json.decode(data.body);
      var arr = jsondata["data"];

      for (int i = 0; i < arr.length; i++) {
        ccid.add(arr[i]['id'].toString());
        name.add(arr[i]['name'].toString());
        area.add(arr[i]['area'].toString());
        details.add(arr[i]['details'].toString());
      }
      setState(() {
        ccid_ = ccid;
        name_ = name;
        area_ = area;
        details_ = details;
        filteredCcid = List.from(ccid_);
        filteredName = List.from(name_);
        filteredArea = List.from(area_);
        filteredDetails = List.from(details_);
      });
    } catch (e) {
      print("Error: " + e.toString());
    }
  }

  void filterSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredCcid = List.from(ccid_);
        filteredName = List.from(name_);
        filteredArea = List.from(area_);
        filteredDetails = List.from(details_);
      });
      return;
    }
    setState(() {
      filteredCcid = [];
      filteredName = [];
      filteredArea = [];
      filteredDetails = [];
      for (int i = 0; i < name_.length; i++) {
        if (name_[i].toLowerCase().contains(query.toLowerCase()) ||
            area_[i].toLowerCase().contains(query.toLowerCase())) {
          filteredCcid.add(ccid_[i]);
          filteredName.add(name_[i]);
          filteredArea.add(area_[i]);
          filteredDetails.add(details_[i]);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forest Division"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search by name or area...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (query) {
                filterSearch(query);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: filteredCcid.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name: ${filteredName[index]}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Area: ${filteredArea[index]}",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Details: ${filteredDetails[index]}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AnimalPage(divisionId: filteredCcid[index]),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.pets,
                              color: Colors.green,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
