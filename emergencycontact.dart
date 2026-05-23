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
// class viewpaymentdetails extends StatefulWidget {
//   const viewpaymentdetails({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<viewpaymentdetails> createState() => _viewpaymentdetails();
// }
//
//
// class _viewpaymentdetails extends State<viewpaymentdetails> {
//   int _counter = 0;
//
//   _viewpaymentdetails() {
//     view_college();
//   }
//
//
//
//   List<String> id_ = <String>[];
//   List<String> contactdetails_ = <String>[];
//   List<String> contact_ = <String>[];
//
//
//   Future<void> view_college() async {
//     List<String> id = <String>[];
//     List<String> contactdetails = <String>[];
//     List<String> contact = <String>[];
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
//       String url=ip+"viewcontact";
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
//         contactdetails.add(arr[i]['contactdetails'].toString());
//         contact.add(arr[i]['contact'].toString());
//         print("ppppppppppppppppppp");
//       }
//
//       setState(() {
//         id_ = id;
//         contactdetails_ = contactdetails;
//         contact_ = contact;
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
//                                   Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("contact details")])),
//                                   Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(contactdetails_[index])])),
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
//                                   Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("contact")])),
//                                   Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(contact_[index])])),
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
//


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewPaymentDetails extends StatefulWidget {
  const ViewPaymentDetails({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ViewPaymentDetails> createState() => _ViewPaymentDetailsState();
}

class _ViewPaymentDetailsState extends State<ViewPaymentDetails> {
  _ViewPaymentDetailsState() {
    loadPaymentDetails();
  }

  List<String> id_ = [];
  List<String> contactDetails_ = [];
  List<String> contact_ = [];

  Future<void> loadPaymentDetails() async {
    List<String> id = [];
    List<String> contactDetails = [];
    List<String> contact = [];
    try {
      final pref = await SharedPreferences.getInstance();
      String lid = pref.getString("lid").toString();
      String ip = pref.getString("url").toString();
      String url = ip + "viewcontact";
      var data = await http.post(Uri.parse(url), body: {'lid': lid});
      var jsondata = json.decode(data.body);
      var arr = jsondata["data"];
      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        contactDetails.add(arr[i]['contactdetails'].toString());
        contact.add(arr[i]['contact'].toString());
      }
      setState(() {
        id_ = id;
        contactDetails_ = contactDetails;
        contact_ = contact;
      });
    } catch (e) {
      print("Error: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency contacts", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: id_.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Contact Details:",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Expanded(
                          child: Text(contactDetails_[index],
                              textAlign: TextAlign.right,
                              style: const TextStyle(fontSize: 16, color: Colors.black54)),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Contact:",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Expanded(
                          child: Text(contact_[index],
                              textAlign: TextAlign.right,
                              style: const TextStyle(fontSize: 16, color: Colors.black54)),
                        ),
                      ],
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

