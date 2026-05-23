
import 'dart:convert';
import 'package:flamewatch/ViewAnimal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class AnimalPage extends StatefulWidget {
  final String divisionId; // Accepting division ID

  const AnimalPage({Key? key, required this.divisionId}) : super(key: key);

  @override
  _AnimalState createState() => _AnimalState();
}

class _AnimalState extends State<AnimalPage> {
  List<String> ccid_ = <String>[];
  List<String> animal_ = <String>[];
  List<String> division_ = <String>[];
  List<String> description_ = <String>[];


  @override
  void initState() {
    super.initState();
    load(); // Load animals
  }
  List<String> image_ = <String>[]; // New list to store image URLs

  Future<void> load() async {
    List<String> ccid = <String>[];
    List<String> animal = <String>[];
    List<String> division = <String>[];
    List<String> description = <String>[];
    List<String> image = <String>[]; // New list for images

    try {
      final pref = await SharedPreferences.getInstance();
      String ip = pref.getString("url").toString();

      String url = ip + "view_useranimal";
      var data = await http.post(Uri.parse(url), body: {'did': widget.divisionId});
      var jsondata = json.decode(data.body);
      var arr = jsondata["data"];

      for (int i = 0; i < arr.length; i++) {
        ccid.add(arr[i]['id'].toString());
        animal.add(arr[i]['animal_name'].toString());
        division.add(arr[i]['division'].toString());
        description.add(arr[i]['description'].toString());
        image.add(pref.getString("imgurl").toString()+arr[i]['image'].toString()); // Store image URL
      }

      setState(() {
        ccid_ = ccid;
        animal_ = animal;
        division_ = division;
        description_ = description;
        image_ = image; // Update image list
      });
    } catch (e) {
      print("Error: " + e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animals in Division"),
        backgroundColor: Colors.green,
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
                    // Display Image
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
                    const SizedBox(height: 10),
                    Text(
                      "Animal: ${animal_[index]}",
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Division: ${division_[index]}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Description: ${description_[index]}",
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}
