import 'package:flutter/material.dart';
import 'package:lab_i/UI/book_screen.dart';
import 'package:lab_i/UI/dropdown_screen.dart';
import 'package:lab_i/UI/http-json.dart';
import 'package:lab_i/UI/list_view_posts.dart';
import 'package:lab_i/UI/login_screen.dart';
import 'package:lab_i/UI/todo_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Exercises'),
          centerTitle: true,
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              // height: 300.0,
              width: double.infinity,
              color: Theme.of(context).accentColor,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Image.asset('resources/flutter.png'),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(10.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                          child: Text(
                            'FLUTTER EXERCIES',
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        width: double.infinity,
                      ),
                    )
                  ],
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                Card(
                  child: InkWell(
                    splashColor: Colors.teal.withAlpha(30),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DropdownScreen()));
                    },
                    child: Container(
                      width: 300,
                      height: 100,
                      child: Center(child: Text('DROP DOWN SCREEN')),
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    splashColor: Colors.teal.withAlpha(30),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TodoScreen()));
                    },
                    child: Container(
                      width: 300,
                      height: 100,
                      child: Center(child: Text('TODO SCREEN')),
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    splashColor: Colors.teal.withAlpha(30),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BookScreen()));
                    },
                    child: Container(
                      width: 300,
                      height: 100,
                      child: Center(child: Text('BOOK SCREEN [FIREBASE]')),
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    splashColor: Colors.teal.withAlpha(30),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HttpJsonScreen()));
                    },
                    child: Container(
                      width: 300,
                      height: 100,
                      child: Center(child: Text('LIST POST')),
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    splashColor: Colors.teal.withAlpha(30),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Container(
                      width: 300,
                      height: 100,
                      child: Center(child: Text('LOGIN SCREEN')),
                    ),
                  ),
                ),
                
              ],
            ),
            Container()
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.view_compact),
            ),
            Tab(
              icon: Icon(Icons.explore),
            ),
          ],
          labelColor: Colors.teal,
        ),
      ),
    );
  }
}
