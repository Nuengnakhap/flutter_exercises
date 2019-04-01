import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection('books').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: snapshot.data[index]['title'],
                  subtitle: snapshot.data[index]['author'],
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
