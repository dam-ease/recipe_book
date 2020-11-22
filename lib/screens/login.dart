import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:recipe_book/components/rounded_button.dart';
import 'package:recipe_book/constants.dart';
import 'package:recipe_book/screens/welcome.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _auth = FirebaseAuth.instance;
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text("OK"),
    );
    AlertDialog alert = AlertDialog(
      title: Text('Error'),
      content: Text('No Field should be empty'),
      actions: [
        okButton,
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  checkIfEmpty() async {
    String email, password;
    email = textController1.text;
    password = textController2.text;

    if (email == '' || password == '') {
      showAlertDialog(context);
    } else {
      setState(() {
        showSpinner = true;
      });
      try {
        final newUser = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        if (newUser != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Welcome();
          }));
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text('Invalid Login Credentials'),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("OK"),
                    ),
                  ],
                );
              });
        }
        setState(() {
          showSpinner = false;
        });
      } catch (e) {
        print(e);
      }
    }
  }

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: EdgeInsets.fromLTRB(20, 89, 20, 50),
                constraints: BoxConstraints.expand(),
                child: SafeArea(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Welcome to',
                        style: kFirstStyle,
                      ),
                      Text(
                        'Recipe Book',
                        style: kSecondStyle,
                      ),
                      SizedBox(
                        height: 73.5,
                      ),
                      TextFormField(
                        controller: textController1,
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                            kInputDecoration.copyWith(hintText: 'Email'),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        controller: textController2,
                        obscureText: true,
                        decoration:
                            kInputDecoration.copyWith(hintText: 'Password'),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      GestureDetector(
                        child: Text(
                          'Forgot Password?',
                          style: kForgotStyle,
                          textAlign: TextAlign.right,
                        ),
                        onTap: () {
                          print('User has forgotten password');
                        },
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          checkIfEmpty();
                        },
                        child: RoundedButton(
                          displayText: 'Login',
                          bgColor: Colors.white,
                          textColor: Color.fromRGBO(52, 168, 83, 0.8),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('or',
                          style: kForgotStyle, textAlign: TextAlign.center),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          print('Create an account');
                        },
                        child: RoundedButton(
                          displayText: 'Create an account',
                          bgColor: Color.fromRGBO(52, 168, 83, 0.8),
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )),
              ),
              Positioned(
                  top: 125.0,
                  right: 20.0,
                  child: Container(
                    height: 52.0,
                    width: 52.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("images/logo.png"),
                      fit: BoxFit.contain,
                    )),
                  ))
            ],
          )),
    );
  }
}
