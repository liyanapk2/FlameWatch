import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'ViewAnimal.dart';
import 'home.dart';

class animaldetection extends StatefulWidget {
  @override
  _complaintState createState() => _complaintState();
}

class _complaintState extends State<animaldetection> {
  List<String> ccid_ = <String>[];
  List<String> notification_ = <String>[];
  // List<String> type_ = <String>[];
  List<String> date_ = <String>[];
  List<String> image_ = <String>[];

  _complaintState() {
    load();
  }

  Future<void> load() async {
    List<String> ccid = <String>[];
    List<String> notification = <String>[];
    // List<String> type = <String>[];
    List<String> date = <String>[];
    List<String> image = <String>[];

    try {
      final pref = await SharedPreferences.getInstance();
      String lid = pref.getString("lid").toString();
      String ip = pref.getString("url").toString();

      String url = ip + "view_animaldetection";
      var data = await http.post(Uri.parse(url), body: {'lid': lid});
      var jsondata = json.decode(data.body);
      var arr = jsondata["data"];

      for (int i = 0; i < arr.length; i++) {
        ccid.add(arr[i]['id'].toString());
        notification.add(arr[i]['notification'].toString());
        // type.add(arr[i]['type'].toString());
        date.add(arr[i]['date'].toString());
        image.add(arr[i]['image'].toString());
      }
      setState(() {
        ccid_ = ccid;
        notification_ = notification;
        // type_ = type;
        date_ = date;
        image_ = image;
      });
    } catch (e) {
      print("Error: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animal Detection"),
        backgroundColor: Colors.green, // Green theme
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: ccid_.length,
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
                          "Notification: ${notification_[index]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        // const SizedBox(height: 8),
                        // Text(
                        //   "type: ${type_[index]}",
                        //   style: const TextStyle(fontSize: 16),
                        // ),
                        const SizedBox(height: 8),
                        Text(
                          "date: ${date_[index]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            image_[index],
                            height: 150, // Adjust height
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.image_not_supported, size: 100, color: Colors.grey);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Animal icon at the top-right corner
                  // Positioned(
                  //   top: 10,
                  //   right: 10,
                  //   child:
                  //   GestureDetector(
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => AnimalPage(divisionId: ccid_[index]), // Passing division ID
                  //         ),
                  //       );
                  //     },
                  //     child: const Icon(
                  //       Icons.pets,
                  //       color: Colors.green,
                  //       size: 30,
                  //     ),
                  //   ),
                  //
                  // ),
                ],
              ),
            ),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.green, // Green button
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => NewComplaintPage()),
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

