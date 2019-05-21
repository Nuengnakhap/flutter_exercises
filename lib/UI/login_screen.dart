import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: email,
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) return "Email is required";
                },
              ),
              TextFormField(
                controller: password,
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
                                email: email.text,
                                password: password.text)
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
