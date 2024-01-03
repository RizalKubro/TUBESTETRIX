// import 'package:flutter/material.dart';
// import 'package:tetrix/auth/appwrite.dart';
// import 'package:tetrix/auth/login_cred.dart';
// import 'package:tetrix/panel/page_land.dart';
// import 'package:tetrix/panel/page_potrait.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({Key? key}) : super(key: key);

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final LoginCredModel _loginCredModel = LoginCredModel();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Signup'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               // Email textfield
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
//                 validator: (value) =>
//                     value!.length < 6 ? 'Password must be at least 6 characters' : null,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();

//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Creating user...')),
//                     );

//                     try {
//                       bool result = await AuthHelper.instance.signUpEmailPassword(
//                         _loginCredModel.email!,
//                         _loginCredModel.password!,
//                       );

//                       if (result) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Create account')),
//                         );
//                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => _HomePage()));
//                       }
//                     } catch (e) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text(e.toString())),
//                       );
//                     }
//                   }
//                 },
//                 child: const Text('Create account'),
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
//     //only Android/iOS support land mode
//     bool land = MediaQuery.of(context).orientation == Orientation.landscape;
//     return land ? PageLand() : PagePortrait();
//   }
// }