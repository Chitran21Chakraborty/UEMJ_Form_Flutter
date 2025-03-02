import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataClass extends StatefulWidget {
  const DataClass({super.key});

  @override
  State<DataClass> createState() => _DataClassState();
}

class _DataClassState extends State<DataClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data")),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('registration').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "First Name - " +
                            snapshot.data!.docs[index]['firstName'],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Last Name - " + snapshot.data!.docs[index]['lastName'],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Gender - " + snapshot.data!.docs[index]['gender'],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Address - " + snapshot.data!.docs[index]['address'],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Mobile Number - " +
                            snapshot.data!.docs[index]['mobileNumber'],
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          } else {
            return Text("No Data Found");
          }
        },
      ),
    );
  }
}