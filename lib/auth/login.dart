// import 'package:flutter/material.dart';
// import 'package:tetrix/auth/appwrite.dart';
// import 'package:tetrix/auth/login_cred.dart';
// import 'package:tetrix/auth/sign_up.dart';
// import 'package:tetrix/panel/page_land.dart';
// import 'package:tetrix/panel/page_potrait.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final LoginCredModel _loginCredModel = LoginCredModel();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//         backgroundColor: Colors.black,
//       ),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               TextFormField(
//                 style: TextStyle(color: Colors.white),
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                 ),
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//                 onSaved: (newValue) => _loginCredModel.email = newValue!,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 style: TextStyle(color: Colors.white),
//                 decoration: const InputDecoration(
//                   labelText: 'Password',
//                 ),
//                 onSaved: (newValue) => _loginCredModel.password = newValue!,
//                 validator: (value) => value!.length < 6
//                     ? 'Password must be at least 6 characters'
//                     : null,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();

//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Logging in...')),
//                     );

//                     try {
//                       bool result =
//                           await AuthHelper.instance.loginEmailPassword(
//                         _loginCredModel.email!,
//                         _loginCredModel.password!,
//                       );
//                       if (result) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Logged in')),
//                         );
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (_) => _HomePage()),
//                         );
//                       }
//                     } catch (e) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text(e.toString())),
//                       );
//                     }
//                   }
//                 },
//                 child: const Text(
//                   'Submit',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SignupScreen(),
//                     ),
//                   );
//                 },
//                 child: Text(
//                   "Don't have an account? Sign up",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// class _HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // only Android/iOS support land mode
//     bool land = MediaQuery.of(context).orientation == Orientation.landscape;
//     return land ? PageLand() : PagePortrait();
//   }
// }