import 'package:flutter/material.dart';
import 'package:interview_task/widgets/custom_app_bar.dart';
import 'package:interview_task/theme/theme.dart';

class AboutPage extends StatefulWidget {
  static String id = 'about_page';
  const AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

const String question =
    "Question: Build an App using provider pattern for state management with the following features:\n \n - Login user using google authentication in flutter. \n - Connect to firebase real time database. \n - Show an increment button and display a variable with its value. \n - Fetch the current value of the variable for the logged in user. \n - Each user could have different values for the variable. So the variable value must be stored in the database.  \n     * When the increment button is clicked increase the variable value and update it in the real time database.In the realtime database each user has a value field. When a user logs in for the first time an entry has to be created in the database with the variable value as 0. Then when the variable is updated in the UI the database needs to be updated.";

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'About'),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(2),
            child: ListView(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset('assets/images/logo.png'),
                ),
                Text(
                  'New StartUp interview task'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    question,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'By'.toUpperCase(),
                            style: TextStyle(color: Colors.black, fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(
                                text: '\nDurrell Gemuh Abwoengmo'.toUpperCase(),
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ]),
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
