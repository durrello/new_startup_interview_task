import 'package:flutter/material.dart';
import 'package:interview_task/theme/theme.dart';
import 'package:interview_task/widgets/custom_app_bar.dart';
import 'package:interview_task/screens/home/widget/custom_drawer.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_screen';

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variables to hold count.
  int _counter = 0;

  void increment() {
    setState(() {
      _counter++;
    });
  }

  void decrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'New Startup',
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$_counter',
            style: TextStyle(fontSize: 80.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Floating action button to handle decrementation.
              FloatingActionButton(
                onPressed: decrement,
                backgroundColor: warning,
                child: Icon(Icons.remove),
              ),

              SizedBox(width: 20.0),

              // Floating action button to handle incrementation.
              FloatingActionButton(
                onPressed: increment,
                backgroundColor: primaryColor,
                child: Icon(Icons.add),
              ),
            ],
          )
        ],
      ))),
    );
  }
}
