import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookScreen extends StatefulWidget {
  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController author = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: title,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please fill title';
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Author'),
                  controller: author,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please fill author';
                    }
                  },
                ),
                RaisedButton(
                  child: Text('Save'),
                  onPressed: () {
                    if (_formkey.currentState.validate()) {
                      Firestore.instance.collection('books').document('X1').setData({
                        'title': title.text,
                        'author': author.text,
                      }).then((onValue) {
                        
                      });
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
