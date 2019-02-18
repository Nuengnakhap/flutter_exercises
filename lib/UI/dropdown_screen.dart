import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class DropdownScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DropdownScreenState();
  }
}

class DropdownScreenState extends State<DropdownScreen> {
  List<String> _passengers = <String>['', '1', '2', '3', '4', '5'];
  String _passenger = '1';

  final formats = {
    InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };
  InputType inputType = InputType.both;
  bool editable = true;
  DateTime date;

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdowm Screen'),
      ),
      body: Column(
        children: <Widget>[
          _image == null
              ? new Text('No image selected.')
              : new Image.file(_image),
          InputDecorator(
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Passenger',
            ),
            isEmpty: _passenger == '',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _passenger,
                isDense: true,
                onChanged: (String value) {
                  setState(() {
                    _passenger = value;
                  });
                },
                items: _passengers.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          DateTimePickerFormField(
            inputType: InputType.date,
            format: formats[inputType],
            decoration: InputDecoration(labelText: 'Date/Time'),
          ),
          FloatingActionButton(
            onPressed: getImage,
            tooltip: 'Pick Image',
            child: Icon(Icons.add_a_photo),
          )
        ],
      ),
    );
  }
}
