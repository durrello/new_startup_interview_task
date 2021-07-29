import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:interview_task/service/authentication.dart';
import 'package:interview_task/theme/theme.dart';
import 'package:provider/provider.dart';

class Counter extends StatefulWidget {
  final uid;
  const Counter({Key key, this.uid}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    setCounter();
  }

  setCounter() {
    FirebaseFirestore.instance
        .collection('newstartup')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["counter"]);
        setState(() {
          _counter = doc['counter'];
        });
      });
    });
  }

  void increment(_providerState) {
    Firestore.instance
        .collection('newstartup')
        .doc('${_providerState.getUid}')
        .update({"counter": _counter++});
  }

  void decrement(_providerState) {
    Firestore.instance
        .collection('newstartup')
        .doc('${_providerState.getUid}')
        .update({"counter": _counter--});
  }

  @override
  Widget build(BuildContext context) {
    ProviderState _providerState =
        Provider.of<ProviderState>(context, listen: false);

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('newstartup')
          .doc('${_providerState.getUid}')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                snapshot.data.data()["counter"].toString(),
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
                    onPressed: () => decrement(_providerState),
                    backgroundColor: warning,
                    child: Icon(Icons.remove),
                  ),

                  SizedBox(width: 20.0),

                  // Floating action button to handle incrementation.
                  FloatingActionButton(
                    onPressed: () => increment(_providerState),
                    backgroundColor: primaryColor,
                    child: Icon(Icons.add),
                  ),
                ],
              )
            ],
          ));
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
