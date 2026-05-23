// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:http/http.dart' as http;
// // import 'login.dart';
// // import 'dart:io';
// // import 'package:image_picker/image_picker.dart';
// //
// // class Registration extends StatefulWidget {
// //   const Registration({Key? key}) : super(key: key);
// //
// //   @override
// //   _RegistrationState createState() => _RegistrationState();
// // }
// //
// // class _RegistrationState extends State<Registration> {
// //   TextEditingController dateInputController = TextEditingController();
// //   final TextEditingController nameController = TextEditingController();
// //   final TextEditingController placeController = TextEditingController();
// //   final TextEditingController genderController = TextEditingController();
// //   final TextEditingController postController = TextEditingController();
// //   final TextEditingController phoneController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController usernameController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   String? selectedGender;
// //   final _formKey = GlobalKey<FormState>(); // Form key
// //
// //   // Function to pick date
// //   Future<void> _selectDate(BuildContext context) async {
// //     DateTime? pickedDate = await showDatePicker(
// //       context: context,
// //       initialDate: DateTime.now(),
// //       firstDate: DateTime(1900),
// //       lastDate: DateTime.now(),
// //     );
// //
// //     if (pickedDate != null) {
// //       setState(() {
// //         dateInputController.text =
// //         "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
// //       });
// //     }
// //   }
// //   XFile? _image;
// //
// //   _imgFromCamera() async {
// //     XFile? image = await ImagePicker().pickImage(
// //       source: ImageSource.camera,
// //       imageQuality: 50,
// //     );
// //     if (image != null) {
// //       setState(() {
// //         _image = image;
// //       });
// //     }
// //   }
// //
// //   _imgFromGallery() async {
// //     XFile? image = await ImagePicker().pickImage(
// //       source: ImageSource.gallery,
// //     );
// //     if (image != null) {
// //       setState(() {
// //         _image = image;
// //       });
// //     }
// //   }
// //
// //   void _showPicker(context) {
// //     showModalBottomSheet(
// //       context: context,
// //       builder: (BuildContext bc) {
// //         return SafeArea(
// //           child: Container(
// //             child: new Wrap(
// //               children: <Widget>[
// //                 new ListTile(
// //                   leading: new Icon(Icons.photo_library),
// //                   title: new Text('Photo Library'),
// //                   onTap: () {
// //                     _imgFromGallery();
// //                     Navigator.of(context).pop();
// //                   },
// //                 ),
// //                 new ListTile(
// //                   leading: new Icon(Icons.photo_camera),
// //                   title: new Text('Camera'),
// //                   onTap: () {
// //                     _imgFromCamera();
// //                     Navigator.of(context).pop();
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(title: const Text("FlameWatch")),
// //       body: SafeArea(
// //         child: Form(
// //           key: _formKey,
// //           child: SingleChildScrollView(
// //             child: Column(children: [
// //               const Padding(
// //                 padding: EdgeInsets.all(8.0),
// //                 child: Align(
// //                   alignment: Alignment.center,
// //                   child: Text(
// //                     "Register",
// //                     style: TextStyle(
// //                       fontSize: 25,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.blue,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //
// //               Padding(
// //                 padding: EdgeInsets.all(8.0),
// //                 child: Center(
// //                   child: GestureDetector(
// //                     onTap: () {
// //                       _showPicker(context);
// //                     },
// //                     child: CircleAvatar(
// //                       radius: 55,
// //                       backgroundColor: Color(0xffdbd8cd),
// //                       child: _image != null
// //                           ? ClipRRect(
// //                         borderRadius: BorderRadius.circular(50),
// //                         child: Image.file(
// //                           File(_image!.path),
// //                           width: 100,
// //                           height: 100,
// //                           fit: BoxFit.cover,
// //                         ),
// //                       )
// //                           : Container(
// //                         decoration: BoxDecoration(
// //                           color: Colors.grey[200],
// //                           borderRadius: BorderRadius.circular(50),
// //                         ),
// //                         width: 100,
// //                         height: 100,
// //                         child: Icon(
// //                           Icons.camera_alt,
// //                           color: Colors.grey[800],
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //
// //               Padding(
// //                 padding: EdgeInsets.all(8.0),
// //                 child: TextFormField(
// //                   controller: nameController,
// //                   decoration: InputDecoration(
// //                     fillColor: Colors.white,
// //                     border: OutlineInputBorder(),
// //                     hintText: "Name",
// //                   ),
// //                   validator: (value) {
// //                     if (value!.isEmpty) {
// //                       return 'Please enter your name';
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //               ),
// //               // DOB with DatePicker
// //               Padding(
// //                 padding: EdgeInsets.all(8.0),
// //                 child: TextFormField(
// //                   controller: dateInputController,
// //                   decoration: InputDecoration(
// //                     fillColor: Colors.white,
// //                     border: OutlineInputBorder(),
// //                     hintText: "DOB",
// //                     suffixIcon: IconButton(
// //                       icon: Icon(Icons.calendar_today),
// //                       onPressed: () => _selectDate(context),
// //                     ),
// //                   ),
// //                   readOnly: true,
// //                   validator: (value) {
// //                     if (value!.isEmpty) {
// //                       return 'Please enter DOB';
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //               ),
// //               Padding(
// //                 padding: EdgeInsets.all(8.0),
// //                 child: TextFormField(
// //                   controller: placeController,
// //                   decoration: InputDecoration(
// //                     fillColor: Colors.white,
// //                     border: OutlineInputBorder(),
// //                     hintText: "Place",
// //                   ),
// //                   validator: (value) {
// //                     if (value!.isEmpty) {
// //                       return 'Please enter your place';
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //               ),
// //               Padding(
// //                 padding: EdgeInsets.all(8.0),
// //                 child: TextFormField(
// //                   controller: genderController,
// //                   decoration: InputDecoration(
// //                     fillColor: Colors.white,
// //                     border: OutlineInputBorder(),
// //                     hintText: "Gender",
// //                   ),
// //                   validator: (value) {
// //                     if (value!.isEmpty) {
// //                       return 'Please enter your gender';
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //               ),
// //               Padding(
// //                 padding: EdgeInsets.all(8.0),
// //                 child: TextFormField(
// //                   controller: phoneController,
// //                   decoration: InputDecoration(
// //                     fillColor: Colors.white,
// //                     border: OutlineInputBorder(),
// //                     hintText: "Phone",
// //                   ),
// //                 ),
// //               ),
// //               Padding(
// //                 padding: EdgeInsets.all(8.0),
// //                 child: TextFormField(
// //                   controller: emailController,
// //                   decoration: InputDecoration(
// //                     fillColor: Colors.white,
// //                     border: OutlineInputBorder(),
// //                     hintText: "Email",
// //                   ),
// //                 ),
// //               ),
// //               Padding(
// //                 padding: EdgeInsets.all(8.0),
// //                 child: TextFormField(
// //                   controller: usernameController,
// //                   decoration: InputDecoration(
// //                     fillColor: Colors.white,
// //                     border: OutlineInputBorder(),
// //                     hintText: "Username",
// //                   ),
// //                   validator: (value) {
// //                     if (value!.isEmpty) {
// //                       return 'Please enter your username';
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //               ),
// //               Padding(
// //                 padding: EdgeInsets.all(8.0),
// //                 child: TextFormField(
// //                   controller: passwordController,
// //                   decoration: InputDecoration(
// //                     fillColor: Colors.white,
// //                     border: OutlineInputBorder(),
// //                     hintText: "Password",
// //                   ),
// //                   validator: (value) {
// //                     if (value!.isEmpty) {
// //                       return 'Please enter your password';
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //               ),
// //               Padding(
// //                 padding: EdgeInsets.all(8.0),
// //                 child: ElevatedButton.icon(
// //                   onPressed: () async {
// //                     if (!_formKey.currentState!.validate()) {
// //                       print("Validation failed");
// //                     } else {
// //                       final sh = await SharedPreferences.getInstance();
// //                       String name = nameController.text.toString();
// //                       String dob = dateInputController.text.toString();
// //                       String place = placeController.text.toString();
// //                       String gender = genderController.text.toString();
// //                       String post = postController.text.toString();
// //                       String phone = phoneController.text.toString();
// //                       String email = emailController.text.toString();
// //                       String uname = usernameController.text.toString();
// //                       String password = passwordController.text.toString();
// //
// //                       String url = sh.getString("url").toString();
// //                       print("Processing registration...");
// //
// //                       var data = await http.post(
// //                         Uri.parse(url + "userregistration"),
// //                         body: {
// //                           'name': name,
// //                           'dob': dob,
// //                           'place': place,
// //                           'gender': gender,
// //                           'post': post,
// //                           'phone': phone,
// //                           'email': email,
// //                           'username': uname,
// //                           'password': password,
// //                           'lid': sh.getString("lid").toString(),
// //                         },
// //                       );
// //
// //                       var jsonData = json.decode(data.body);
// //                       String status = jsonData['task'].toString();
// //
// //                       if (status == "valid") {
// //                         // Show success message
// //                         ScaffoldMessenger.of(context).showSnackBar(
// //                           SnackBar(
// //                             content: Text("Registration successful!"),
// //                             backgroundColor: Colors.green,
// //                             duration: Duration(seconds: 3),
// //                           ),
// //                         );
// //
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(builder: (context) => login()),
// //                         );
// //                       } else {
// //                         print("Error in registration: ${jsonData['message'] ?? 'Unknown error'}");
// //                       }
// //                     }
// //                   },
// //
// //                   icon: Icon(Icons.send),
// //                   label: Text('Submit'),
// //                   style: ButtonStyle(
// //                     backgroundColor: MaterialStateProperty.all<Color>(
// //                       Color(0xFF6ADC50),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ]),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// //
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:io';
// // import 'package:image_picker/image_picker.dart';
// // import 'login.dart';
// //
// // class SignUpForm extends StatefulWidget {
// //   const SignUpForm({super.key});
// //
// //   @override
// //   State<SignUpForm> createState() => _SignUpFormState();
// // }
// //
// // class _SignUpFormState extends State<SignUpForm> {
// //   TextEditingController firstnameController = TextEditingController();
// //   TextEditingController placeController = TextEditingController();
// //   TextEditingController emailController = TextEditingController();
// //   TextEditingController phoneNumberController = TextEditingController();
// //   TextEditingController usernameController = TextEditingController();
// //   TextEditingController passwordController = TextEditingController();
// //   TextEditingController dateController = TextEditingController();
// //   bool _obscurePassword = true;
// //   String? selectedGender;
// //
// //   final RegExp nameRegExp = RegExp(r'^[A-Za-z ]{2,25}$');
// //   final RegExp placeRegExp = RegExp(r'^[A-Za-z0-9 ]{2,25}$');
// //   final RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,25}$');
// //   final RegExp _phoneReguser = RegExp(r'^[6789]\d{9}$');
// //   final RegExp UnameRegExp = RegExp(r'^[A-Za-z]{3,25}$');
// //   final RegExp passwordRegExp = RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$');
// //
// //   XFile? _image;
// //
// //   _imgFromCamera() async {
// //     XFile? image = await ImagePicker().pickImage(
// //       source: ImageSource.camera,
// //       imageQuality: 50,
// //     );
// //     if (image != null) {
// //       setState(() {
// //         _image = image;
// //       });
// //     }
// //   }
// //
// //   _imgFromGallery() async {
// //     XFile? image = await ImagePicker().pickImage(
// //       source: ImageSource.gallery,
// //     );
// //     if (image != null) {
// //       setState(() {
// //         _image = image;
// //       });
// //     }
// //   }
// //
// //   void _showPicker(context) {
// //     showModalBottomSheet(
// //       context: context,
// //       builder: (BuildContext bc) {
// //         return SafeArea(
// //           child: Container(
// //             child: Wrap(
// //               children: <Widget>[
// //                 ListTile(
// //                   leading: Icon(Icons.photo_library),
// //                   title: Text('Photo Library'),
// //                   onTap: () {
// //                     _imgFromGallery();
// //                     Navigator.of(context).pop();
// //                   },
// //                 ),
// //                 ListTile(
// //                   leading: Icon(Icons.photo_camera),
// //                   title: Text('Camera'),
// //                   onTap: () {
// //                     _imgFromCamera();
// //                     Navigator.of(context).pop();
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// //
// //   Future<void> _selectDate(BuildContext context) async {
// //     final DateTime? picked = await showDatePicker(
// //       context: context,
// //       initialDate: DateTime.now(),
// //       firstDate: DateTime(1900),
// //       lastDate: DateTime.now(),
// //     );
// //     if (picked != null) {
// //       setState(() {
// //         dateController.text = "${picked.toLocal()}".split(' ')[0];
// //       });
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("User Registration"),
// //       ),
// //       body: Form(
// //         child: SingleChildScrollView(
// //           padding: const EdgeInsets.all(30.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Padding(
// //                 padding: EdgeInsets.all(8.0),
// //                 child: Center(
// //                   child: GestureDetector(
// //                     onTap: () {
// //                       _showPicker(context);
// //                     },
// //                     child: CircleAvatar(
// //                       radius: 55,
// //                       backgroundColor: Color(0xffdbd8cd),
// //                       child: _image != null
// //                           ? ClipRRect(
// //                         borderRadius: BorderRadius.circular(50),
// //                         child: Image.file(
// //                           File(_image!.path),
// //                           width: 100,
// //                           height: 100,
// //                           fit: BoxFit.cover,
// //                         ),
// //                       )
// //                           : Container(
// //                         decoration: BoxDecoration(
// //                           color: Colors.grey[200],
// //                           borderRadius: BorderRadius.circular(50),
// //                         ),
// //                         width: 100,
// //                         height: 100,
// //                         child: Icon(
// //                           Icons.camera_alt,
// //                           color: Colors.grey[800],
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //               _buildTitle("Personal Information"),
// //               const SizedBox(height: 20),
// //               _buildTextField(
// //                 controller: firstnameController,
// //                 label: "First Name",
// //                 icon: Icons.person_outline,
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please enter your firstname';
// //                   } else if (!nameRegExp.hasMatch(value)) {
// //                     return 'Name must be between 2 and 25 characters, including uppercase and lowercase letters';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               const SizedBox(height: 20),
// //               _buildTextField(
// //                 controller: emailController,
// //                 label: "Email",
// //                 icon: Icons.email,
// //                 keyboardType: TextInputType.emailAddress,
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please enter your email';
// //                   } else if (!emailRegExp.hasMatch(value)) {
// //                     return 'Invalid email format';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               const SizedBox(height: 20),
// //               _buildTextField(
// //                 controller: phoneNumberController,
// //                 label: "Phone",
// //                 icon: Icons.phone,
// //                 keyboardType: TextInputType.phone,
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please enter your phone number';
// //                   } else if (!_phoneReguser.hasMatch(value)) {
// //                     return 'Phone number must be 10 digits and start with 6,7,8, or 9';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               const SizedBox(height: 20),
// //               _buildTextField(
// //                 controller: placeController,
// //                 label: "Place",
// //                 icon: Icons.place,
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please enter your place';
// //                   } else if (!placeRegExp.hasMatch(value)) {
// //                     return 'Place must be between 2 and 25 characters';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               const SizedBox(height: 20),
// //               InkWell(
// //                 onTap: () => _selectDate(context),
// //                 child: IgnorePointer(
// //                   child: _buildTextField(
// //                     controller: dateController,
// //                     label: "Date of Birth",
// //                     icon: Icons.calendar_today,
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //               DropdownButtonFormField<String>(
// //                 value: selectedGender,
// //                 onChanged: (String? newValue) {
// //                   setState(() {
// //                     selectedGender = newValue;
// //                   });
// //                 },
// //                 items: <String>['Male', 'Female', 'Other']
// //                     .map<DropdownMenuItem<String>>((String value) {
// //                   return DropdownMenuItem<String>(
// //                     value: value,
// //                     child: Text(value),
// //                   );
// //                 }).toList(),
// //                 decoration: InputDecoration(
// //                   labelText: "Gender",
// //                   prefixIcon: Icon(Icons.person_outline),
// //                 ),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please select your gender';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               const SizedBox(height: 20),
// //               _buildTextField(
// //                 controller: usernameController,
// //                 label: "Username",
// //                 icon: Icons.person_outline,
// //               ),
// //               const SizedBox(height: 20),
// //               _buildTextField(
// //                 controller: passwordController,
// //                 label: "Password",
// //                 icon: Icons.password_outlined,
// //                 obscureText: _obscurePassword,
// //                 suffixIcon: IconButton(
// //                   icon: Icon(_obscurePassword
// //                       ? Icons.visibility_outlined
// //                       : Icons.visibility_off_outlined),
// //                   onPressed: () {
// //                     setState(() {
// //                       _obscurePassword = !_obscurePassword;
// //                     });
// //                   },
// //                 ),
// //               ),
// //               const SizedBox(height: 40),
// //               Center(
// //                 child: ElevatedButton(
// //                   onPressed: () async {
// //                     final sh = await SharedPreferences.getInstance();
// //                     String firstname = firstnameController.text;
// //                     String place = placeController.text;
// //                     String email = emailController.text;
// //                     String phoneNumber = phoneNumberController.text;
// //                     String username = usernameController.text;
// //                     String password = passwordController.text;
// //                     String dateOfBirth = dateController.text;
// //                     String gender = selectedGender ?? '';
// //                     String url = sh.getString("url").toString();
// //                     print(url);
// //                     try {
// //                       var uri = Uri.parse(url + 'userregistration');  // Replace with your Express server URL
// //                       var request = http.MultipartRequest('POST', uri);
// //
// //                       request.files.add(await http.MultipartFile.fromPath('image', _image!.path));
// //                       request.fields['name'] = firstname;
// //                       request.fields['email'] = email;
// //                       request.fields['place'] = place;
// //                       request.fields['phone'] = phoneNumber;
// //                       request.fields['username'] = username;
// //                       request.fields['password'] = password;
// //                       request.fields['dob'] = dateOfBirth;
// //                       request.fields['gender'] = gender;
// //                       var response = await request.send();
// //
// //                       if (response.statusCode == 200) {
// //                         print('Image uploaded successfully');
// //                         ScaffoldMessenger.of(context).showSnackBar(
// //                           SnackBar(
// //                             content: Text('Successfully Registered'),
// //                             duration: Duration(seconds: 4),
// //                           ),
// //                         );
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                               builder: (context) => login()),
// //                         );
// //                       }
// //                     } catch (e) {
// //                       print(e);
// //                     }
// //                   },
// //                   child: const Text("Sign Up"),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildTitle(String title) {
// //     return Text(
// //       title,
// //       style: TextStyle(
// //         fontSize: 24,
// //         fontWeight: FontWeight.bold,
// //         color: Theme.of(context).colorScheme.primary,
// //       ),
// //     );
// //   }
// //
// //   Widget _buildTextField({
// //     required TextEditingController controller,
// //     required String label,
// //     required IconData icon,
// //     bool obscureText = false,
// //     TextInputType keyboardType = TextInputType.text,
// //     Widget? suffixIcon,
// //     FormFieldValidator<String>? validator,
// //   }) {
// //     return TextFormField(
// //       controller: controller,
// //       keyboardType: keyboardType,
// //       obscureText: obscureText,
// //       decoration: InputDecoration(
// //         labelText: label,
// //         prefixIcon: Icon(icon),
// //         suffixIcon: suffixIcon,
// //       ),
// //       validator: validator,
// //     );
// //   }
// //
//
//
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'login.dart';
//
// class UserRegistration extends StatefulWidget {
//   @override
//   _UserRegistrationState createState() => _UserRegistrationState();
// }
//
// class _UserRegistrationState extends State<UserRegistration> {
//   File? _image;
//   final picker = ImagePicker();
//
//   Future _showPicker(context) async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _image = pickedFile != null ? File(pickedFile.path) : null;
//     });
//   }
//
//   bool _obscurePassword = true;
//   String? selectedGender;
//
//   final firstnameController = TextEditingController();
//   final emailController = TextEditingController();
//   final phoneNumberController = TextEditingController();
//   final placeController = TextEditingController();
//   final dateController = TextEditingController();
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.green.shade200, Colors.green.shade700],
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(25.0),
//             child: Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//               elevation: 5,
//               color: Colors.white,
//               child: Padding(
//                 padding: const EdgeInsets.all(25.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Center(
//                       child: GestureDetector(
//                         onTap: () => _showPicker(context),
//                         child: CircleAvatar(
//                           radius: 55,
//                           backgroundColor: Colors.blueAccent.withOpacity(0.2),
//                           child: _image != null
//                               ? ClipRRect(
//                             borderRadius: BorderRadius.circular(50),
//                             child: Image.file(
//                               File(_image!.path),
//                               width: 100,
//                               height: 100,
//                               fit: BoxFit.cover,
//                             ),
//                           )
//                               : Icon(
//                             Icons.camera_alt,
//                             color: Colors.green.shade700,
//                             size: 40,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     _buildTitle("Personal Information"),
//                     const SizedBox(height: 20),
//                     _buildTextField(controller: firstnameController, label: "First Name", icon: Icons.person_outline),
//                     const SizedBox(height: 15),
//                     _buildTextField(controller: emailController, label: "Email", icon: Icons.email, keyboardType: TextInputType.emailAddress),
//                     const SizedBox(height: 15),
//                     _buildTextField(controller: phoneNumberController, label: "Phone", icon: Icons.phone, keyboardType: TextInputType.phone),
//                     const SizedBox(height: 15),
//                     _buildTextField(controller: placeController, label: "Place", icon: Icons.place),
//                     const SizedBox(height: 15),
//                     InkWell(
//                       onTap: () => _selectDate(context),
//                       child: IgnorePointer(child: _buildTextField(controller: dateController, label: "Date of Birth", icon: Icons.calendar_today)),
//                     ),
//                     const SizedBox(height: 15),
//                     DropdownButtonFormField<String>(
//                       value: selectedGender,
//                       onChanged: (String? newValue) => setState(() => selectedGender = newValue),
//                       items: <String>['Male', 'Female', 'Other'].map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       decoration: InputDecoration(
//                         labelText: "Gender",
//                         prefixIcon: Icon(Icons.person_outline, color: Colors.green),
//                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                         filled: true,
//                         fillColor: Colors.blueAccent.withOpacity(0.1),
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     _buildTextField(controller: usernameController, label: "Username", icon: Icons.person_outline),
//                     const SizedBox(height: 15),
//                     _buildTextField(
//                       controller: passwordController,
//                       label: "Password",
//                       icon: Icons.password_outlined,
//                       obscureText: _obscurePassword,
//                       suffixIcon: IconButton(
//                         icon: Icon(_obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
//                         onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
//                       ),
//                     ),
//                     const SizedBox(height: 30),
//                     Center(
//                       child: ElevatedButton(
//                         onPressed: () async {
//                           final sh = await SharedPreferences.getInstance();
//                           String url = sh.getString("url").toString();
//
//                           try {
//                             var uri = Uri.parse(url + 'userregistration');
//                             var request = http.MultipartRequest('POST', uri);
//                             request.fields['name'] = firstnameController.text;
//                             request.fields['email'] = emailController.text;
//                             request.fields['place'] = placeController.text;
//                             request.fields['phone'] = phoneNumberController.text;
//                             request.fields['username'] = usernameController.text;
//                             request.fields['password'] = passwordController.text;
//                             request.fields['dob'] = dateController.text;
//                             request.fields['gender'] = selectedGender ?? '';
//                             if (_image != null) {
//                               request.files.add(await http.MultipartFile.fromPath('image', _image!.path));
//                             }
//
//                             var response = await request.send();
//
//                             if (response.statusCode == 200) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text('Successfully Registered'), duration: Duration(seconds: 3)),
//                               );
//                               Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
//                             }
//                           } catch (e) {
//                             print(e);
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                           backgroundColor: Colors.green,
//                         ),
//                         child: Text("Sign Up", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTitle(String title) {
//     return Text(
//       title,
//       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green.shade700),
//     );
//   }
//
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required IconData icon,
//     bool obscureText = false,
//     TextInputType keyboardType = TextInputType.text,
//     Widget? suffixIcon,
//   }) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon, color: Colors.green),
//         suffixIcon: suffixIcon,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//         filled: true,
//         fillColor: Colors.blueAccent.withOpacity(0.1),
//       ),
//     );
//   }
//
//   Future<void> _selectDate(BuildContext context) async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null) {
//       setState(() {
//         dateController.text = "${picked.toLocal()}".split(' ')[0];
//       });
//     }
//   }
// }





