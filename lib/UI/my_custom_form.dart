import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Form'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Image.asset(
              'resources/Tulips.jpg',
              height: 200,
            ),
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'User ID',
                    icon: Icon(Icons.people),
                    hintText: 'Please input your email'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => print(value),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                }),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
                hintText: 'Please input your password',
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
              onSaved: (value) => print(value),
            ),
            RaisedButton(
              child: Text('Continue'),
              onPressed: () {
                _formKey.currentState.validate();
              },
            )
          ],
        ),
      ),
    );
  }
}
