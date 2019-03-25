import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    if (value.isEmpty) return "Password is required";
                  }),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      child: Text('Sign In'),
                      onPressed: () {
                        _auth
                            .signInWithEmailAndPassword(
                                email: '60070005@kmitl.ac.th', password: 'password')
                            .then((FirebaseUser user) {
                          if (user.isEmailVerified) {
                            print('go to home screen');
                          } else {
                            print(
                                'Please check your email to verified account');
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              FlatButton(
                child: Text('Register new user'),
                onPressed: () {
                  Navigator.pushNamed(context, "/register");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
