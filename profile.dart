// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'package:fluttertoast/fluttertoast.dart';
//
// class Profile extends StatefulWidget {
//   const Profile({super.key});
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   // bool _isAvailable = true; // Track availability status
//   String name = "";
//   String dob = "";
//   String place = "";
//   String gender = "";
//   String phone = "";
//   String email = "";
//   String image="";
//
//   @override
//   void initState() {
//     super.initState();
//     viewProfile();
//     // updateAvailability();
//   }
//   bool stringToBool(String value) {
//     if (value.toLowerCase() == 'true') {
//       return true;
//     } else if (value.toLowerCase() == 'false') {
//       return false;
//     } else {
//       throw FormatException("Invalid boolean string: '$value'");
//     }
//   }
//   Future<void> viewProfile() async {
//     print("view_profile===");
//     try {
//       final pref = await SharedPreferences.getInstance();
//       String ip = pref.getString("url").toString();
//       String lid = pref.getString("lid").toString();
//
//       String url = ip + "viewprofile";
//       print(url);
//       print("=========================");
//
//       var data = await http.post(Uri.parse(url), body: {'lid': lid});
//       var jsondata = json.decode(data.body);
//       print(jsondata); // Print the API response for debugging
//
//       // Access profile fields directly from jsondata
//       if (jsondata != null) {
//         setState(() {
//           name = jsondata['name'].toString();
//           dob = jsondata['dob'].toString();
//           place = jsondata['place'].toString();
//           gender = jsondata['gender'].toString();
//           phone = jsondata['phone'].toString();
//           email = jsondata['email'].toString();
//           image = jsondata['image'] != null && jsondata['image'].isNotEmpty
//               ? jsondata['image'].toString()  // No need to append IP manually
//               : "";
//
//         });
//         // setState((){});
//       } else {
//         print("No profile data found in the response");
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//   }
//
//   // Function to update the availability
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         backgroundColor: Colors.greenAccent,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Team Details Section
//             Row(
//               children: [
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundImage: image.isNotEmpty
//                       ? NetworkImage(image)
//                       : AssetImage('assets/') as ImageProvider,
//                 ),
//
//                 SizedBox(width: 16),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       name,
//                       style: TextStyle(
//                           fontSize: 22, fontWeight: FontWeight.bold),
//                     ),
//
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 24),
//             // Availability Section
//
//
//             SizedBox(height: 16),
//             // Rescue Team Information
//             buildInfoRow('Name', name.toString()),
//             buildInfoRow('DOB', dob.toString()),
//             buildInfoRow('Place', place.toString()),
//             buildInfoRow('Gender', gender.toString()),
//             buildInfoRow('Phone', phone.toString()),
//             buildInfoRow('Email', email.toString()),
//
//
//
//             SizedBox(height: 24),
//             // Update Button
//             Center(
//               // child: ElevatedButton(
//               //   onPressed: updateAvailability,
//               //   child: Text('Update'),
//               //   style: ElevatedButton.styleFrom(
//               //     primary: Colors.greenAccent,
//               //     padding:
//               //     EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//               //     textStyle: TextStyle(
//               //         fontSize: 16, fontWeight: FontWeight.bold),
//               //   ),
//               // ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build information rows
//   Widget buildInfoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(fontSize: 16, color: Colors.black54),
//           ),
//           Text(
//             value,
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = "";
  String dob = "";
  String place = "";
  String gender = "";
  String phone = "";
  String email = "";
  String image = "";

  @override
  void initState() {
    super.initState();
    viewProfile();
  }

  Future<void> viewProfile() async {
    try {
      final pref = await SharedPreferences.getInstance();
      String ip = pref.getString("url").toString();
      String lid = pref.getString("lid").toString();

      String url = "$ip/viewprofile";

      var data = await http.post(Uri.parse(url), body: {'lid': lid});
      var jsondata = json.decode(data.body);

      if (jsondata != null) {
        setState(() {
          name = jsondata['name'].toString();
          dob = jsondata['dob'].toString();
          place = jsondata['place'].toString();
          gender = jsondata['gender'].toString();
          phone = jsondata['phone'].toString();
          email = jsondata['email'].toString();
          image = jsondata['image'] ?? "";
        });
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: image.isNotEmpty
                    ? NetworkImage(image)
                    : AssetImage('assets/avatar.png') as ImageProvider,
                backgroundColor: Colors.grey[300],
              ),
            ),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoRow(Icons.cake, 'DOB', dob),
                    buildInfoRow(Icons.location_on, 'Place', place),
                    buildInfoRow(Icons.wc, 'Gender', gender),
                    buildInfoRow(Icons.phone, 'Phone', phone),
                    buildInfoRow(Icons.email, 'Email', email),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            // ElevatedButton(
            //   onPressed: () {},
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.greenAccent,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10.0),
            //     ),
            //     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            //   ),
            //   child: Text(
            //     'Edit Profile',
            //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

