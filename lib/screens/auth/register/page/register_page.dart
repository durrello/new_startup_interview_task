import 'package:flutter/material.dart';
import 'package:interview_task/service/authentication.dart';
import 'package:interview_task/screens/home/page/home_page.dart';
import 'package:interview_task/theme/theme.dart';
import 'package:interview_task/widgets/snackbar.dart';
import 'package:provider/provider.dart';

import '../widgets/old_user.dart';
import '../widgets/sign_up_text.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'register_page';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Future registerUser(
      String email, String password, String name, BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    if (signupNameController.text == '' ||
        loginEmailController.text == '' ||
        signupPasswordController.text == '' ||
        signupConfirmPasswordController.text == '') {
      setState(() {
        _isLoading = false;
      });
      CustomSnackBar(context, Text('Please fill the empty field(s)'),
          backgroundColor: warning);
    } else {
      if (signupNameController.text.length < 8) {
        setState(() {
          _isLoading = false;
        });
        CustomSnackBar(context, Text('Name cannot be less than 8 characters'),
            backgroundColor: warning);
      } else {
        if (signupPasswordController.text.length < 8 &&
            signupConfirmPasswordController.text.length < 8) {
          setState(() {
            _isLoading = false;
          });
          CustomSnackBar(context, Text('At least 8 character password needed'),
              backgroundColor: warning);
        } else {
          if (signupConfirmPasswordController.text !=
              signupPasswordController.text) {
            setState(() {
              _isLoading = false;
            });
            CustomSnackBar(context, Text('Passwords don\'t match'),
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
              // Register user.
              ProviderState _providerState =
                  Provider.of<ProviderState>(context, listen: false);
              try {
                if (await _providerState.signUpUser(email, password, name)) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage(uid: _providerState.getUid)));
                }
              } catch (e) {
                print(e);
              }
              setState(() {
                _isLoading = false;
              });
              CustomSnackBar(context, Text('Welcome to New Startup'),
                  backgroundColor: success);
            }
          }
        }
      }
    }
  }

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupConfirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    signupNameController.dispose();
    loginEmailController.dispose();
    signupPasswordController.dispose();
    signupConfirmPasswordController.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color.fromRGBO(23, 43, 77, 1.0), Color(0xff324BCD)]),
        ),
        child: ListView(
          children: <Widget>[
            Row(children: <Widget>[
              SignUp(),
              Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Image.asset('assets/images/logo.png', width: 150))
            ]),

            //user name
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: signupNameController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.lightBlueAccent,
                    icon: Icon(Icons.person, color: white),
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ),

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
                    fillColor: Colors.lightBlueAccent,
                    icon: Icon(Icons.email, color: white),
                    labelText: 'E-mail',
                    labelStyle: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ),

            //user password
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: signupPasswordController,
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
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: signupConfirmPasswordController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.lock, color: white),
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ),
            _isLoading == true
                ? Row(
                    children: [
                      Spacer(),
                      Container(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 42.0),
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(primaryColor),
                            backgroundColor: white,
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Spacer(),
                      MaterialButton(
                        color: white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                              color: primaryColor, fontFamily: 'WorkSansBold'),
                        ),
                        onPressed: () => registerUser(
                            loginEmailController.text,
                            signupPasswordController.text,
                            signupNameController.text,
                            context),
                      ),
                      SizedBox(width: 10)
                    ],
                  ),
            UserOld(),
          ],
        ),
      ),
    ));
  }
}
