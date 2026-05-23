// // //
// //
// // import 'package:flutter/material.dart';
// // import 'complaint.dart';
// // import 'emergencycontact.dart';
// // import 'home.dart';
// // import 'login.dart';
// // import 'notification.dart';
// //
// // class Drawerclass extends StatelessWidget {
// //   const Drawerclass({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Drawer(
// //       child: ListView(
// //         padding: EdgeInsets.zero,
// //         children: <Widget>[
// //           const DrawerHeader(
// //             decoration: BoxDecoration(
// //               color: Colors.red,
// //             ),
// //             child: Text(
// //               "My App",
// //               style: TextStyle(color: Colors.black, fontSize: 24),
// //             ),
// //           ),
// //           ListTile(
// //             leading: const Icon(Icons.home),
// //             title: const Text("Home"),
// //             onTap: () {
// //               // Navigator.push(context, MaterialPageRoute(builder: (context) => const home()));
// //             },
// //           ),
// //
// //           ListTile(
// //             leading: const Icon(Icons.report_problem), // Complaint icon
// //             title: const Text("Send Complaints & View Reply"),
// //             onTap: () {
// //               Navigator.push(context, MaterialPageRoute(builder: (context) => complaint()));
// //             },
// //           ),
// //           ListTile(
// //             leading: const Icon(Icons.pets), // Animal-related icon
// //             title: const Text("Search & View animal for each division"),
// //             onTap: () {
// //               // Navigator.push(context, MaterialPageRoute(builder: (context) => feedback()));
// //             },
// //           ),
// //           ListTile(
// //             leading: const Icon(Icons.contact_phone), // Emergency contact icon
// //             title: const Text("View Emergency Contact details"),
// //             onTap: () {
// //               Navigator.push(context, MaterialPageRoute(builder: (context) => viewpaymentdetails(title: '',)));
// //             },
// //           ),
// //           ListTile(
// //             leading: const Icon(Icons.local_fire_department), // Fire detection icon
// //             title: const Text("View fire detection"),
// //             onTap: () {
// //               // Navigator.push(context, MaterialPageRoute(builder: (context) => YourScreen()));
// //             },
// //           ),
// //           ListTile(
// //             leading: const Icon(Icons.notifications), // Notification icon
// //             title: const Text("View notification"),
// //             onTap: () {
// //               Navigator.push(context, MaterialPageRoute(builder: (context) => viewnotification(title: '  ',)));
// //             },
// //           ),
// //           ListTile(
// //             leading: const Icon(Icons.logout), // Logout icon
// //             title: const Text("Logout"),
// //             onTap: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => const login()),
// //               );
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'complaint.dart';
// import 'emergencycontact.dart';
// import 'home.dart';
// import 'login.dart';
// import 'notification.dart';
//
// class Drawerclass extends StatelessWidget {
//   const Drawerclass({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: <Widget>[
//           UserAccountsDrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.redAccent,
//             ),
//             accountName: Text(
//               "Welcome",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             accountEmail: Text("myapp@example.com"),
//             currentAccountPicture: CircleAvatar(
//               backgroundColor: Colors.white,
//               child: Icon(Icons.person, size: 40, color: Colors.redAccent),
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: [
//                 _buildDrawerItem(Icons.home, "Home", () {
//                   // Navigator.push(context, MaterialPageRoute(builder: (context) => const home()));
//                 }),
//                 _buildDrawerItem(Icons.report_problem, "Send Complaints & View Reply", () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => complaint()));
//                 }),
//                 _buildDrawerItem(Icons.pets, "Search & View animal for each division", () {
//                   // Navigator.push(context, MaterialPageRoute(builder: (context) => feedback()));
//                 }),
//                 _buildDrawerItem(Icons.contact_phone, "View Emergency Contact details", () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => viewpaymentdetails(title: '',)));
//                 }),
//                 _buildDrawerItem(Icons.local_fire_department, "View fire detection", () {
//                   // Navigator.push(context, MaterialPageRoute(builder: (context) => YourScreen()));
//                 }),
//                 _buildDrawerItem(Icons.notifications, "View notification", () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => viewnotification(title: '  ',)));
//                 }),
//                 const Divider(), // Add a divider before logout
//                 _buildDrawerItem(Icons.logout, "Logout", () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const login()),
//                   );
//                 }),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.redAccent),
//       title: Text(title, style: TextStyle(fontSize: 16)),
//       trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
//       onTap: onTap,
//       hoverColor: Colors.red.shade50, // Subtle hover effect
//     );
//   }
// }
//

import 'package:flamewatch/animal%20detection.dart';
import 'package:flamewatch/view%20division.dart';
import 'package:flutter/material.dart';
import 'complaint.dart';
import 'emergencycontact.dart';
import 'fire detection.dart';
import 'home.dart';
import 'human detection.dart';
import 'login.dart';
import 'notification.dart';
import 'profile.dart';

class Drawerclass extends StatelessWidget {
  const Drawerclass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green, // Green header background
            ),
            accountName: Text(
              "Welcome",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text("FlameWatch"),
            // currentAccountPicture: CircleAvatar(
            //   backgroundColor: Colors.white,
            //   child: Icon(Icons.person, size: 40, color: Colors.green),
            // ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(Icons.home, "Home", () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const home()));
                }),
                _buildDrawerItem(Icons.account_circle, "Profile", () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                }),
                _buildDrawerItem(Icons.report_problem, "Send Complaints & View Reply", () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Complaint()));
                }),
                _buildDrawerItem(Icons.pets, "Search & View animal for each division", () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => division()));
                }),
                _buildDrawerItem(Icons.contact_phone, "View Emergency Contact details", () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPaymentDetails(title: '',)));
                }),
                _buildDrawerItem(Icons.local_fire_department, "View fire detection", () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => firedetection()));
                }),
                _buildDrawerItem(Icons.local_fire_department, "View animal detection", () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => animaldetection()));
                }),
                // _buildDrawerItem(Icons.local_fire_department, "View human detection", () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => humandetection()));
                // }),
                _buildDrawerItem(Icons.notifications, "View notification", () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNotification(title: '  ',)));
                }),
                const Divider(), // Green divider before logout
                _buildDrawerItem(Icons.logout, "Logout", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const login()),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.green), // Green icons
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
      hoverColor: Colors.green.shade50, // Subtle green hover effect
    );
  }
}

