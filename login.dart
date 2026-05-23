// import 'dart:convert';
//
//
// import 'package:flamewatch/register.dart';
// import 'package:flutter/material.dart';
//
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// import 'home.dart';
//
//
// class login extends StatefulWidget {
//   const login({super.key});
//
//   @override
//   State<login> createState() => _loginState();
// }
//
// class _loginState extends State<login> {
//
//
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Login"),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: usernameController,
//                   decoration: const InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(),
//                     hintText: "Username",
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: passwordController,
//                   decoration: const InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(),
//                     hintText: "Password",
//                   ),
//                 ),
//               ),
//               Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) => Registration()));
//                         },
//                         child: Text("Registration"),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: ElevatedButton(
//                         onPressed: ()async {
//                           final sh = await SharedPreferences.getInstance();
//                           String Uname=usernameController.text.toString();
//                           String Passwd=passwordController.text.toString();
//                           String url = sh.getString("url").toString();
//                           print("okkkkkkkkkkkkkkkkk");
//                           var data = await http.post(
//                               Uri.parse(url+"logincode"),
//                               body: {'username':Uname,
//                                 "password":Passwd,
//                               });
//                           var jasondata = json.decode(data.body);
//                           String status=jasondata['task'].toString();
//                           String type=jasondata['type'].toString();
//                           if(status=="valid") {
//                             if (type == 'user') {
//                               String lid = jasondata['lid'].toString();
//                               sh.setString("lid", lid);
//                               Navigator.push(context,
//                                   MaterialPageRoute(
//                                       builder: (context) => home()));
//                             }
//                             else if (type == 'conductor') {
//                               String lid = jasondata['lid'].toString();
//                               sh.setString("lid", lid);
//                               // Navigator.push(context,
//                               //     MaterialPageRoute(
//                               //         builder: (context) => CONHOME()));
//                             }
//                             else{
//                               print("error");
//
//                             }
//                           }
//                           else{
//                             print("error");
//
//                           }
//
//                         },
//                         child: const Text("Login"),
//                       ),
//                     )
//                   ]),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flamewatch/register.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            // key: _formKey, // Add a GlobalKey for form validation
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Username Field
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.shade200,
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Username",
                      prefixIcon: Icon(Icons.person, color: Colors.green),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username is required'; // Field cannot be empty
                      } else if (value.length < 3) {
                        return 'Username must be at least 3 characters'; // Minimum length
                      }
                      return null; // Return null if the input is valid
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Password Field
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.shade200,
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock, color: Colors.green),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required'; // Field cannot be empty
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters'; // Minimum length
                      }
                      return null; // Return null if the input is valid
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Register and Login Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Register Button
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => UserRegistration()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                          elevation: 5,
                        ),
                        child: Text("Register", style: TextStyle(color: Colors.white)),
                      ),
                    ),

                    // Login Button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          // Validate the form before proceeding
                          // if (_formKey.currentState!.validate()) {
                            final sh = await SharedPreferences.getInstance();
                            String Uname = usernameController.text.toString();
                            String Passwd = passwordController.text.toString();
                            String url = sh.getString("url").toString();

                            var data = await http.post(
                              Uri.parse(url + "logincode"),
                              body: {'username': Uname, "password": Passwd},
                            );
                            var jasondata = json.decode(data.body);
                            String status = jasondata['task'].toString();
                            String type = jasondata['type'].toString();

                            if (status == "valid") {
                              if (type == 'user') {

                                String lid = jasondata['lid'].toString();
                                sh.setString("lid", lid);
                                Fluttertoast.showToast(
                                  msg: "Login Successful!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => home()));
                              } else if (type == 'conductor') {
                                String lid = jasondata['lid'].toString();
                                sh.setString("lid", lid);
                              } else {
                                print("error");
                              }
                            } else {
                              print("error");
                            }

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                          elevation: 5,
                        ),
                        child: const Text("Login", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'home.dart';
// import 'register.dart'; // Import the registration page
//
// class login extends StatefulWidget {
//   const login({super.key});
//
//   @override
//   State<login> createState() => _loginState();
// }
//
// class _loginState extends State<login> {
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   // Form key for validation
//   final _formKey = GlobalKey<FormState>();
//
//   // Regular expressions for validation
//   final RegExp usernameRegExp = RegExp(r'^[A-Za-z]{3,25}$'); // Username must be 3-25 characters
//   final RegExp passwordRegExp = RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$'); // Password must contain at least 8 characters, including uppercase, lowercase, and numbers
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green[100],
//       appBar: AppBar(
//         title: const Text(
//           "Login",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.green,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Form(
//             key: _formKey, // Assign the form key
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Username Field
//                 Container(
//                   padding: const EdgeInsets.all(12.0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.green.shade200,
//                         blurRadius: 8,
//                         spreadRadius: 2,
//                       ),
//                     ],
//                   ),
//                   child: TextFormField(
//                     controller: usernameController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12.0),
//                         borderSide: BorderSide.none,
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                       labelText: "Username",
//                       prefixIcon: Icon(Icons.person, color: Colors.green),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your username';
//                       } else if (!usernameRegExp.hasMatch(value)) {
//                         return 'Username must be 3-25 characters';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 // Password Field
//                 Container(
//                   padding: const EdgeInsets.all(12.0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.green.shade200,
//                         blurRadius: 8,
//                         spreadRadius: 2,
//                       ),
//                     ],
//                   ),
//                   child: TextFormField(
//                     controller: passwordController,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12.0),
//                         borderSide: BorderSide.none,
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                       labelText: "Password",
//                       prefixIcon: Icon(Icons.lock, color: Colors.green),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       } else if (!passwordRegExp.hasMatch(value)) {
//                         return 'Password must contain at least 8 characters, including uppercase, lowercase, and numbers';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 // Register and Login Buttons
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Register Button
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                               context, MaterialPageRoute(builder: (context) => UserRegistration()));
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12.0),
//                           ),
//                           padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//                           elevation: 5,
//                         ),
//                         child: Text("Register", style: TextStyle(color: Colors.white)),
//                       ),
//                     ),
//
//                     // Login Button
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: ElevatedButton(
//                         onPressed: () async {
//                           if (_formKey.currentState!.validate()) {
//                             final sh = await SharedPreferences.getInstance();
//                             String Uname = usernameController.text.toString();
//                             String Passwd = passwordController.text.toString();
//                             String url = sh.getString("url").toString();
//
//                             var data = await http.post(
//                               Uri.parse(url + "logincode"),
//                               body: {'username': Uname, "password": Passwd},
//                             );
//                             var jasondata = json.decode(data.body);
//                             String status = jasondata['task'].toString();
//                             String type = jasondata['type'].toString();
//
//                             if (status == "valid") {
//                               if (type == 'user') {
//                                 String lid = jasondata['lid'].toString();
//                                 sh.setString("lid", lid);
//                                 Navigator.push(
//                                     context, MaterialPageRoute(builder: (context) => home()));
//                               } else if (type == 'conductor') {
//                                 String lid = jasondata['lid'].toString();
//                                 sh.setString("lid", lid);
//                               } else {
//                                 print("error");
//                               }
//                             } else {
//                               print("error");
//                             }
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12.0),
//                           ),
//                           padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//                           elevation: 5,
//                         ),
//                         child: const Text("Login", style: TextStyle(color: Colors.white)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }