// import 'dart:convert';
//
// import 'package:flutter/material.dart';
//
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'home.dart';
//
// class complaint extends StatefulWidget {
//   @override
//   _complaintState createState() => _complaintState();
// }
//
// class _complaintState extends State<complaint> {
// // Lists to store complaints and their replies
//   List<String> complaints = [];
//   List<String> replies = [];
//
//
//   List<String> ccid_ = <String>[];
//   List<String> date_ = <String>[];
//   List<String> reply_ = <String>[];
//
//   List<String> complaint_ = <String>[];
//   _complaintState(){
//     load();
//   }
//   Future<void> load() async {
//     List<String> ccid = <String>[];
//     List<String> date = <String>[];
//     List<String> reply = <String>[];
//     List<String> complaint = <String>[];
//
//
//     try {
//       final pref = await SharedPreferences.getInstance();
//       String lid = pref.getString("lid").toString();
//       String ip = pref.getString("url").toString();
//       // String lid= pref.getString("lid").toString();
//
//       String url = ip + "viewreplyuser";
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
//       // List<String> schid_ = <String>[];
//       // List<String> date_ = <String>[];
//       // List<String> type_ = <String>[];
//
//       for (int i = 0; i < arr.length; i++) {
//         ccid.add(arr[i]['id'].toString());
//         date.add(arr[i]['date'].toString());
//         reply.add(arr[i]['reply'].toString());
//         complaint.add(arr[i]['complaint'].toString());
//       }
//       setState(() {
//         ccid_ = ccid;
//         date_ = date;
//         reply_ = reply;
//         complaint_ = complaint;
//       });
//       print(status);
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//       //there is error during converting file image to base64 encoding.
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Complaints"),
//       ),
//       body: ListView.builder(
//         physics: BouncingScrollPhysics(),
//         // padding: EdgeInsets.all(5.0),
//         // shrinkWrap: true,
//         itemCount: ccid_.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//               onTap: () {
//
//
//               },
//               title: Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Column(
//                   children: [
//
//
//                     Container(
//                       width: MediaQuery
//                           .of(context)
//                           .size
//                           .width,
//                       height: 200,
//                       child: Card(
//                         clipBehavior: Clip.antiAliasWithSaveLayer,
//                         child: Column(
//                           children: [
//
//                             SizedBox(height: 16,),
//                             Row(
//
//                               children: [
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//
//                                 Flexible(flex: 2,
//                                     fit: FlexFit.loose,
//                                     child: Row(children: [Text(" Date")])),
//                                 Flexible(flex: 3,
//                                     fit: FlexFit.loose,
//                                     child: Row(children: [Text(date_[index])])),
//
//                                 // Text("Place"),
//                                 // Text(place_[index])
//                               ],
//                             ),
//                             SizedBox(height: 16,),
//                             Row(
//
//                               children: [
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//
//                                 Flexible(flex: 2,
//                                     fit: FlexFit.loose,
//                                     child: Row(children: [Text("Complaint")])),
//                                 Flexible(flex: 3,
//                                     fit: FlexFit.loose,
//                                     child: Row(
//                                         children: [Text(complaint_[index])])),
//
//                                 // Text("Place"),
//                                 // Text(place_[index])
//                               ],
//                             ),
//                             SizedBox(height: 16,), Row(
//
//                               children: [
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//
//                                 Flexible(flex: 2,
//                                     fit: FlexFit.loose,
//                                     child: Row(children: [Text("Reply")])),
//                                 Flexible(flex: 3,
//                                     fit: FlexFit.loose,
//                                     child: Row(
//                                         children: [Text(reply_[index])])),
//
//                                 // Text("Place"),
//                                 // Text(place_[index])
//                               ],
//                             ),
//
//
//                           ],
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         elevation: 5,
//                         margin: EdgeInsets.all(10),
//                       ),
//                     ),
//
//
//                   ],
//                 ),
//               )
//
//
//           );
//         },
//
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
// // Navigate to the New Complaint page when the button is pressed
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => NewComplaintPage(),
//             ),
//           ).then((newComplaint) {
// // Add the new complaint to the list (if provided)
//             if (newComplaint != null) {
//               setState(() {
//                 complaints.add(newComplaint);
//                 replies.add("Admin Reply for New Complaint");
//               });
//             }
//           });
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class NewComplaintPage extends StatefulWidget {
//   @override
//   _NewComplaintPageState createState() => _NewComplaintPageState();
// }
//
// class _NewComplaintPageState extends State<NewComplaintPage> {
//   final TextEditingController _complaintController = TextEditingController();
//
//   @override
//   void dispose() {
//     _complaintController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Write a New Complaint"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _complaintController,
//               decoration: InputDecoration(
//                 hintText: "Enter your complaint...",
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 final sh = await SharedPreferences.getInstance();
//                 String complaint = _complaintController.text.toString();
//                 // String Passwd=passwordController.text.toString();
//                 String url = sh.getString("url").toString();
//                 String lid = sh.getString("lid").toString();
//                 print("okkkkkkkkkkkkkkkkk");
//                 var data = await http.post(
//                     Uri.parse(url + "sendcomplaint"),
//                     body: {'complaint': complaint,
//                       'lid': lid,
//
//                     });
//                 var jasondata = json.decode(data.body);
//                 String status = jasondata['task'].toString();
//                 if (status == "ok") {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => home()));
//                 }
//                 else {
//                   print("error");
//                 }
//               },
//               child: Text("Submit Complaint"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart'; // Ensure this import points to your home screen

class Complaint extends StatefulWidget {
  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  List<String> ccid_ = <String>[];
  List<String> date_ = <String>[];
  List<String> reply_ = <String>[];
  List<String> complaint_ = <String>[];

  _ComplaintState() {
    load();
  }

  Future<void> load() async {
    List<String> ccid = <String>[];
    List<String> date = <String>[];
    List<String> reply = <String>[];
    List<String> complaint = <String>[];

    try {
      final pref = await SharedPreferences.getInstance();
      String lid = pref.getString("lid").toString();
      String ip = pref.getString("url").toString();

      String url = ip + "viewreplyuser";
      var data = await http.post(Uri.parse(url), body: {'lid': lid});
      var jsondata = json.decode(data.body);
      var arr = jsondata["data"];

      for (int i = 0; i < arr.length; i++) {
        ccid.add(arr[i]['id'].toString());
        date.add(arr[i]['date'].toString());
        reply.add(arr[i]['reply'].toString());
        complaint.add(arr[i]['complaint'].toString());
      }
      setState(() {
        ccid_ = ccid;
        date_ = date;
        reply_ = reply;
        complaint_ = complaint;
      });
    } catch (e) {
      print("Error: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complaints"),
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
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date: ${date_[index]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Complaint: ${complaint_[index]}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Reply: ${reply_[index]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green, // Green button
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewComplaintPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NewComplaintPage extends StatefulWidget {
  @override
  _NewComplaintPageState createState() => _NewComplaintPageState();
}

class _NewComplaintPageState extends State<NewComplaintPage> {
  final TextEditingController _complaintController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Key for form validation

  @override
  void dispose() {
    _complaintController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Complaint"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Assign the form key
          child: Column(
            children: [
              TextFormField(
                controller: _complaintController,
                decoration: InputDecoration(
                  hintText: "Enter your complaint...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your complaint'; // Validation message
                  }
                  return null; // Return null if the input is valid
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                onPressed: () async {
                  // Validate the form
                  if (_formKey.currentState!.validate()) {
                    final sh = await SharedPreferences.getInstance();
                    String complaint = _complaintController.text.toString();
                    String url = sh.getString("url").toString();
                    String lid = sh.getString("lid").toString();

                    var data = await http.post(
                      Uri.parse(url + "sendcomplaint"),
                      body: {'complaint': complaint, 'lid': lid},
                    );
                    var jasondata = json.decode(data.body);
                    String status = jasondata['task'].toString();

                    if (status == "ok") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => home()),
                      );
                    } else {
                      print("Error sending complaint");
                    }
                  }
                },
                child: const Text("Submit Complaint"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
