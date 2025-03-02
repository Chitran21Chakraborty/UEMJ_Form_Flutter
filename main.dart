import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:myapp/data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBZz2OmV1qC32bRhvUa1RAhyq6lq3JhbZg",
      authDomain: "uem-jaipur-f94a5.firebaseapp.com",
      projectId: "uem-jaipur-f94a5",
      storageBucket: "uem-jaipur-f94a5.appspot.com",
      messagingSenderId: "31729094540",
      appId: "1:31729094540:web:f4d82212368dbb7b07d0a9",
      measurementId: "G-ZYHDBG6HJK",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _address = TextEditingController();

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _gender.dispose();
    _mobileNumber.dispose();
    _address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'UEM Jaipur Registration Form',
      home: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Image.asset('assets/uemjlogo.png', height: 50, width: 50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("FORM"),
              ),
              InkWell(
                onTap: () {

                  Get.to(() => DateClass());
                  
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("DATA"),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset("assets/uemjlogo.png", height: 50, width: 50),
              SizedBox(width: 100),
              const Text('REGISTRATION FORM'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(_firstName, "First Name"),
              _buildTextField(_lastName, "Last Name"),
              _buildTextField(_gender, "Gender"),
              _buildTextField(_address, "Address"),
              _buildTextField(_mobileNumber, "Phone Number"),
              TextButton(
                onPressed: () {
                  FirebaseFirestore db = FirebaseFirestore.instance;
                  db.collection('registrations').add({
                    'firstName': _firstName.text,
                    'lastName': _lastName.text,
                    'gender': _gender.text,
                    'address': _address.text,
                    'mobileNumber': _mobileNumber.text,
                  });
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
