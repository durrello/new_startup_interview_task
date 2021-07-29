import 'package:flutter/material.dart';
import 'package:interview_task/service/authentication.dart';
import 'package:interview_task/theme/theme.dart';
import 'package:interview_task/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  static String id = 'profile_screen';
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    ProviderState _providerState =
        Provider.of<ProviderState>(context, listen: false);
    return Scaffold(
      backgroundColor: bgColorScreen,
      appBar: CustomAppBar(title: 'Profile'),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Ink(
                    height: 200,
                    color: primaryColor,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 110),
                    child: Column(
                      children: <Widget>[
                        Stack(children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: CircleAvatar(
                              backgroundColor: white,
                              radius: 60,
                              backgroundImage:
                                  AssetImage('assets/images/logo.png'),
                            ),
                          ),
                        ]),
                        Container(
                          margin: const EdgeInsets.all(10),
                          alignment: AlignmentDirectional.center,
                          child: Column(
                            children: <Widget>[
                              Text('New StartUp',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Card(
                  color: Colors.white,
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.email, color: primaryColor),
                              title: Text("Name",
                                  style: TextStyle(fontSize: 18, color: black)),
                              subtitle: Text('${_providerState.getName}',
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.phone, color: primaryColor),
                              title: Text("E-Mail",
                                  style: TextStyle(fontSize: 18, color: black)),
                              subtitle: Text('${_providerState.getEmail}',
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