import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class UserRegistration extends StatefulWidget {
  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  File? _image;
  final picker = ImagePicker();

  Future _showPicker(context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  bool _obscurePassword = true;
  String? selectedGender;

  final firstnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final placeController = TextEditingController();
  final dateController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // Form key for validation

  // Regular expressions for validation
  final RegExp nameRegExp = RegExp(r'^[A-Za-z ]{2,25}$');
  final RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,25}$');
  final RegExp phoneRegExp = RegExp(r'^[6789]\d{9}$');
  final RegExp placeRegExp = RegExp(r'^[A-Za-z0-9 ]{2,25}$');
  final RegExp usernameRegExp = RegExp(r'^[A-Za-z]{3,25}$');
  final RegExp passwordRegExp = RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade200, Colors.green.shade700],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 5,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Form(
                  key: _formKey, // Assign the form key
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () => _showPicker(context),
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.blueAccent.withOpacity(0.2),
                            child: _image != null
                                ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                File(_image!.path),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            )
                                : Icon(
                              Icons.camera_alt,
                              color: Colors.green.shade700,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildTitle("Personal Information"),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: firstnameController,
                        label: "First Name",
                        icon: Icons.person_outline,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          } else if (!nameRegExp.hasMatch(value)) {
                            return 'Name must be between 2 and 25 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(
                        controller: emailController,
                        label: "Email",
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!emailRegExp.hasMatch(value)) {
                            return 'Invalid email format';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(
                        controller: phoneNumberController,
                        label: "Phone",
                        icon: Icons.phone,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          } else if (!phoneRegExp.hasMatch(value)) {
                            return 'Phone number must be 10 digits and start with 6, 7, 8, or 9';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(
                        controller: placeController,
                        label: "Place",
                        icon: Icons.place,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your place';
                          } else if (!placeRegExp.hasMatch(value)) {
                            return 'Place must be between 2 and 25 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () => _selectDate(context),
                        child: IgnorePointer(
                          child: _buildTextField(
                            controller: dateController,
                            label: "Date of Birth",
                            icon: Icons.calendar_today,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select your date of birth';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      DropdownButtonFormField<String>(
                        value: selectedGender,
                        onChanged: (String? newValue) => setState(() => selectedGender = newValue),
                        items: <String>['Male', 'Female', 'Other'].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: "Gender",
                          prefixIcon: Icon(Icons.person_outline, color: Colors.green),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.blueAccent.withOpacity(0.1),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your gender';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(
                        controller: usernameController,
                        label: "Username",
                        icon: Icons.person_outline,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          } else if (!usernameRegExp.hasMatch(value)) {
                            return 'Username must be between 3 and 25 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(
                        controller: passwordController,
                        label: "Password",
                        icon: Icons.password_outlined,
                        obscureText: _obscurePassword,
                        suffixIcon: IconButton(
                          icon: Icon(_obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (!passwordRegExp.hasMatch(value)) {
                            return 'Password must contain at least 8 characters, including uppercase, lowercase, and numbers';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final sh = await SharedPreferences.getInstance();
                              String url = sh.getString("url").toString();

                              try {
                                var uri = Uri.parse(url + 'userregistration');
                                var request = http.MultipartRequest('POST', uri);
                                request.fields['name'] = firstnameController.text;
                                request.fields['email'] = emailController.text;
                                request.fields['place'] = placeController.text;
                                request.fields['phone'] = phoneNumberController.text;
                                request.fields['username'] = usernameController.text;
                                request.fields['password'] = passwordController.text;
                                request.fields['dob'] = dateController.text;
                                request.fields['gender'] = selectedGender ?? '';
                                if (_image != null) {
                                  request.files.add(await http.MultipartFile.fromPath('image', _image!.path));
                                }

                                var response = await request.send();

                                if (response.statusCode == 200) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Successfully Registered'), duration: Duration(seconds: 3)),
                                  );
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.green,
                          ),
                          child: Text("Sign Up", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green.shade700),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
    FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.green),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.blueAccent.withOpacity(0.1),
      ),
      validator: validator,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }
}