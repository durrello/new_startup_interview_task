import 'package:flutter/material.dart';
import 'package:interview_task/service/authentication.dart';
import 'package:interview_task/screens/about/page/about_page.dart';
import 'package:interview_task/screens/home/page/home_page.dart';
import 'package:interview_task/screens/profile/page/profile_page.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProviderState _providerState =
        Provider.of<ProviderState>(context, listen: false);

    String mainProfilePic = "assets/images/logo.png";

    return Drawer(
        child: ListView(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/register-bg.png")),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Name: ${_providerState.getName}"),
                accountEmail: Text("Email : ${_providerState.getEmail}"),
                currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundImage: AssetImage(mainProfilePic),
                    ),
                    onTap: () => print("Current User")),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/register-bg.png")),
                ),
              ),
            ],
          ),
        ),
        ListTile(
            title: Text("Home"),
            trailing: Icon(Icons.menu),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, HomePage.id);
            }),
        ListTile(
            title: Text("Profile"),
            trailing: Icon(Icons.person),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, ProfilePage.id);
            }),
        ListTile(
            title: Text("About"),
            trailing: Icon(Icons.info),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, AboutPage.id);
            }),
        Divider(
          thickness: 1.0,
        ),
        ListTile(
          title: Text("Close"),
          trailing: Icon(Icons.cancel),
          onTap: () => Navigator.of(context).pop(),
        ),
      ],
    ));
  }
}
