import 'package:flutter/material.dart';
import 'package:interview_task/screens/home/widget/counter.dart';
import 'package:interview_task/widgets/custom_app_bar.dart';
import 'package:interview_task/screens/home/widget/custom_drawer.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_screen';
  final String uid;

  const HomePage({Key key, this.uid}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'New Startup',
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Counter(uid: widget.uid),
      ),
    );
  }
}
