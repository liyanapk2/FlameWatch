// import 'package:flutter/material.dart';
//
// import 'drawer.dart';
//
//
//
//
//
// class home extends StatefulWidget {
//   const home({Key? key}) : super(key: key);
//
//   @override
//   State<home> createState() => homeState();
// }
//
//
// class homeState extends State<home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: const Text("HOME"),
//         ),
//         drawer: const Drawerclass(),
//         body: SafeArea(
//             child:Container(decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/backg.png"),
//                   fit: BoxFit.cover,)
//             ),))
//     );
//   }
// }
//


import 'package:flutter/material.dart';
import 'drawer.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => homeState();
}

class homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "HOME",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green, // Green AppBar
        elevation: 5, // Adds a subtle shadow
      ),
      drawer: const Drawerclass(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/flame.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), // Light overlay effect
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Text(
                "FlameWatch",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

