import 'package:flutter/material.dart';
import 'package:interview_task/screens/auth/login/widget/first_time.dart';
import 'package:interview_task/screens/auth/login/widget/vertical_text.dart';
import 'package:interview_task/screens/home/page/home_page.dart';
import 'package:interview_task/theme/theme.dart';
import 'package:interview_task/widgets/snackbar.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  Future registerUser() async {
    setState(() {
      _isLoading = true;
    });

    if (loginEmailController.text == '' || loginPasswordController.text == '') {
      setState(() {
        _isLoading = false;
      });
      CustomSnackBar(context, Text('Please fill the empty field(s)'),
          backgroundColor: warning);
    } else {
      if (loginPasswordController.text.length < 8) {
        setState(() {
          _isLoading = false;
        });
        CustomSnackBar(context, Text('At least 8 character password needed'),
            backgroundColor: warning);
      } else {
        if (!RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(loginEmailController.text)) {
          setState(() {
            _isLoading = false;
          });
          CustomSnackBar(context, Text('Please Enter a valid Email'),
              backgroundColor: warning);
        } else {
          // Login user
          setState(() {
            _isLoading = false;
          });
          Navigator.pushNamed(context, HomePage.id);
          CustomSnackBar(context, Text('Welcome to New Startup'),
              backgroundColor: success);
        }
      }
    }
  }

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorScreen,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color.fromRGBO(23, 43, 77, 1.0), Color(0xff324BCD)]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    VerticalText(),
                    Container(
                        margin: EdgeInsets.only(top: 55),
                        child:
                            Image.asset('assets/images/logo.png', width: 150))
                  ]),

              //user email
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: loginEmailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: primaryColor,
                      icon: Icon(Icons.email, color: white),
                      labelText: 'E-mail',
                      labelStyle: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: loginPasswordController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.lock, color: white),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Spacer(),
                  Container(
                    child: _isLoading == true
                        ? Container(
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 42.0),
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.green),
                                    backgroundColor: white,
                                  ),
                                ),
                                const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 42.0),
                                    child: Text(
                                      'Please wait...',
                                      style: TextStyle(color: white),
                                    )),
                              ],
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.all(20),
                            child: ElevatedButton(
                              onPressed: () {
                                registerUser();
                              },
                              child: Text(
                                'Login'.toUpperCase(),
                                style: TextStyle(color: primaryColor),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: white,
                              ),
                            ),
                          ),
                  )
                ],
              ),
              FirstTime(),
            ],
          ),
        ),
      ),
    );
  }
}
