import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) return "Email is required";
                },
              ),
              TextFormField(
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty && value.length < 8)
                      return "Password is required";
                  }),
              TextFormField(
                  decoration: InputDecoration(labelText: "Re Password"),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) return "Re Password is required";
                  }),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      child: Text('Register'),
                      onPressed: () {
                        auth
                            .createUserWithEmailAndPassword(
                                email: '60070005@kmitl.ac.th', password: 'password')
                            .then((FirebaseUser user) {
                          user.sendEmailVerification();
                          print('return from firebase $user');
                        }).catchError((error) {
                          print('$error');
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
